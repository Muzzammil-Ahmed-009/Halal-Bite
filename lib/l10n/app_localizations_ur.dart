// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'کلیئر بائٹ';

  @override
  String get scanBarcode => 'بارکوڈ اسکین کریں';

  @override
  String get scanIngredients => 'اجزاء اسکین کریں';

  @override
  String get history => 'تاریخ';

  @override
  String get search => 'تلاش کریں';

  @override
  String get profile => 'پروفائل';

  @override
  String get productNotFound => 'پروڈکٹ نہیں ملی';

  @override
  String get halal => 'حلال';

  @override
  String get haram => 'حرام';

  @override
  String get mushbooh => 'مشتبہ';

  @override
  String get unknown => 'نامعلوم';

  @override
  String get healthWarning => 'صحت اور غذائی انتباہات';

  @override
  String get detailedAnalysis => 'تفصیلی تجزیہ';

  @override
  String get confidenceScore => 'اعتماد کا اسکور';

  @override
  String get signIn => 'سائن ان';

  @override
  String get signUp => 'سائن اپ';

  @override
  String get email => 'ای میل ایڈریس';

  @override
  String get password => 'پاس ورڈ';

  @override
  String get continueAsGuest => 'مہمان کے طور پر جاری رکھیں';

  @override
  String get continueWithGoogle => 'گوگل کے ساتھ جاری رکھیں';

  @override
  String get reportMistake => 'غلطی کی اطلاع دیں / عالم سے پوچھیں';

  @override
  String get reportTypeWrong => 'اے آئی غلط ہے (غلط اسٹیٹس)';

  @override
  String get reportTypeMissing => 'غائب یا غلط پڑھا گیا جزو';

  @override
  String get reportTypeDoubtful => 'عالم سے پوچھیں (مشتبہ/پیچیدہ جزو)';

  @override
  String get submitReport => 'رپورٹ جمع کروائیں';

  @override
  String ingredientsAnalyzed(int count) {
    return '$count اجزاء کا تجزیہ کیا گیا';
  }

  @override
  String get guestLimitReached =>
      'آپ نے اپنے مفت گیسٹ اسکینز مکمل کر لیے ہیں! براہ کرم اسکیننگ جاری رکھنے کے لیے ایک مفت اکاؤنٹ بنائیں۔';

  @override
  String get createAccount => 'اکاؤنٹ بنائیں';

  @override
  String get settings => 'ترتیبات';

  @override
  String get language => 'زبان';

  @override
  String get signOut => 'سائن آؤٹ';

  @override
  String get onboardingTitle1 => 'کسی بھی لیبل یا بارکوڈ کو اسکین کریں';

  @override
  String get onboardingSubtitle1 =>
      'تصویر سے اجزاء کا فوری تجزیہ کریں، یا ہمارے مقامی آف لائن ڈیٹا بیس کا استعمال کرتے ہوئے لاکھوں مصنوعات کو فوری طور پر اسکین کریں۔';

  @override
  String get onboardingTitle2 => 'اے آئی پر مبنی حلال تجزیہ';

  @override
  String get onboardingSubtitle2 =>
      'کسی ای-نمبر یا پیچیدہ جزو کے بارے میں یقین نہیں ہے؟ ہماری جدید اے آئی کسی بھی غیر واضح جزو کا تجزیہ کرتی ہے اور اس کی مذہبی حیثیت کی وضاحت کرتی ہے۔';

  @override
  String get onboardingTitle3 => 'حسب ضرورت غذائی پروفائلز';

  @override
  String get onboardingSubtitle3 =>
      'لیکٹوز عدم برداشت، نٹ الرجی، یا ویگن ترجیحات کے لیے ذاتی نوعیت کے الرٹس سیٹ کریں۔ اگر کوئی پروڈکٹ آپ کے طرز زندگی سے مطابقت نہیں رکھتی ہے تو ہم آپ کو خبردار کریں گے۔';

  @override
  String get onboardingTitle4 => 'ماہرین کی نگرانی';

  @override
  String get onboardingSubtitle4 =>
      'کسی مشتبہ چیز کا سامنا ہے؟ اسے فوری طور پر ایپ میں فلیگ کریں تاکہ کسی عالم سے پوچھا جا سکے۔ ہماری ٹیم زیادہ سے زیادہ درستگی کو یقینی بنانے کے لیے آراء کا جائزہ لیتی ہے۔';

  @override
  String get skip => 'چھوڑیں';

  @override
  String get getStarted => 'شروع کریں';

  @override
  String get continueBtn => 'جاری رکھیں';

  @override
  String get searchingProduct => 'مصنوعات کا ڈیٹا بیس تلاش کر رہا ہے...';

  @override
  String get productNotFoundBody =>
      'ہمیں یہ پروڈکٹ اپنے ڈیٹا بیس میں نہیں مل سکی۔ براہ کرم اس کے بجائے اجزاء کا لیبل اسکین کریں۔';

  @override
  String get ok => 'ٹھیک ہے';

  @override
  String get error => 'غلطی';

  @override
  String get noTextDetected => 'کوئی متن نہیں ملا';

  @override
  String get noTextDetectedBody =>
      'ہمیں اس تصویر میں کوئی اجزاء نہیں مل سکے۔ براہ کرم یقینی بنائیں کہ لیبل پر مناسب روشنی ہے اور وہ فوکس میں ہے۔';

  @override
  String get tryAgain => 'دوبارہ کوشش کریں';

  @override
  String get analyzing => 'تجزیہ ہو رہا ہے...';

  @override
  String get pointAtIngredientLabel => 'اجزاء کے لیبل کی طرف اشارہ کریں';

  @override
  String get ingredientSearch => 'اجزاء کی تلاش';

  @override
  String get searchHint => 'نام یا ای-کوڈ سے تلاش کریں...';

  @override
  String get searchEmptyState =>
      'ہمارے ڈیٹا بیس کو دریافت کرنے کے لیے\nکوئی جزو یا ای-نمبر ٹائپ کریں۔';

  @override
  String get noResultsFound => 'کوئی نتیجہ نہیں ملا';

  @override
  String get scanHistory => 'اسکین کی تاریخ';

  @override
  String get loginToViewHistory =>
      'براہ کرم اپنی پہلے اسکین کی گئی مصنوعات دیکھنے کے لیے لاگ ان کریں۔';

  @override
  String get signInOrCreateAccount => 'سائن ان کریں / اکاؤنٹ بنائیں';

  @override
  String get total => 'کل';

  @override
  String get safe => 'محفوظ';

  @override
  String get flagged => 'نشان زدہ';

  @override
  String get recentScans => 'حالیہ اسکینز';

  @override
  String get safeItems => 'محفوظ اشیاء';

  @override
  String get flaggedItems => 'نشان زدہ اشیاء';

  @override
  String get items => 'اشیاء';

  @override
  String get emptyHistory =>
      'آپ کی اسکین کی تاریخ خالی ہے۔\nاپنی پہلی پروڈکٹ اسکین کرنا شروع کریں!';

  @override
  String get halalLabel => 'حلال';

  @override
  String get haramLabel => 'حرام';

  @override
  String get doubtfulLabel => 'مشتبہ';

  @override
  String get unknownLabel => 'نامعلوم';

  @override
  String get yesterday => 'کل';

  @override
  String get today => 'آج';

  @override
  String get confidenceScoreLabel => 'اعتماد کا اسکور';

  @override
  String get healthWarningsLabel => 'صحت اور غذائی انتباہات';

  @override
  String get scanAnother => 'کوئی اور پروڈکٹ اسکین کریں';

  @override
  String get reportIncorrect => 'غلط نتیجہ رپورٹ کریں';

  @override
  String get disclaimer =>
      'دستبرداری: یہ ایپ اجزاء کا تجزیہ کرنے کے لیے AI کا استعمال کرتی ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، لیکن یہ مذہبی فتوے کا متبادل نہیں ہے۔ براہ کرم مشکوک اشیاء کی آزادانہ تصدیق کریں۔';

  @override
  String get confidenceHigh =>
      'عین مطابق مقامی ڈیٹا بیس کے نتائج پر مبنی اعلیٰ اعتماد۔';

  @override
  String get confidenceModerate =>
      'درمیانہ اعتماد۔ کچھ غیر واضح اجزاء پائے گئے۔';

  @override
  String get confidenceLow =>
      'کم اعتماد۔ نامعلوم اجزاء کے لیے AI کے اندازے پر نمایاں انحصار۔';

  @override
  String get matchedIsar => 'Isar DB سے ملایا گیا';

  @override
  String get explanation => 'وضاحت:';

  @override
  String get explanationIsar => 'یہ جزو متعین قواعد کے انجن میں پایا گیا تھا۔';

  @override
  String get aiInferred => 'AI سے اخذ کردہ';

  @override
  String get explanationGemini =>
      'مقامی ڈیٹا بیس میں نہیں ملا۔ Gemini AI کے ذریعے کارروائی کی گئی۔';

  @override
  String get reportInaccuracy => 'غلطی کی اطلاع دیں';

  @override
  String get reportInaccuracyBody =>
      'کوئی مسئلہ منتخب کریں تاکہ ہمارے علماء اور AI ٹیم اس کا جائزہ لے سکیں۔';

  @override
  String get addCommentsOptional => 'اضافی تبصرے شامل کریں (اختیاری)...';

  @override
  String get reportSubmitted =>
      'رپورٹ کامیابی کے ساتھ جمع کر دی گئی۔ ہماری ٹیم اس کا جائزہ لے گی۔';
}
