import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_task_management_app/core/utils/eamil_Validation.dart';
import 'package:future_task_management_app/ui/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmationController =
      TextEditingController();

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
                      'Full Name',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                      hitText: 'Enter Full name',
                      keyboardType: TextInputType.name,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return 'Plz,, enter full name';
                        }
                        return null;
                      },
                      controller: fullNameController,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'User Name',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(
                      hitText: 'Enter user name',
                      keyboardType: TextInputType.name,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return 'Plz,, enter user name';
                        }
                        return null;
                      },
                      controller: userNameController,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
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
                      isSecureText: securePassword,
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
                    Text(
                      're-password',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextFormField(

                      isSecureText: true,
                      controller: passwordConfirmationController,
                      hitText: 'Password confirmation',
                      keyboardType: TextInputType.visiblePassword,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return 'Plz, enter password';
                        }
                        if (input != passwordController.text) {
                          return "Password doesn't match";
                        }
                      },
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
        
                          register();
                        },
                        child: Text('Register'))
                  ],
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }

  void register() {
    // step1 -> validate FormField
    if(formKey.currentState?.validate() == false) return;
    // step2 -> create Account

  }
}
