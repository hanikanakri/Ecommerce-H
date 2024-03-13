import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/core/animations/fade_animation.dart';
import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '/core/boilerplate/create_model/widgets/CreateModel.dart';
import '/core/constants/app_assets.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';
import '/core/utils/tool.dart';
import '/core/utils/validators.dart';
import '/core/widgets/buttons/main_elevated_button.dart';
import '/core/widgets/custom_image.dart';
import '/core/widgets/custom_text_field.dart';
import '/features/auth/data/register_request_model.dart';
import '/features/auth/data/register_respond_model.dart';
import '/features/auth/domain/repository/auth_repository.dart';
import '/features/auth/presentation/pages/login_page.dart';
import '/features/auth/presentation/widgets/general_scaffold_auth.dart';
import '/features/auth/presentation/widgets/phone_text_field.dart';
import '/features/home/presentation/widgets/general_scaffold_home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _nameFocusNode = FocusNode();

  final FocusNode _phoneFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();

  final FocusNode _confirmPasswordFocusNode = FocusNode();

  File? _imageFile;
  String? _imageUrl;
  String? _assetsUrl;

  Future<String> loadImageAsBase64(String imagePath) async {
    final byteData = await rootBundle.load(imagePath);
    final bytes = byteData.buffer.asUint8List();
    final base64String = base64Encode(bytes);
    return base64String;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImageAsBase64(AppAssets.profilePicture).then(
      (value) {
        setState(() {
          _assetsUrl = value;
          print(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffoldAuth(
      body: Form(
        key: _registerKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "let's_register".tr(),
                    style: AppTheme.headline.copyWith(
                      fontFamily: 'Acknowledgement',
                      fontSize: 17,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Tool.displayModalBottomSheet(
                          context: context,
                          onSuccess: (image) {
                            setState(() {
                              _imageFile = image?.imageFile;
                              _imageUrl = image?.imageUrl;
                              print(_imageFile);
                              print(_imageUrl);
                            });
                          },
                        );
                      });
                    },
                    child: CustomImage.circular(
                      radius: 70,
                      image: _imageFile ?? AppAssets.profilePicture,
                      isNetworkImage: false,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...[
                    FadeAnimation(
                      child: PhoneTextField(
                        phoneController: _phoneController,
                        onChanged: (value) {},
                        readOnly: false,
                        onCountryChange: (value) {},
                        keyboardType: TextInputType.phone,
                        initialCountryCode: "+963",
                        focusNode: _phoneFocusNode,
                        validator: (value) => Validator.phoneNumberValidator(
                            _phoneController.text, context),
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.4,
                      child: CustomTextField(
                        hintText: 'name'.tr(),
                        icon: Icons.person,
                        controller: _nameController,
                        textInputAction: TextInputAction.next,
                        focusNode: _nameFocusNode,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        keyboardType: TextInputType.name,
                        validator: (value) => Validator.nameValidate(
                            _nameController.text, context),
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.8,
                      child: CustomTextField(
                        hintText: 'email_address'.tr(),
                        icon: Icons.email,
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        focusNode: _emailFocusNode,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => Validator.emailValidator(
                          _emailController.text,
                          context,
                        ),
                      ),
                    ),
                    FadeAnimation(
                      delay: 2.2,
                      child: CustomTextField(
                        hintText: 'password'.tr(),
                        icon: Icons.lock,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        focusNode: _passwordFocusNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_confirmPasswordFocusNode),
                        controller: _passwordController,
                        textInputAction: TextInputAction.next,
                        validator: (value) => Validator.passwordValidateLogin(
                            _passwordController.text, context),
                      ),
                    ),
                    FadeAnimation(
                      delay: 2.6,
                      child: CustomTextField(
                        hintText: 'confirm_password'.tr(),
                        icon: Icons.lock,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        focusNode: _confirmPasswordFocusNode,
                        controller: _confirmPasswordController,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          if (_registerKey.currentState!.validate()) {
                            _registerCubit!.createModel(
                              RegisterRequestModel(
                                email: _emailController.text,
                                password: _confirmPasswordController.text,
                                name: _nameController.text,
                                phone: _phoneController.text,
                                image: _imageUrl ?? _assetsUrl,
                              ),
                            );
                          }
                        },
                        validator: (value) => Validator.confirmPasswordValidate(
                            value!, _passwordController.text, context),
                      ),
                    ),
                  ].expand(
                    (element) => [
                      element,
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      AnimationNavigation.scalePush(
                        context,
                        LoginPage(),
                      );
                    },
                    child: Text(
                      'do_you_have_account?'.tr(),
                      style: AppTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            _buildRegisterButton(context),
          ],
        ),
      ),
    );
  }

  CreateModelCubit? _registerCubit;

  Widget _buildRegisterButton(context) {
    return CreateModel<RegisterRespondModel>(
      onCubitCreated: (cubit) {
        _registerCubit = cubit;
      },
      repositoryCallBack: (data) => AuthRepository.register(data),
      onSuccess: (RegisterRespondModel model) {
        SharedStorage.writeToken(model.token);
        SharedStorage.writeUserId(model.id);
        AnimationNavigation.fadePushAndRemoveUntil(
          context,
          const GeneralScaffoldHome(),
        );
      },
      child: Expanded(
        child: Center(
          child: MainElevatedButton(
            onPressed: () async {
              if (_registerKey.currentState!.validate()) {
                _registerCubit!.createModel(
                  RegisterRequestModel(
                    email: _emailController.text,
                    password: _confirmPasswordController.text,
                    name: _nameController.text,
                    phone: _phoneController.text,
                    image: _imageUrl ?? _assetsUrl,
                  ),
                );
              }
            },
            text: 'continue'.tr(),
          ),
        ),
      ),
    );
  }
}
