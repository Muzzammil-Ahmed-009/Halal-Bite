// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'ClearBite';

  @override
  String get scanBarcode => 'Scan Barcode';

  @override
  String get scanIngredients => 'Scan Ingredients';

  @override
  String get history => 'History';

  @override
  String get search => 'Search';

  @override
  String get profile => 'Profile';

  @override
  String get productNotFound => 'Product Not Found';

  @override
  String get halal => 'Halal';

  @override
  String get haram => 'Haram';

  @override
  String get mushbooh => 'Mushbooh';

  @override
  String get unknown => 'Unknown';

  @override
  String get healthWarning => 'Health & Dietary Warnings';

  @override
  String get detailedAnalysis => 'Detailed Analysis';

  @override
  String get confidenceScore => 'Confidence Score';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get email => 'Email Address';

  @override
  String get password => 'Password';

  @override
  String get continueAsGuest => 'Continue as Guest';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get reportMistake => 'Report Inaccuracy / Ask a Scholar';

  @override
  String get reportTypeWrong => 'AI is wrong (Incorrect Status)';

  @override
  String get reportTypeMissing => 'Missing or Misread Ingredient';

  @override
  String get reportTypeDoubtful => 'Ask a Scholar (Doubtful/Complex Item)';

  @override
  String get submitReport => 'Submit Report';

  @override
  String ingredientsAnalyzed(int count) {
    return '$count ingredients analyzed';
  }

  @override
  String get guestLimitReached =>
      'You have completed your free guest scans! Please create a free account to continue scanning.';

  @override
  String get createAccount => 'Create Account';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get signOut => 'Sign Out';

  @override
  String get onboardingTitle1 => 'Scan Any Label or Barcode';

  @override
  String get onboardingSubtitle1 =>
      'Instantly analyze ingredients from a photo, or scan millions of products instantly using our local offline database.';

  @override
  String get onboardingTitle2 => 'AI-Powered Halal Analysis';

  @override
  String get onboardingSubtitle2 =>
      'Unsure about an E-number or complex ingredient? Our advanced AI analyzes and explains the religious status of any obscure component.';

  @override
  String get onboardingTitle3 => 'Custom Dietary Profiles';

  @override
  String get onboardingSubtitle3 =>
      'Set personalized alerts for Lactose intolerance, Nut allergies, or Vegan preferences. We\'ll warn you if a product doesn\'t match your lifestyle.';

  @override
  String get onboardingTitle4 => 'Expert Oversight';

  @override
  String get onboardingSubtitle4 =>
      'Encounter a doubtful item? Flag it instantly in the app to ask a scholar. Our team reviews feedback to ensure maximum accuracy.';

  @override
  String get skip => 'Skip';

  @override
  String get getStarted => 'Get Started';

  @override
  String get continueBtn => 'Continue';

  @override
  String get searchingProduct => 'Searching Product Database...';

  @override
  String get productNotFoundBody =>
      'We could not find this product in our database. Please scan the ingredient label instead.';

  @override
  String get ok => 'OK';

  @override
  String get error => 'Error';

  @override
  String get noTextDetected => 'No Text Detected';

  @override
  String get noTextDetectedBody =>
      'We couldn\'t find any ingredients in that photo. Please ensure the label is well-lit and in focus.';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get analyzing => 'Analyzing...';

  @override
  String get pointAtIngredientLabel => 'Point at ingredient label';

  @override
  String get ingredientSearch => 'Ingredient Search';

  @override
  String get searchHint => 'Search by name or E-Code...';

  @override
  String get searchEmptyState =>
      'Type an ingredient or E-Number\nto explore our database.';

  @override
  String get noResultsFound => 'No results found';

  @override
  String get scanHistory => 'Scan History';

  @override
  String get loginToViewHistory =>
      'Please log in to view your previously scanned products.';

  @override
  String get signInOrCreateAccount => 'Sign In / Create Account';

  @override
  String get total => 'Total';

  @override
  String get safe => 'Safe';

  @override
  String get flagged => 'Flagged';

  @override
  String get recentScans => 'Recent Scans';

  @override
  String get safeItems => 'Safe Items';

  @override
  String get flaggedItems => 'Flagged Items';

  @override
  String get items => 'items';

  @override
  String get emptyHistory =>
      'Your scan history is empty.\nStart scanning your first product!';

  @override
  String get halalLabel => 'HALAL';

  @override
  String get haramLabel => 'HARAM';

  @override
  String get doubtfulLabel => 'DOUBTFUL';

  @override
  String get unknownLabel => 'UNKNOWN';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get today => 'Today';

  @override
  String get confidenceScoreLabel => 'Confidence Score';

  @override
  String get healthWarningsLabel => 'Health & Dietary Warnings';

  @override
  String get scanAnother => 'Scan Another Product';

  @override
  String get reportIncorrect => 'Report Incorrect Result';

  @override
  String get disclaimer =>
      'Disclaimer: This app uses AI to analyze ingredients. While we strive for accuracy, this is not a substitute for a religious Fatwa. Please verify doubtful items independently.';

  @override
  String get confidenceHigh =>
      'High confidence based on exact local database matches.';

  @override
  String get confidenceModerate =>
      'Moderate confidence. Some vague ingredients found.';

  @override
  String get confidenceLow =>
      'Low confidence. Significant reliance on AI inference for unknown ingredients.';

  @override
  String get matchedIsar => 'Matched from Isar DB';

  @override
  String get explanation => 'Explanation:';

  @override
  String get explanationIsar =>
      'This ingredient was found in the deterministic rules engine.';

  @override
  String get aiInferred => 'AI INFERRED';

  @override
  String get explanationGemini =>
      'Not found in local database. Processed by Gemini AI.';

  @override
  String get reportInaccuracy => 'Report Inaccuracy';

  @override
  String get reportInaccuracyBody =>
      'Select an issue so our scholars and AI team can review it.';

  @override
  String get addCommentsOptional => 'Add additional comments (optional)...';

  @override
  String get reportSubmitted =>
      'Report submitted successfully. Our team will review this.';
}
