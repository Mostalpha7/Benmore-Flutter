import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/auth_helper.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/utils/validators.dart';
import '../../../misc/color_manager/color_manager.dart';
import '../../../misc/custom_buttons/custom_btn.dart';
import '../../../misc/custom_buttons/custom_text_btn.dart';
import '../../../misc/custom_elements/custom_divider.dart';
import '../../../misc/custom_input_field/custom_input_field.dart';
import '../../../misc/custom_scaffold/custom_scaffold.dart';
import '../../../misc/custom_toast/custom_toast.dart';
import '../../../misc/image_manager/image_manager.dart';
import '../../../misc/route_manager/routes_manager.dart';
import '../../../misc/style_manager/text_style_manager.dart';
import '../misc/social_auth.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final spacer = const SizedBox(height: 30);

  final ScrollController controller = ScrollController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    controller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: ColorManager.kPrimaryLight,
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              //

              Container(
                color: ColorManager.kPrimaryLight,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sign In to Twik",
                            style: TextStyleManager.get18TextStyle()
                                .copyWith(fontSize: 16.5)),
                        RichText(
                          text: TextSpan(
                            style: TextStyleManager.get12TextStyle()
                                .copyWith(fontSize: 13),
                            children: [
                              const TextSpan(text: "Don’t have an account? "),
                              TextSpan(
                                text: "Sign up?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.kPrimary,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(
                                        context, RoutesManager.signUp);
                                  },
                                //
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    customDivider(
                      height: 1,
                      margin: const EdgeInsets.only(top: 16, bottom: 10),
                      color: ColorManager.kPrimary.withOpacity(.1),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //
                          SocialAuth(
                              text: "Continue with Google",
                              image: ImageManager.kGoogleIcon),

                          SocialAuth(
                              text: "Continue with Apple",
                              image: ImageManager.kAppleIcon),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              //

              //
              Expanded(
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
                                formHolderName: "Email",
                                hintText: "Enter your email",
                                textEditingController: emailController,
                                textInputAction: TextInputAction.next,
                                validator: (val) =>
                                    Validator.validateEmail(val),
                                onChanged: (_) => setState(() {}),
                              ),
                              spacer,

                              //

                              //

                              //

                              CustomInputField(
                                formHolderName: "Password",
                                hintText: "Enter your password",
                                textInputAction: TextInputAction.done,
                                textEditingController: passwordController,
                                isPasswordField: true,
                                validator: (v) => Validator.validatePassword(v),
                                onChanged: (_) => setState(() {}),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: CustomTextBtn(
                                    text: "Forgot Password?",
                                    isActive: true,
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          RoutesManager.passwordReset1);
                                    },
                                    loading: false,
                                  ),
                                ),
                              ),

                              //

                              spacer,
                              spacer,
                              spacer,
                              CustomButton(
                                text: "Proceed",
                                isActive: true,
                                onTap: () {
                                  if (!(_formKey.currentState?.validate() ??
                                      false)) {
                                    return;
                                  }

                                  String email = emailController.text;
                                  String password = passwordController.text;

                                  signIn(LoginProvider.password,
                                          email: email, password: password)
                                      .catchError((e) {
                                    setState(() => loginLoading = false);
                                    showCustomToast(
                                      context: context,
                                      description: e.toString(),
                                      type: ToastType.error,
                                    );
                                  });
                                },
                                loading: loginLoading,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool loginLoading = false;
  Future<void> signIn(LoginProvider loginProvider,
      {required String email, required String password}) async {
    // if (googleSignInLoading || appleSignInLoading || loginLoading) return;

    setState(() => loginLoading = true);
    await AuthHelper.signIn(loginProvider, email: email, password: password);
    Navigator.pushNamedAndRemoveUntil(context, RoutesManager.dashboardWrapper,
        (Route<dynamic> route) => false);

    setState(() => loginLoading = false);
  }
}
