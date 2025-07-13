// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get emailHint => 'Email';

  @override
  String get passwordHint => 'Password';

  @override
  String get forgotPassword => 'Forget password';

  @override
  String get loginButton => 'Login';

  @override
  String get noAccount => 'Do not have an account?';

  @override
  String get createAccount => 'Create Account';

  @override
  String get or => 'Or';

  @override
  String get loginWithGoogle => 'Login with google';
}
