import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_task_management_app/core/firebase_error_codes/firebase_error_codes.dart';
import 'package:future_task_management_app/core/route_manager/routes_manager.dart';
import 'package:future_task_management_app/core/utils/dailog_utils.dart';
import 'package:future_task_management_app/core/utils/eamil_Validation.dart';
import 'package:future_task_management_app/providers/app_auth_provider.dart';
import 'package:future_task_management_app/ui/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =
      TextEditingController(text: 'moo@route.com');

  TextEditingController passwordController =
      TextEditingController(text: '123456');

  bool securePassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/route_logo.svg',
              width: 70.w,
              height: 70.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'E-mail',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                      hitText: 'Enter ur email address',
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return 'Plz,, enter email address';
                        }
                        if (!isValidEmail(input)) {
                          return 'E-mail bad format';
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                      //isSecureText: securePassword,
                      hitText: 'Enter password',
                      keyboardType: TextInputType.visiblePassword,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return 'Plz, enter password';
                        }
                        if (input.length < 6) {
                          return 'Sorry, password should be at least 6 chars';
                        }
                      },
                      controller: passwordController,
                      iconButton: IconButton(
                        onPressed: () {
                          securePassword = !securePassword;
                          setState(() {});
                        },
                        icon: Icon(securePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            backgroundColor: Colors.blue.shade200),
                        onPressed: () {
                          login(emailController.text, passwordController.text);
                        },
                        child: Text('Login')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account?",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteManger.registerRoute);
                            },
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login(String email, String password) async {
    var authProvider = Provider.of<AppAuthProvider>(context, listen: false);
    // step1 -> validate FormField
    if (formKey.currentState?.validate() == false) return;
    // step2 -> create Account

    try {
      DialogUtils.showLoadingDialog(context);
      await authProvider.login(email, password);
      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(
        context,
        message:
            'User Logged in Successfully ${authProvider.firebaseAuthUser!.uid}',
        posActionTitle: 'Ok',
        posAction: () {
          Navigator.pushReplacementNamed(context, RouteManger.homeRoute);
        },
      );
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      if (e.code == FirebaseErrorCodes.userNotFound ||
          e.code == FirebaseErrorCodes.wrongPassword) {
        DialogUtils.showMessageDialog(
          context,
          message: 'Wrong Email or password',
          posActionTitle: 'Try again',
          posAction: () {},
        );
      }
    } catch (e) {
      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(
        context,
        message: e.toString(),
        posActionTitle: 'Ok',
      );
    }
  }
}
