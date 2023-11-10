import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movieverse/core/utils/form_validator.dart';
import 'package:movieverse/features/Auth/Presentation/Manager/login_cubit.dart';
import 'package:movieverse/features/Auth/Presentation/Widgets/custom_button.dart';
import 'package:movieverse/features/Auth/Presentation/Widgets/custom_text_form_field.dart';
import 'package:movieverse/features/Auth/Presentation/Widgets/login_with_service_button.dart';
import 'package:movieverse/features/Auth/Presentation/Widgets/register_screen_rich_text.dart';
import 'package:movieverse/features/Auth/Presentation/Widgets/welcome_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  bool? processing = false;
  bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 125.h,
            ),
            const WelcomeText(),
            SizedBox(
              height: 32.h,
            ),
            CustomTextFormField(
              hintText: "Enter Your Email",
              formValidate: FormValidate.emailValidate,
              unHideObscureIcon: false,
              hideText: false,
              textEditingController: _emailTextEditingController,
              textInputAction: TextInputAction.next,
            ),
            CustomTextFormField(
              hintText: "Enter your password",
              formValidate: FormValidate.passValidate,
              unHideObscureIcon: true,
              hideText: true,
              textEditingController: _passwordTextEditingController,
              textInputAction: TextInputAction.done,
            ),
            CustomButton(
              btnText: "Login",
              btnLogic: () async {
                if (_formKey.currentState!.validate()) {
                  await LoginCubit.get(context).signInWithPass(
                      email: _emailTextEditingController.text,
                      password: _passwordTextEditingController.text,
                      context: context);
                  if (context.mounted) {
                    if (LoginCubit.get(context).state is LoginSuccess) {
                      context.go("/mainScreen");
                    }
                  }
                }
              },
              processing: processing,
            ),
            SizedBox(
              height: 10.h,
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xffE8ECF4),
                    indent: 33,
                    endIndent: 10,
                  ),
                ),
                Text("Or Login With"),
                Expanded(
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xffE8ECF4),
                    indent: 10,
                    endIndent: 27,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                LoginUsingServiceButton(
                  imgPath: "assets/images/google_img.png",
                  login: () async {
                    var state = LoginCubit.get(context).state;

                    await LoginCubit.get(context).signInWithGoogle();

                    if (state is LoginSuccess) {
                      if (context.mounted) {
                        context.go("/mainScreen");
                      }
                    }
                  },
                ),
              ],
            ),
            const Spacer(),
            const RegisterScreenRichText(),
          ],
        ),
      ),
    );
  }
}
