import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movieverse/core/utils/form_validator.dart';
import 'package:movieverse/features/Auth/Presentation/Manager/register_cubit.dart';
import 'package:movieverse/features/Auth/Presentation/Widgets/custom_button.dart';
import 'package:movieverse/features/Auth/Presentation/Widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameTextEditingController =
      TextEditingController();

  final TextEditingController _emailTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  bool? processing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 23.w),
              child: Text(
                "Hello!\nRegister to get started",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomTextFormField(
              hintText: "Username",
              formValidate: FormValidate.userNameValidate,
              unHideObscureIcon: false,
              hideText: false,
              textEditingController: _userNameTextEditingController,
              textInputAction: TextInputAction.next,
            ),
            CustomTextFormField(
              hintText: "Email",
              formValidate: FormValidate.emailValidate,
              unHideObscureIcon: false,
              hideText: false,
              textEditingController: _emailTextEditingController,
              textInputAction: TextInputAction.next,
            ),
            CustomTextFormField(
              hintText: "Password",
              formValidate: FormValidate.passValidate,
              unHideObscureIcon: true,
              hideText: true,
              textEditingController: _passwordTextEditingController,
              textInputAction: TextInputAction.done,
            ),
            CustomButton(
              btnText: "Register",
              btnLogic: () async {
                if (_formKey.currentState!.validate()) {
                  await RegisterCubit.get(context).registerAccount(
                      email: _emailTextEditingController.text,
                      password: _passwordTextEditingController.text,
                      context: context);
                  if (context.mounted) {
                    if (RegisterCubit.get(context).state is RegisterSuccess) {
                      context.pop("/");
                    }
                  }
                }
              },
              processing: processing,
            ),
          ],
        ),
      ),
    );
  }
}
