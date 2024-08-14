import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/auth_helper.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/utils/validators.dart';
import '../../../misc/color_manager/color_manager.dart';
import '../../../misc/custom_buttons/custom_btn.dart';
import '../../../misc/custom_elements/custom_divider.dart';
import '../../../misc/custom_input_field/custom_input_field.dart';
import '../../../misc/custom_scaffold/custom_scaffold.dart';
import '../../../misc/custom_toast/custom_toast.dart';
import '../../../misc/image_manager/image_manager.dart';
import '../../../misc/route_manager/routes_manager.dart';
import '../misc/social_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final spacer = const SizedBox(height: 30);

  final ScrollController controller = ScrollController();

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: ColorManager.kPrimaryLight,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              color: ColorManager.kPrimaryLight,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign Up to Apptivate",
                        style: TextStyleManager.get18TextStyle(),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyleManager.get12TextStyle()
                              .copyWith(fontSize: 13),
                          children: [
                            const TextSpan(text: "Have an account? "),
                            TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorManager.kPrimary,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, RoutesManager.signIn);
                                },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  customDivider(
                    height: 1,
                    margin: const EdgeInsets.only(top: 16, bottom: 20),
                    color: ColorManager.kPrimary.withOpacity(.1),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //
                      SocialAuth(
                          text: "Continue with Google",
                          image: ImageManager.kGoogleIcon),

                      SocialAuth(
                          text: "Continue with Apple",
                          image: ImageManager.kAppleIcon),

                      //
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            //

            //
            Expanded(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.kWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        //
                        Expanded(
                          child: ListView(
                            controller: controller,
                            children: [
                              CustomInputField(
                                formHolderName: "First Name",
                                hintText: "Enter your first name",
                                textInputAction: TextInputAction.next,
                                textEditingController: firstnameController,
                                validator: (val) => Validator.validateField(
                                    fieldName: "First Name", input: val),
                                onChanged: (_) {
                                  setState(() {});
                                },
                              ),

                              spacer,
                              CustomInputField(
                                formHolderName: "Last Name",
                                hintText: "Enter your last name",
                                textInputAction: TextInputAction.next,
                                textEditingController: lastnameController,
                                validator: (val) => Validator.validateField(
                                    fieldName: "Last Name", input: val),
                                onChanged: (_) {
                                  setState(() {});
                                },
                              ),

                              //
                              spacer,
                              CustomInputField(
                                formHolderName: "Email",
                                hintText: "Enter your email",
                                textEditingController: emailController,
                                textInputAction: TextInputAction.next,
                                validator: (val) =>
                                    Validator.validateEmail(val),
                                onChanged: (_) => setState(() {}),
                              ),
                              spacer,

                              CustomInputField(
                                formHolderName: "Password",
                                hintText: "Enter your password",
                                textInputAction: TextInputAction.done,
                                textEditingController: passwordController,
                                isPasswordField: true,
                                validator: (v) => Validator.validatePassword(v),
                                onChanged: (_) => setState(() {}),
                              ),

                              spacer,
                              spacer,
                              CustomButton(
                                text: "Proceed",
                                isActive: true,
                                onTap: () async {
                                  try {
                                    if (!(_formKey.currentState?.validate() ??
                                        false)) {
                                      throw "Please ensure that all input are filled correctly.";
                                    }

                                    createAccount();
                                  } catch (e) {
                                    showCustomToast(
                                        context: context, description: "$e");
                                  }
                                },
                                loading: loading,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool loading = false;
  Future<void> createAccount() async {
    setState(() => loading = true);

    await AuthHelper.signUp(
      firstname: firstnameController.text,
      lastname: lastnameController.text,
      email: emailController.text,
      password: passwordController.text,
    ).then((value) {
      showCustomToast(
        context: context,
        description: "Account creation was sucessful.",
        type: ToastType.success,
      );

      Navigator.pushNamed(context, RoutesManager.verifyEmail,
          arguments: EmailVerificationType.signp);
    }).catchError((e) {
      showCustomToast(context: context, description: e.toString());
    });
    setState(() => loading = false);
  }
}
