import 'dart:async';

import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/helpers/auth_helper.dart';
import '../../../../core/utils/enum.dart';
import '../../../misc/color_manager/color_manager.dart';
import '../../../misc/custom_back_icon/custom_back_icon.dart';
import '../../../misc/custom_buttons/custom_btn.dart';
import '../../../misc/custom_elements/custom_divider.dart';
import '../../../misc/custom_loader/loading.dart';
import '../../../misc/custom_scaffold/custom_scaffold.dart';
import '../../../misc/custom_toast/custom_toast.dart';
import '../../../misc/route_manager/routes_manager.dart';
import '../password_reset/misc/password_reset_3_arg.dart';

class VerifyEmail extends StatefulWidget {
  final EmailVerificationType emailVerificationType;
  const VerifyEmail({super.key, required this.emailVerificationType});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final spacer = const SizedBox(height: 30);

  final _formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController textEditingController = TextEditingController();

  //
  bool requestOtpLoading = false;
  Future<void> sendOtp() async {
    setState(() => requestOtpLoading = true);

    try {
      String msg = "";

      if (widget.emailVerificationType == EmailVerificationType.passordReset) {
        msg = await AuthHelper.resendPasswordResetOtp(email: "");
      } else {
        msg = await AuthHelper.resendOtp(token: "");
      }

      // ignore: use_build_context_synchronously
      showCustomToast(
          context: context, description: msg, type: ToastType.success);
    } catch (err) {
      showCustomToast(
          context: context, description: err.toString(), type: ToastType.error);
    }

    setState(() => requestOtpLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: ColorManager.kPrimaryLight,
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: ColorManager.kPrimaryLight,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 10),
                  child: Text(
                    widget.emailVerificationType ==
                            EmailVerificationType.passordReset
                        ? "Reset Password"
                        : "Sign Up to Apptivate",
                    textAlign: TextAlign.left,
                    style: TextStyleManager.get18TextStyle()
                        .copyWith(fontSize: 16.5),
                  ),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: BackIcon(),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Text("Verify your Email",
                                  textAlign: TextAlign.center,
                                  style: TextStyleManager.get16TextStyle())),
                          const Flexible(flex: 1, child: SizedBox()),
                        ],
                      ),
                      customDivider(
                        height: 1,
                        margin: const EdgeInsets.only(top: 16, bottom: 26),
                        color: ColorManager.kPrimary.withOpacity(.1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          "Kindly input the OTP that has been sent to your email",
                          textAlign: TextAlign.center,
                          style: TextStyleManager.get14TextStyle().copyWith(),
                        ),
                      ),
                      //

                      const SizedBox(height: 32),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          children: [
                            Form(
                              key: _formKey,
                              child: PinCodeTextField(
                                appContext: context,
                                length: 4,
                                obscureText: false,
                                animationType: AnimationType.fade,
                                pinTheme: TextStyleManager.getPinTheme(),
                                cursorColor: ColorManager.kFormHintText,
                                cursorWidth: 1.5,
                                cursorHeight: 20,
                                animationDuration:
                                    const Duration(milliseconds: 50),
                                enableActiveFill: true,
                                errorAnimationController: errorController,
                                controller: textEditingController,
                                keyboardType: TextInputType.number,
                                onCompleted: (_) {},
                                onChanged: (_) => setState(() {}),
                                beforeTextPaste: (_) => true,
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Didn’t receive a code? ",
                                  style: TextStyleManager.get12TextStyle(),
                                ),

                                requestOtpLoading
                                    ? Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: buildLoader())
                                    : GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () => sendOtp(),
                                        child: Text(
                                          "Resend",
                                          style:
                                              TextStyleManager.get12TextStyle()
                                                  .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: ColorManager.kPrimary,
                                          ),
                                        ),
                                      ),
                                //

                                //
                              ],
                            ),

                            //
                            spacer,
                            spacer,
                            spacer,
                            CustomButton(
                              text: "Proceed",
                              isActive: true,
                              onTap: () async {
                                _formKey.currentState!.validate();
                                if (textEditingController.text.length != 4) {
                                  errorController.add(ErrorAnimationType.shake);
                                  return;
                                }

                                if (widget.emailVerificationType ==
                                    EmailVerificationType.signp) {
                                  setState(() => loading = true);
                                  await confirmSignUpOtp(
                                      textEditingController.text);
                                  setState(() => loading = false);
                                }

                                if (widget.emailVerificationType ==
                                    EmailVerificationType.passordReset) {
                                  setState(() => loading = true);
                                  await verifyPasswordResetOtp(
                                      textEditingController.text);
                                  setState(() => loading = false);
                                }
                              },
                              loading: loading,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //

  bool loading = false;
  Future<void> confirmSignUpOtp(String code) async {
    await AuthHelper.verifyEmail(code: code, token: "").then((msg) async {
      showCustomToast(
          context: context, description: msg, type: ToastType.success);
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, RoutesManager.signIn);
      });
    }).catchError((e) {
      showCustomToast(context: context, description: e.toString());
    });
  }

  Future<void> verifyPasswordResetOtp(String code) async {
    await AuthHelper.verifyPasswordResetOtp(email: "email", token: code)
        .then((msg) async {
      showCustomToast(
          context: context, description: msg, type: ToastType.success);

      Navigator.pushNamed(context, RoutesManager.passwordReset3,
          arguments: PasswordReset3Arg(email: "", otp: code));

      //
    }).catchError((e) {
      showCustomToast(context: context, description: e.toString());
    });
  }
}
