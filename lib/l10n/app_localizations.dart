import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('ar', ''),
  ];

  // English translations
  static const Map<String, String> _enTranslations = {
    'appTitle': 'XP Gaming Store',
    'welcomeTitle': 'Welcome to the Ultimate Gaming Experience',
    'welcomeSubtitle': 'Discover, Play, and Own the Best Games',
    'signUp': 'Sign Up',
    'signIn': 'Sign In',
    'levelUpTagline': 'Level Up Your Gaming Library',
    'createAccount': 'Create Account',
    'joinCommunity': 'Join the Gaming Community',
    'createAccountSubtitle': 'Create your account to start your gaming journey',
    'fullName': 'Full Name',
    'email': 'Email',
    'password': 'Password',
    'confirmPassword': 'Confirm Password',
    'createAccountButton': 'Create Account',
    'welcomeBack': 'Welcome Back, Gamer!',
    'signInSubtitle': 'Sign in to continue your gaming adventure',
    'forgotPassword': 'Forgot Password?',
    'signInButton': 'Sign In',
    'dontHaveAccount': 'Don\'t have an account? ',
    'accountCreatedSuccess': 'Account Created Successfully!',
    'accountCreatedMessage':
        'Welcome to XP Gaming Store! Your account has been created successfully.',
    'signInSuccess': 'Sign In Successful!',
    'signInMessage':
        'Welcome back to XP Gaming Store! You have successfully signed in.',
    'close': 'Close',
    'ourGames': 'Our Games',
    'featuredGames': 'Featured Games',
    'allGames': 'All Games',
    'hotOffers': 'Hot Offers',
    'itemAddedToCart': 'Item added to the cart',
    'cartItems': 'Cart has {count} items',
    'changeLanguage': 'Change Language',
    'signOut': 'Sign Out',
    'areYouSureSignOut': 'Are you sure you want to sign out?',
    'cancel': 'Cancel',
    'successfullySignedOut': 'Successfully signed out',
    'view': 'View',
    'invalidCredentials': 'Invalid email or password. Please try again.',
    'checkInputAndTryAgain': 'Please check your input and try again.',
    'enterFullName': 'Enter your full name',
    'enterEmail': 'Enter your email address',
    'enterPassword': 'Enter your password',
    'enterConfirmPassword': 'Confirm your password',
    'pleaseEnterFullName': 'Please enter your full name',
    'firstLetterMustBeUppercase': 'First letter must be uppercase',
    'pleaseEnterEmail': 'Please enter your email',
    'emailMustIncludeAt': 'Enter a valid email',
    'pleaseEnterPassword': 'Please enter your password',
    'passwordMustBeAtLeast6': 'Password must be at least 6 characters',
    'pleaseConfirmPassword': 'Please confirm your password',
    'passwordsMustMatch': 'Passwords must match',
  };

  // Arabic translations
  static const Map<String, String> _arTranslations = {
    'appTitle': 'متجر إكس بي للألعاب',
    'welcomeTitle': 'مرحباً بك في تجربة الألعاب المثلى',
    'welcomeSubtitle': 'اكتشف، العب، وامتلك أفضل الألعاب',
    'signUp': 'إنشاء حساب',
    'signIn': 'تسجيل الدخول',
    'levelUpTagline': 'ارتق بمكتبة ألعابك',
    'createAccount': 'إنشاء حساب',
    'joinCommunity': 'انضم إلى مجتمع الألعاب',
    'createAccountSubtitle': 'أنشئ حسابك لتبدأ رحلتك في الألعاب',
    'fullName': 'الاسم الكامل',
    'email': 'البريد الإلكتروني',
    'password': 'كلمة المرور',
    'confirmPassword': 'تأكيد كلمة المرور',
    'createAccountButton': 'إنشاء حساب',
    'welcomeBack': 'مرحباً بعودتك، أيها اللاعب!',
    'signInSubtitle': 'سجل دخولك لمتابعة مغامرة الألعاب',
    'forgotPassword': 'نسيت كلمة المرور؟',
    'signInButton': 'تسجيل الدخول',
    'dontHaveAccount': 'ليس لديك حساب؟ ',
    'accountCreatedSuccess': 'تم إنشاء الحساب بنجاح!',
    'accountCreatedMessage':
        'مرحباً بك في متجر إكس بي للألعاب! تم إنشاء حسابك بنجاح.',
    'signInSuccess': 'تم تسجيل الدخول بنجاح!',
    'signInMessage':
        'مرحباً بعودتك إلى متجر إكس بي للألعاب! لقد سجلت دخولك بنجاح.',
    'close': 'إغلاق',
    'ourGames': 'ألعابنا',
    'featuredGames': 'الألعاب المميزة',
    'allGames': 'جميع الألعاب',
    'hotOffers': 'اهم العروض',
    'itemAddedToCart': 'تم إضافة العنصر إلى السلة',
    'cartItems': 'السلة تحتوي على {count} عنصر',
    'changeLanguage': 'تغيير اللغة',
    'signOut': 'تسجيل الخروج',
    'areYouSureSignOut': 'هل أنت متأكد من أنك تريد تسجيل الخروج؟',
    'cancel': 'إلغاء',
    'successfullySignedOut': 'تم تسجيل الخروج بنجاح',
    'view': 'عرض',
    'invalidCredentials':
        'البريد الإلكتروني أو كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى.',
    'checkInputAndTryAgain': 'يرجى التحقق من المدخلات والمحاولة مرة أخرى.',
    'enterFullName': 'أدخل اسمك الكامل',
    'enterEmail': 'أدخل عنوان بريدك الإلكتروني',
    'enterPassword': 'أدخل كلمة المرور',
    'enterConfirmPassword': 'أكد كلمة المرور',
    'pleaseEnterFullName': 'يرجى إدخال اسمك الكامل',
    'firstLetterMustBeUppercase': 'يجب أن تبدأ الحرف الأول بحرف كبير',
    'pleaseEnterEmail': 'يرجى إدخال بريدك الإلكتروني',
    'emailMustIncludeAt': 'أدخل بريد إلكتروني صحيح',
    'pleaseEnterPassword': 'يرجى إدخال كلمة المرور',
    'passwordMustBeAtLeast6': 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
    'pleaseConfirmPassword': 'يرجى تأكيد كلمة المرور',
    'passwordsMustMatch': 'يجب أن تتطابق كلمات المرور',
  };

  String translate(String key, {Map<String, dynamic>? args}) {
    String translation = locale.languageCode == 'ar'
        ? _arTranslations[key] ?? key
        : _enTranslations[key] ?? key;

    if (args != null) {
      args.forEach((key, value) {
        translation = translation.replaceAll('{$key}', value.toString());
      });
    }

    return translation;
  }

  // Getters for common translations
  String get appTitle => translate('appTitle');
  String get welcomeTitle => translate('welcomeTitle');
  String get welcomeSubtitle => translate('welcomeSubtitle');
  String get signUp => translate('signUp');
  String get signIn => translate('signIn');
  String get levelUpTagline => translate('levelUpTagline');
  String get createAccount => translate('createAccount');
  String get joinCommunity => translate('joinCommunity');
  String get createAccountSubtitle => translate('createAccountSubtitle');
  String get fullName => translate('fullName');
  String get email => translate('email');
  String get password => translate('password');
  String get confirmPassword => translate('confirmPassword');
  String get createAccountButton => translate('createAccountButton');
  String get welcomeBack => translate('welcomeBack');
  String get signInSubtitle => translate('signInSubtitle');
  String get forgotPassword => translate('forgotPassword');
  String get signInButton => translate('signInButton');
  String get dontHaveAccount => translate('dontHaveAccount');
  String get accountCreatedSuccess => translate('accountCreatedSuccess');
  String get accountCreatedMessage => translate('accountCreatedMessage');
  String get signInSuccess => translate('signInSuccess');
  String get signInMessage => translate('signInMessage');
  String get close => translate('close');
  String get ourGames => translate('ourGames');
  String get featuredGames => translate('featuredGames');
  String get allGames => translate('allGames');
  String get hotOffers => translate('hotOffers');
  String get itemAddedToCart => translate('itemAddedToCart');
  String get changeLanguage => translate('changeLanguage');
  String get signOut => translate('signOut');
  String get areYouSureSignOut => translate('areYouSureSignOut');
  String get cancel => translate('cancel');
  String get successfullySignedOut => translate('successfullySignedOut');
  String get view => translate('view');
  String get invalidCredentials => translate('invalidCredentials');
  String get checkInputAndTryAgain => translate('checkInputAndTryAgain');
  String get enterFullName => translate('enterFullName');
  String get enterEmail => translate('enterEmail');
  String get enterPassword => translate('enterPassword');
  String get enterConfirmPassword => translate('enterConfirmPassword');
  String get pleaseEnterFullName => translate('pleaseEnterFullName');
  String get firstLetterMustBeUppercase =>
      translate('firstLetterMustBeUppercase');
  String get pleaseEnterEmail => translate('pleaseEnterEmail');
  String get emailMustIncludeAt => translate('emailMustIncludeAt');
  String get pleaseEnterPassword => translate('pleaseEnterPassword');
  String get passwordMustBeAtLeast6 => translate('passwordMustBeAtLeast6');
  String get pleaseConfirmPassword => translate('pleaseConfirmPassword');
  String get passwordsMustMatch => translate('passwordsMustMatch');

  String cartItems(int count) => translate('cartItems', args: {'count': count});
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
