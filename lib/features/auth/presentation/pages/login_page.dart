// ignore_for_file: must_be_immutable

import '/features/home/presentation/widgets/general_scaffold_home.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/utils/shared_storage.dart';

import '/features/auth/data/login_request_model.dart';
import '/features/auth/data/login_respond_model.dart';
import '/features/auth/domain/repository/auth_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/animations/fade_animation.dart';
import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '/core/boilerplate/create_model/widgets/CreateModel.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/validators.dart';
import '/core/widgets/buttons/main_elevated_button.dart';
import '/core/widgets/custom_text_field.dart';
import '/features/auth/presentation/widgets/general_scaffold_auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GeneralScaffoldAuth(
      fadeDirection: FadeDirection.bottom,
      body: Form(
        key: _loginKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...[
              Text(
                textAlign: TextAlign.start,
                "welcome_back!".tr(),
                style: AppTheme.headline.copyWith(
                  fontFamily: 'Acknowledgement',
                  fontSize: 17,
                  color: AppColors.black,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FadeAnimation(
                    child: CustomTextField(
                      hintText: 'email_address'.tr(),
                      icon: Icons.person,
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      focusNode: _emailFocusNode,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          Validator.emailValidator(value!, context),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    child: CustomTextField(
                      hintText: 'password'.tr(),
                      icon: Icons.lock,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      focusNode: _passwordFocusNode,
                      controller: _passwordController,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () {
                        if(_loginKey.currentState!.validate()) {
                          _loginCubit!.createModel(
                            LoginRequestModel(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                      /*validator: (value) => Validator.passwordValidateLogin(
                          value!, context),*/
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //AnimationNavigation.scalePush(context, LoginPage());
                    },
                    child: Text(
                      'forget_password?'.tr(),
                      style: AppTheme.bodyText1,
                    ),
                  ),
                ],
              ),
              _buildLoginButton(context),
            ].expand(
              (element) => [
                element,
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CreateModelCubit? _loginCubit;

  Widget _buildLoginButton(context) {
    return CreateModel<LoginRespondModel>(
      onSuccess: (LoginRespondModel model) {
        SharedStorage.writeToken(model.token);
        SharedStorage.writeUserId(model.id);
        AnimationNavigation.fadePushAndRemoveUntil(context, const GeneralScaffoldHome());

      },
      onCubitCreated: (cubit) {
        _loginCubit = cubit;
      },
      repositoryCallBack: (data) => AuthRepository.login(data),
      child: MainElevatedButton(
        onPressed: () async {
          if(_loginKey.currentState!.validate()) {
            _loginCubit!.createModel(
              LoginRequestModel(
                email: _emailController.text,
                password: _passwordController.text,
              ),
            );
          }
        },
        text: 'continue'.tr(),
      ),
    );
  }
}
