import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:evently_c15/ui/utils/app_routes.dart';
import 'package:evently_c15/ui/utils/dialog_utils.dart';
import 'package:evently_c15/ui/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

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
              hint: 'User name',
              controller: _usernameController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: 'Email',
              controller: _emailController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: 'Password',
              isPassword: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: 'Re password',
              isPassword: true,
              controller: _rePasswordController,
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
            onPressed: () async {
              try {
                showLoading(context);

                await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
              "Register",
              style: Theme.of(context).textTheme.titleSmall,
            )),
      );
}
