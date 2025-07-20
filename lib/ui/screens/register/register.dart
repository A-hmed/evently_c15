import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:evently_c15/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Image.asset(
              AppAssets.appVerticalLogo,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            CustomTextField(
              hint: 'Email',
              isPassword: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: 'Email',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: 'Password',
              isPassword: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: 'Re password',
              isPassword: true,
            ),
            const SizedBox(height: 32),
            buildCreateAccountButton(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Hava an account",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Login"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildCreateAccountButton(BuildContext context) => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Register",
          style: Theme.of(context).textTheme.titleSmall,
        )),
  );
}