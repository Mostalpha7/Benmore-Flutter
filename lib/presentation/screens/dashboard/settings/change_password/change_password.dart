import 'package:flutter/material.dart';
import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';

import '../../../../../../core/utils/validators.dart';
import '../../../../../core/utils/enum.dart';
import '../../../../misc/color_manager/color_manager.dart';
import '../../../../misc/custom_back_icon/custom_back_icon.dart';
import '../../../../misc/custom_buttons/custom_btn.dart';
import '../../../../misc/custom_elements/custom_divider.dart';
import '../../../../misc/custom_input_field/custom_input_field.dart';
import '../../../../misc/custom_scaffold/custom_scaffold.dart';
import '../../../../misc/custom_toast/custom_toast.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final spacer = const SizedBox(height: 30);

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  ScrollController controller = ScrollController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScaffold(
        backgroundColor: ColorManager.kPrimaryLight,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.only(left: 15),
                              alignment: Alignment.centerLeft,
                              child: const BackIcon(),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("Change Password",
                                textAlign: TextAlign.center,
                                style: TextStyleManager.get18TextStyle()),
                          ),
                          const Expanded(flex: 1, child: SizedBox()),
                        ],
                      ),

                      //

                      //
                      customDivider(
                        height: 1,
                        margin: const EdgeInsets.only(top: 16, bottom: 26),
                      ),

                      Expanded(
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            controller: controller,
                            children: [
                              CustomInputField(
                                formHolderName: "Old Password",
                                hintText: "Enter your old password",
                                textInputAction: TextInputAction.next,
                                isPasswordField: true,
                                textEditingController: oldPasswordController,
                                validator: (value) => Validator.validateField(
                                    fieldName: "Old Password", input: value),
                              ),
                              spacer,

                              CustomInputField(
                                formHolderName: "New Password",
                                hintText: "Enter your new password",
                                textInputAction: TextInputAction.next,
                                isPasswordField: true,
                                textEditingController: newPasswordController,
                                validator: (value) => Validator.validateField(
                                    fieldName: "New Password", input: value),
                                onChanged: (_) => setState(() {}),
                              ),
                              spacer,

                              CustomInputField(
                                formHolderName: "Confirm Password",
                                hintText: "Confirm your new password",
                                textInputAction: TextInputAction.done,
                                isPasswordField: true,
                                textEditingController:
                                    confirmNewPasswordController,
                                onChanged: (_) => setState(() {}),
                                validator: (v) => Validator.doesPasswordMatch(
                                  password: newPasswordController.text,
                                  confirmPassword:
                                      confirmNewPasswordController.text,
                                ),
                              ),
                              spacer,

                              //
                              const SizedBox(height: 54),
                              CustomButton(
                                text: "Proceed",
                                isActive: true,
                                onTap: () {
                                  if (!(_formKey.currentState?.validate() ??
                                      false)) {
                                    showCustomToast(
                                      context: context,
                                      description:
                                          "Please ensure that all input are filled correctly.",
                                    );
                                    return;
                                  }

                                  updatePassword();
                                },
                                loading: loading,
                              )
                            ],
                          ),
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

  bool loading = false;
  Future<void> updatePassword() async {
    setState(() => loading = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    showCustomToast(
      context: context,
      description: "Password updated successfully",
      type: ToastType.success,
    );
    Navigator.pop(context);

    // await UserHelper.updatePassword(
    //         old_password: oldPasswordController.text,
    //         password: newPasswordController.text)
    //     .then((msg) {
    //   if (mounted) {
    //     showCustomToast(
    //         context: context, description: msg, type: ToastType.success);
    //   }
    // }).catchError((err) {
    //   if (mounted) {
    //     showCustomToast(context: context, description: err.toString());
    //   }
    // });

    setState(() => loading = false);
  }
}
