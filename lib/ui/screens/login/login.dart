import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_c15/l10n/app_localizations.dart';
import 'package:evently_c15/ui/providers/language_provider.dart';
import 'package:evently_c15/ui/providers/theme_provider.dart';
import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:evently_c15/ui/utils/app_routes.dart';
import 'package:evently_c15/ui/utils/dialog_utils.dart';
import 'package:evently_c15/ui/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                buildAppLogo(),
                SizedBox(
                  height: 24,
                ),
                buildEmailTextField(),
                SizedBox(
                  height: 16,
                ),
                buildPasswordTextField(),
                SizedBox(
                  height: 16,
                ),
                buildForgotPassword(),
                SizedBox(
                  height: 24,
                ),
                buildLoginButton(),
                SizedBox(
                  height: 24,
                ),
                buildSignUpRow(),
                SizedBox(
                  height: 24,
                ),
                buildOrRow(),
                SizedBox(
                  height: 24,
                ),
                buildGoogleLoginButton(),
                SizedBox(
                  height: 24,
                ),
                buildLanguageToggle(),
                buildThemeToggle(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildAppLogo() => Image.asset(
        AppAssets.appVerticalLogo,
        height: MediaQuery.of(context).size.height * .2,
      );

  buildEmailTextField() => CustomTextField(
        prefixIcon: AppSvg.icEmail,
        hint: AppLocalizations.of(context)!.emailHint,
        controller: _emailController,
      );

  buildPasswordTextField() => CustomTextField(
        prefixIcon: AppSvg.icPassword,
        hint: AppLocalizations.of(context)!.passwordHint,
        isPassword: true,
        controller: _passwordController,
      );

  buildForgotPassword() => SizedBox(
        width: double.infinity,
        child: Text(
          AppLocalizations.of(context)!.forgotPassword,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline),
        ),
      );

  buildLoginButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () async {
               try {
              showLoading(context);

             var userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text);

              Navigator.pop(context);
              Navigator.push(context, AppRoutes.home);
              } on FirebaseAuthException catch (e) {
                Navigator.pop(context);
                showMessage(context,
                    message:
                        e.message ?? "Something went wrong, Please try again",
                    posButtonText: "Ok");
              }
            },
            child: Text(
              AppLocalizations.of(context)!.loginButton,
              style: Theme.of(context).textTheme.titleSmall,
            )),
      );

  buildSignUpRow() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.noAccount,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(AppLocalizations.of(context)!.createAccount,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline)),
        ],
      );

  buildOrRow() => Row(
        children: [
          SizedBox(
            width: 26,
          ),
          Expanded(child: Divider()),
          SizedBox(
            width: 16,
          ),
          Text("Or"),
          SizedBox(
            width: 16,
          ),
          Expanded(child: Divider()),
          SizedBox(
            width: 26,
          ),
        ],
      );

  buildGoogleLoginButton() => ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add),
          Text(
            AppLocalizations.of(context)!.loginWithGoogle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ));

  late LanguageProvider languageProvider;

  buildLanguageToggle() => Directionality(
        textDirection: TextDirection.ltr,
        child: AnimatedToggleSwitch<String>.dual(
          current: languageProvider.locale,
          first: "en",
          second: "ar",
          onChanged: (code) {
            languageProvider.changeLanguage(code);
          },
          iconBuilder: (code) =>
              Image.asset(code == "en" ? AppAssets.icUsa : AppAssets.icEg),
        ),
      );

  late ThemeProvider themeProvider;

  buildThemeToggle() => Directionality(
        textDirection: TextDirection.ltr,
        child: AnimatedToggleSwitch<ThemeMode>.dual(
          current: themeProvider.currentMode,
          first: ThemeMode.light,
          second: ThemeMode.dark,
          onChanged: (mode) {
            themeProvider.changeMode(mode);
          },
          iconBuilder: (mode) => Icon(
              mode == ThemeMode.light ? Icons.light_mode : Icons.dark_mode),
        ),
      );
}
