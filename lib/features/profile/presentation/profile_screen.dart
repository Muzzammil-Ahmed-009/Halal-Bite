import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/firebase_error_handler.dart';
import '../../auth/data/auth_repository.dart';
import '../data/preferences_repository.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isUploadingProfile = false;

  User? get user => FirebaseAuth.instance.currentUser;
  String _userName = 'Guest User';

  @override
  void initState() {
    super.initState();
    _userName = user?.displayName ?? 'Guest User';
    if (_userName.isEmpty) _userName = 'Guest User';
  }

  Future<void> _editName() async {
    final controller = TextEditingController(text: _userName);
    final newName = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter your name'),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, controller.text);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (newName != null && newName.trim().isNotEmpty) {
      setState(() => _userName = newName.trim());
      await user?.updateDisplayName(newName.trim());
    }
  }

  Future<void> _handleAvatarTap() async {
    if (user?.photoURL == null) {
      await _pickAndUploadImage();
      return;
    }

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_rounded, color: AppColors.primary),
              title: const Text('Update Photo'),
              onTap: () {
                Navigator.pop(context);
                _pickAndUploadImage();
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline_rounded, color: AppColors.haram),
              title: const Text('Remove Photo', style: TextStyle(color: AppColors.haram)),
              onTap: () {
                Navigator.pop(context);
                _removeProfileImage();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _removeProfileImage() async {
    final photoURL = user?.photoURL;
    if (photoURL == null) return;

    setState(() => _isUploadingProfile = true);
    try {
      // Delete from Storage
      try {
        final oldRef = FirebaseStorage.instance.refFromURL(photoURL);
        await oldRef.delete();
      } catch (e) {
        debugPrint('Failed to delete old image from storage: $e');
      }

      await user?.updatePhotoURL(null);
      await user?.reload();

      if (mounted) {
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile picture removed!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(FirebaseErrorHandler.getFriendlyMessage(e))),
        );
      }
    } finally {
      if (mounted) setState(() => _isUploadingProfile = false);
    }
  }

  Future<void> _pickAndUploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    
    if (image == null) return;

    // Crop the image
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Adjust Profile Picture',
            toolbarColor: AppColors.primary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
            hideBottomControls: false),
        IOSUiSettings(
          title: 'Adjust Profile Picture',
          aspectRatioLockEnabled: true,
          resetButtonHidden: true,
        ),
      ],
    );

    if (croppedFile == null) return;

    setState(() => _isUploadingProfile = true);

    try {
      final file = File(croppedFile.path);
      
      // Attempt to delete old image if it exists
      if (user?.photoURL != null) {
        try {
          final oldRef = FirebaseStorage.instance.refFromURL(user!.photoURL!);
          await oldRef.delete();
        } catch (e) {
          debugPrint('Failed to delete old image (might not exist): $e');
        }
      }

      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final ref = FirebaseStorage.instance
          .ref()
          .child('users')
          .child(user?.uid ?? 'unknown')
          .child('profile_images')
          .child(fileName);
          
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path},
      );
          
      await ref.putFile(file, metadata);
      final downloadUrl = await ref.getDownloadURL();
      
      await user?.updatePhotoURL(downloadUrl);
      
      await user?.reload();
      
      if (mounted) {
        setState(() {}); 
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile picture updated successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(FirebaseErrorHandler.getFriendlyMessage(e))),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isUploadingProfile = false);
      }
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out of your account?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            onPressed: () async {
              final goRouter = GoRouter.of(context);
              Navigator.pop(context);
              await ref.read(authRepositoryProvider).signOut();
              goRouter.go('/auth');
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.haram),
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prefs = ref.watch(preferencesProvider);
    final prefsNotifier = ref.read(preferencesProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Profile header
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 24, bottom: 32),
              decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
              child: Column(
                children: [
                  // Avatar
                  GestureDetector(
                    onTap: _handleAvatarTap,
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 2),
                            image: user?.photoURL != null 
                              ? DecorationImage(
                                  image: NetworkImage(user!.photoURL!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          ),
                          child: user?.photoURL == null 
                              ? const Icon(Icons.person_rounded, size: 60, color: Colors.white)
                              : null,
                        ),
                        if (_isUploadingProfile)
                          const Positioned.fill(
                            child: CircularProgressIndicator(color: Colors.white),
                          ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.accent,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.primary, width: 2),
                            ),
                            child: const Icon(Icons.edit_rounded, size: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: _editName,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _userName,
                          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.edit_rounded, size: 16, color: Colors.white.withValues(alpha: 0.7)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user?.email ?? 'guest@halalbite.app',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dietary section
                  Text('Dietary Preferences', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  const Text(
                    'Customize how Halal Bite evaluates your food',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
                  ),


                  if (FirebaseAuth.instance.currentUser?.isAnonymous == true)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.textHint.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.lock_rounded, color: AppColors.textSecondary, size: 32),
                          const SizedBox(height: 12),
                          const Text(
                            'Do you have any allergies? Create an account to build your custom dietary profile.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => context.go('/auth'),
                            child: const Text('Create Account'),
                          )
                        ],
                      ),
                    )
                  else ...[
                    _buildToggle('Strict Halal Mode', 'Doubtful items are flagged as Haram', Icons.shield_rounded, prefs.strictHalal,
                        (v) => prefsNotifier.updateStrictHalal(v)),
                    _buildToggle('Lactose Intolerant', 'Warn about dairy-based ingredients', Icons.no_food_rounded, prefs.lactoseIntolerant,
                        (v) => prefsNotifier.updateLactoseIntolerant(v)),
                    _buildToggle('Nut Allergy', 'Alert for any nut-based ingredients', Icons.warning_amber_rounded, prefs.nutAllergy,
                        (v) => prefsNotifier.updateNutAllergy(v)),
                    _buildToggle('Vegan Mode', 'Flag all animal-derived ingredients', Icons.eco_rounded, prefs.veganMode,
                        (v) => prefsNotifier.updateVeganMode(v)),
                  ],


                  const SizedBox(height: 28),

                  // General section
                  Text('General', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  _buildMenuItem(Icons.info_outline_rounded, 'About Halal Bite', () {
                    showAboutDialog(
                      context: context,
                      applicationName: 'Halal Bite',
                      applicationVersion: '1.0.0',
                      applicationLegalese: '© 2026 Halal Bite. All rights reserved.\nDeveloped by 𝓜𝓾𝔃𝔃𝓪𝓶𝓶𝓲𝓵 𝓐𝓱𝓶𝓮𝓭',
                    );
                  }),
                  _buildMenuItem(Icons.privacy_tip_outlined, 'Privacy Policy', () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Privacy Policy'),
                        content: const SingleChildScrollView(
                          child: Text(
                            'Halal Bite is committed to protecting your privacy. We do not sell your personal data. '
                            'Dietary preferences and scan history are stored securely and used only to improve your experience.\n\n'
                            'Images processed by the AI scanner are analyzed in real-time and are not permanently stored on our servers unless explicitly requested.',
                            style: TextStyle(height: 1.5),
                          ),
                        ),
                        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
                      ),
                    );
                  }),
                  _buildMenuItem(Icons.description_outlined, 'Terms of Service', () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Terms of Service'),
                        content: const SingleChildScrollView(
                          child: Text(
                            'By using Halal Bite, you agree to these terms:\n\n'
                            '1. The ingredient classifications provided by Halal Bite are based on available database information and AI analysis. '
                            'They are for informational purposes only.\n'
                            '2. Halal Bite does not guarantee 100% accuracy and is not a substitute for official Halal certification bodies.\n'
                            '3. You are responsible for verifying any critical dietary restrictions manually.',
                            style: TextStyle(height: 1.5),
                          ),
                        ),
                        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
                      ),
                    );
                  }),
                  _buildMenuItem(Icons.star_outline_rounded, 'Rate this App', () {
                    showDialog(
                      context: context,
                      builder: (context) => const AnimatedRatingDialog(),
                    );
                  }),
                  const SizedBox(height: 12),
                  _buildMenuItem(Icons.logout_rounded, 'Log Out', _showLogoutDialog, isDestructive: true),
                  const SizedBox(height: 32),

                  // Version
                  const Center(
                    child: Text(
                      'Halal Bite v1.0.0',
                      style: TextStyle(color: AppColors.textHint, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggle(String title, String subtitle, IconData icon, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            activeTrackColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    final color = isDestructive ? AppColors.haram : AppColors.textPrimary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 14),
            Expanded(child: Text(title, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.w500))),
            if (!isDestructive) const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: AppColors.textHint),
          ],
        ),
      ),
    );
  }
}

class AnimatedRatingDialog extends StatefulWidget {
  const AnimatedRatingDialog({super.key});

  @override
  State<AnimatedRatingDialog> createState() => _AnimatedRatingDialogState();
}

class _AnimatedRatingDialogState extends State<AnimatedRatingDialog> {
  int _selectedStars = 0;
  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    if (_submitted) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_rounded, color: AppColors.halal, size: 60),
            const SizedBox(height: 16),
            const Text('Thank You!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Your feedback helps us improve Halal Bite.', textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              child: const Text('Close'),
            )
          ],
        ),
      );
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text('Rate Halal Bite', textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('How has your experience been so far?', textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final isSelected = index < _selectedStars;
              return GestureDetector(
                onTap: () => setState(() => _selectedStars = index + 1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    isSelected ? Icons.star_rounded : Icons.star_outline_rounded,
                    size: 40,
                    color: isSelected ? Colors.amber : Colors.grey.shade300,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _selectedStars > 0 ? () => setState(() => _submitted = true) : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
