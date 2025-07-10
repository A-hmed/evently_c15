import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:evently_c15/ui/widgets/custom_button.dart';
import 'package:evently_c15/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 24,
              ),
              buildAppLogo(context),
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
              buildForgetPasswordText(context),
              SizedBox(
                height: 24,
              ),
              buildLoginButton(),
              SizedBox(
                height: 24,
              ),
              buildSignUpText(),
              SizedBox(
                height: 24,
              ),
              buildOrRow(),
              SizedBox(
                height: 24,
              ),
              buildGoogleLogin(),
              buildLanguageToggle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppLogo(BuildContext context) => Image.asset(
        AppAssets.appVerticalLogo,
        height: MediaQuery.of(context).size.height * 0.2,
      );

  buildEmailTextField() => Container(
        child: CustomTextField(
          hint: l10n.emailHint,
          prefixIcon: AppSvg.icEmail,
        ),
      );

  buildPasswordTextField() => Container(
        child: CustomTextField(
          hint: l10n.passwordHint,
          prefixIcon: AppSvg.icPassword,
          isPassword: true,
        ),
      );

  buildSignUpText() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(l10n.dontHaveAccount,
              style: Theme.of(context).textTheme.labelSmall),
          Text(l10n.createAccount,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline)),
        ],
      );

  buildForgetPasswordText(BuildContext context) => Text(
        l10n.forgetPassword,
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontStyle: FontStyle.italic, decoration: TextDecoration.underline),
      );

  buildLoginButton() => CustomButton(text: l10n.loginButton, onClick: () {});

  buildOrRow() => Row(
        children: [
          Expanded(
              child: Divider(
            indent: 24,
            endIndent: 24,
          )),
          Text(l10n.orText, style: Theme.of(context).textTheme.labelMedium),
          Expanded(
              child: Divider(
            indent: 24,
            endIndent: 24,
          ))
        ],
      );

  buildGoogleLogin() => CustomButton(
        text: l10n.forgetPassword,
        icon: Icon(Icons.social_distance_outlined),
        onClick: () {},
        backgroundColor: AppColors.white,
        textColor: AppColors.blue,
      );

  buildLanguageToggle() => Container();
}
