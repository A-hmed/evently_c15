import 'package:evently_c15/l10n/app_localizations.dart';
import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:evently_c15/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
            ],
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
      );

  buildPasswordTextField() => CustomTextField(
        prefixIcon: AppSvg.icPassword,
        hint: AppLocalizations.of(context)!.passwordHint,
        isPassword: true,
      );

  buildForgotPassword() => Text(
        AppLocalizations.of(context)!.forgotPassword,
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontStyle: FontStyle.italic, decoration: TextDecoration.underline),
      );

  buildLoginButton() => ElevatedButton(
      onPressed: () {},
      child: Text(
        AppLocalizations.of(context)!.loginButton,
        style: Theme.of(context).textTheme.titleSmall,
      ));

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

  buildLanguageToggle() => Container();
}
