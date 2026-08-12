import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ur')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'ClearBite'**
  String get appName;

  /// No description provided for @scanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan Barcode'**
  String get scanBarcode;

  /// No description provided for @scanIngredients.
  ///
  /// In en, this message translates to:
  /// **'Scan Ingredients'**
  String get scanIngredients;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @productNotFound.
  ///
  /// In en, this message translates to:
  /// **'Product Not Found'**
  String get productNotFound;

  /// No description provided for @halal.
  ///
  /// In en, this message translates to:
  /// **'Halal'**
  String get halal;

  /// No description provided for @haram.
  ///
  /// In en, this message translates to:
  /// **'Haram'**
  String get haram;

  /// No description provided for @mushbooh.
  ///
  /// In en, this message translates to:
  /// **'Mushbooh'**
  String get mushbooh;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @healthWarning.
  ///
  /// In en, this message translates to:
  /// **'Health & Dietary Warnings'**
  String get healthWarning;

  /// No description provided for @detailedAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Detailed Analysis'**
  String get detailedAnalysis;

  /// No description provided for @confidenceScore.
  ///
  /// In en, this message translates to:
  /// **'Confidence Score'**
  String get confidenceScore;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get continueAsGuest;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @reportMistake.
  ///
  /// In en, this message translates to:
  /// **'Report Inaccuracy / Ask a Scholar'**
  String get reportMistake;

  /// No description provided for @reportTypeWrong.
  ///
  /// In en, this message translates to:
  /// **'AI is wrong (Incorrect Status)'**
  String get reportTypeWrong;

  /// No description provided for @reportTypeMissing.
  ///
  /// In en, this message translates to:
  /// **'Missing or Misread Ingredient'**
  String get reportTypeMissing;

  /// No description provided for @reportTypeDoubtful.
  ///
  /// In en, this message translates to:
  /// **'Ask a Scholar (Doubtful/Complex Item)'**
  String get reportTypeDoubtful;

  /// No description provided for @submitReport.
  ///
  /// In en, this message translates to:
  /// **'Submit Report'**
  String get submitReport;

  /// No description provided for @ingredientsAnalyzed.
  ///
  /// In en, this message translates to:
  /// **'{count} ingredients analyzed'**
  String ingredientsAnalyzed(int count);

  /// No description provided for @guestLimitReached.
  ///
  /// In en, this message translates to:
  /// **'You have completed your free guest scans! Please create a free account to continue scanning.'**
  String get guestLimitReached;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Scan Any Label or Barcode'**
  String get onboardingTitle1;

  /// No description provided for @onboardingSubtitle1.
  ///
  /// In en, this message translates to:
  /// **'Instantly analyze ingredients from a photo, or scan millions of products instantly using our local offline database.'**
  String get onboardingSubtitle1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'AI-Powered Halal Analysis'**
  String get onboardingTitle2;

  /// No description provided for @onboardingSubtitle2.
  ///
  /// In en, this message translates to:
  /// **'Unsure about an E-number or complex ingredient? Our advanced AI analyzes and explains the religious status of any obscure component.'**
  String get onboardingSubtitle2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Custom Dietary Profiles'**
  String get onboardingTitle3;

  /// No description provided for @onboardingSubtitle3.
  ///
  /// In en, this message translates to:
  /// **'Set personalized alerts for Lactose intolerance, Nut allergies, or Vegan preferences. We\'ll warn you if a product doesn\'t match your lifestyle.'**
  String get onboardingSubtitle3;

  /// No description provided for @onboardingTitle4.
  ///
  /// In en, this message translates to:
  /// **'Expert Oversight'**
  String get onboardingTitle4;

  /// No description provided for @onboardingSubtitle4.
  ///
  /// In en, this message translates to:
  /// **'Encounter a doubtful item? Flag it instantly in the app to ask a scholar. Our team reviews feedback to ensure maximum accuracy.'**
  String get onboardingSubtitle4;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @continueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// No description provided for @searchingProduct.
  ///
  /// In en, this message translates to:
  /// **'Searching Product Database...'**
  String get searchingProduct;

  /// No description provided for @productNotFoundBody.
  ///
  /// In en, this message translates to:
  /// **'We could not find this product in our database. Please scan the ingredient label instead.'**
  String get productNotFoundBody;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @noTextDetected.
  ///
  /// In en, this message translates to:
  /// **'No Text Detected'**
  String get noTextDetected;

  /// No description provided for @noTextDetectedBody.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find any ingredients in that photo. Please ensure the label is well-lit and in focus.'**
  String get noTextDetectedBody;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @analyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing...'**
  String get analyzing;

  /// No description provided for @pointAtIngredientLabel.
  ///
  /// In en, this message translates to:
  /// **'Point at ingredient label'**
  String get pointAtIngredientLabel;

  /// No description provided for @ingredientSearch.
  ///
  /// In en, this message translates to:
  /// **'Ingredient Search'**
  String get ingredientSearch;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or E-Code...'**
  String get searchHint;

  /// No description provided for @searchEmptyState.
  ///
  /// In en, this message translates to:
  /// **'Type an ingredient or E-Number\nto explore our database.'**
  String get searchEmptyState;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @scanHistory.
  ///
  /// In en, this message translates to:
  /// **'Scan History'**
  String get scanHistory;

  /// No description provided for @loginToViewHistory.
  ///
  /// In en, this message translates to:
  /// **'Please log in to view your previously scanned products.'**
  String get loginToViewHistory;

  /// No description provided for @signInOrCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Sign In / Create Account'**
  String get signInOrCreateAccount;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @safe.
  ///
  /// In en, this message translates to:
  /// **'Safe'**
  String get safe;

  /// No description provided for @flagged.
  ///
  /// In en, this message translates to:
  /// **'Flagged'**
  String get flagged;

  /// No description provided for @recentScans.
  ///
  /// In en, this message translates to:
  /// **'Recent Scans'**
  String get recentScans;

  /// No description provided for @safeItems.
  ///
  /// In en, this message translates to:
  /// **'Safe Items'**
  String get safeItems;

  /// No description provided for @flaggedItems.
  ///
  /// In en, this message translates to:
  /// **'Flagged Items'**
  String get flaggedItems;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'items'**
  String get items;

  /// No description provided for @emptyHistory.
  ///
  /// In en, this message translates to:
  /// **'Your scan history is empty.\nStart scanning your first product!'**
  String get emptyHistory;

  /// No description provided for @halalLabel.
  ///
  /// In en, this message translates to:
  /// **'HALAL'**
  String get halalLabel;

  /// No description provided for @haramLabel.
  ///
  /// In en, this message translates to:
  /// **'HARAM'**
  String get haramLabel;

  /// No description provided for @doubtfulLabel.
  ///
  /// In en, this message translates to:
  /// **'DOUBTFUL'**
  String get doubtfulLabel;

  /// No description provided for @unknownLabel.
  ///
  /// In en, this message translates to:
  /// **'UNKNOWN'**
  String get unknownLabel;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @confidenceScoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Confidence Score'**
  String get confidenceScoreLabel;

  /// No description provided for @healthWarningsLabel.
  ///
  /// In en, this message translates to:
  /// **'Health & Dietary Warnings'**
  String get healthWarningsLabel;

  /// No description provided for @scanAnother.
  ///
  /// In en, this message translates to:
  /// **'Scan Another Product'**
  String get scanAnother;

  /// No description provided for @reportIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Report Incorrect Result'**
  String get reportIncorrect;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer: This app uses AI to analyze ingredients. While we strive for accuracy, this is not a substitute for a religious Fatwa. Please verify doubtful items independently.'**
  String get disclaimer;

  /// No description provided for @confidenceHigh.
  ///
  /// In en, this message translates to:
  /// **'High confidence based on exact local database matches.'**
  String get confidenceHigh;

  /// No description provided for @confidenceModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate confidence. Some vague ingredients found.'**
  String get confidenceModerate;

  /// No description provided for @confidenceLow.
  ///
  /// In en, this message translates to:
  /// **'Low confidence. Significant reliance on AI inference for unknown ingredients.'**
  String get confidenceLow;

  /// No description provided for @matchedIsar.
  ///
  /// In en, this message translates to:
  /// **'Matched from Isar DB'**
  String get matchedIsar;

  /// No description provided for @explanation.
  ///
  /// In en, this message translates to:
  /// **'Explanation:'**
  String get explanation;

  /// No description provided for @explanationIsar.
  ///
  /// In en, this message translates to:
  /// **'This ingredient was found in the deterministic rules engine.'**
  String get explanationIsar;

  /// No description provided for @aiInferred.
  ///
  /// In en, this message translates to:
  /// **'AI INFERRED'**
  String get aiInferred;

  /// No description provided for @explanationGemini.
  ///
  /// In en, this message translates to:
  /// **'Not found in local database. Processed by Gemini AI.'**
  String get explanationGemini;

  /// No description provided for @reportInaccuracy.
  ///
  /// In en, this message translates to:
  /// **'Report Inaccuracy'**
  String get reportInaccuracy;

  /// No description provided for @reportInaccuracyBody.
  ///
  /// In en, this message translates to:
  /// **'Select an issue so our scholars and AI team can review it.'**
  String get reportInaccuracyBody;

  /// No description provided for @addCommentsOptional.
  ///
  /// In en, this message translates to:
  /// **'Add additional comments (optional)...'**
  String get addCommentsOptional;

  /// No description provided for @reportSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Report submitted successfully. Our team will review this.'**
  String get reportSubmitted;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
