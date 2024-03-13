import '/core/animations/fade_animation.dart';

import '/core/api/core_models/empty_model.dart';
import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '/core/boilerplate/create_model/widgets/CreateModel.dart';
import '/core/constants/app_assets.dart';
import '/core/utils/validators.dart';
import '/features/profile/data/edit_password_request_model.dart';
import '/features/profile/domain/repository/profile_repository.dart';
import '/features/profile/presentation/widgets/icon_name.dart';
import 'package:flutter/material.dart';

import '/core/widgets/buttons/main_elevated_button.dart';
import '/core/widgets/custom_text_field.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();

  final FocusNode _currentPasswordFocusNode = FocusNode();

  final FocusNode _newPasswordFocusNode = FocusNode();
  final GlobalKey<FormState> _editPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return FadeAnimation(
      fadeDirection: FadeDirection.bottom,
      child: AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: const EdgeInsets.all(0),
        content: Container(
          height: size * 0.45,
          padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(75),
            /*borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),*/
          ),
          child: Form(
            key: _editPasswordKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const IconName(
                  mainAxisAlignment: MainAxisAlignment.center,
                  image: AppAssets.passwordProfile,
                  text: "password",
                ),
                CustomTextField(
                  hintText: "current_password",
                  controller: _currentPassword,
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: _currentPasswordFocusNode,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_newPasswordFocusNode),
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  validator: (value) => Validator.passwordValidateLogin(
                      _currentPassword.text, context),
                ),
                CustomTextField(
                  hintText: "new_password",
                  controller: _newPassword,
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: _newPasswordFocusNode,
                  obscureText: true,
                  /*onEditingComplete: () => FocusScope.of(context)
                      .requestFocus(_newPasswordFocusNode),*/
                  textInputAction: TextInputAction.done,
                  validator: (value) =>
                      Validator.passwordValidateLogin(_newPassword.text, context),
                ),
                _buildEditPassword(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CreateModelCubit? _editPasswordCubit;

  _buildEditPassword(BuildContext context) {
    return CreateModel<EmptyModel>(
      repositoryCallBack: (data) => ProfileRepository.editPassword(data),
      onCubitCreated: (cubit) {
        _editPasswordCubit = cubit;
      },
      onSuccess: (model) {},
      child: MainElevatedButton(
        onPressed: () {
          if (_editPasswordKey.currentState!.validate()) {
            _editPasswordCubit!.createModel(
              EditPasswordRequestModel(
                currentPassword: _currentPassword.text,
                newPassword: _newPassword.text,
              ),
            );
          }
        },
        text: "save",
      ),
    );
  }
}
