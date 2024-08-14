import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';

import '../../../../../core/providers/user_provider.dart';
import '../../../../../core/utils/enum.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../misc/color_manager/color_manager.dart';
import '../../../../misc/custom_back_icon/custom_back_icon.dart';
import '../../../../misc/custom_buttons/custom_btn.dart';
import '../../../../misc/custom_elements/custom_divider.dart';
import '../../../../misc/custom_input_field/custom_input_field.dart';
import '../../../../misc/custom_scaffold/custom_scaffold.dart';
import '../../../../misc/custom_toast/custom_toast.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final spacer = const SizedBox(height: 30);

  final _formKey = GlobalKey<FormState>();

  ScrollController controller = ScrollController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return CustomScaffold(
      backgroundColor: ColorManager.kPrimaryLight,
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              child: Text(
                                "Profile Settings",
                                textAlign: TextAlign.center,
                                style: TextStyleManager.get18TextStyle(),
                              ),
                            ),
                            const Expanded(flex: 1, child: SizedBox()),
                          ],
                        ),
                        customDivider(
                          height: 1,
                          margin: const EdgeInsets.only(top: 16, bottom: 26),
                        ),

                        //
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            controller: controller,
                            children: [
                              CustomInputField(
                                formHolderName: "First Name",
                                hintText: "Enter your first name",
                                textInputAction: TextInputAction.next,
                                textEditingController: firstnameController,
                                validator: (val) => Validator.validateField(
                                    fieldName: "First name", input: val),
                                onChanged: (_) {
                                  setState(() {});
                                },
                              ),
                              //

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
                              IgnorePointer(
                                child: CustomInputField(
                                  formHolderName: "Email",
                                  hintText: "Enter your email",
                                  textInputAction: TextInputAction.next,
                                  textEditingController: TextEditingController(
                                      text: "mail@domain.com"),
                                ),
                              ),

                              spacer,
                              CustomInputField(
                                formHolderName: "Username",
                                hintText: "Enter your username",
                                textInputAction: TextInputAction.next,
                                textEditingController: userNameController,
                                validator: (val) => Validator.validateField(
                                    fieldName: "Username", input: val),
                              ),

                              spacer,
                              CustomButton(
                                text: "Update",
                                isActive: true,
                                onTap: () {
                                  if (!(_formKey.currentState?.validate() ??
                                      false)) return;

                                  //
                                  updateProfile(userProvider);
                                },
                                loading: updateLoading,
                              ),

                              const SizedBox(height: 50),
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

  bool updateLoading = false;
  Future<void> updateProfile(UserProvider userProvider) async {
    if (firstnameController.text.isEmpty ||
        lastnameController.text.isEmpty ||
        userNameController.text.isEmpty) {
      showCustomToast(
        context: context,
        description: "Please fill all the details.",
        type: ToastType.error,
      );

      return;
    }

    setState(() => updateLoading = true);

    try {
      await Future.delayed(const Duration(milliseconds: 1500));

      if (mounted) {
        showCustomToast(
          context: context,
          description: "Profile update was successful",
          type: ToastType.success,
        );
      }
      Navigator.pop(context);
    } catch (err) {
      if (mounted) {
        showCustomToast(
            context: context,
            description: err.toString(),
            type: ToastType.error);
      }
    }

    setState(() => updateLoading = false);
  }
}
