import 'package:flutter/material.dart';

import '/core/animations/fade_animation.dart';
import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '/core/boilerplate/create_model/widgets/CreateModel.dart';
import '/core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '/core/boilerplate/get_model/widgets/GetModel.dart';
import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/utils/navigation.dart';
import '/core/utils/shared_storage.dart';
import '/core/utils/validators.dart';
import '/core/widgets/buttons/main_elevated_button.dart';
import '/core/widgets/custom_text_field.dart';
import '/features/auth/data/get_profile_info_respond_model.dart';
import '/features/auth/domain/repository/auth_repository.dart';
import '/features/auth/presentation/widgets/phone_text_field.dart';
import '/features/home/presentation/widgets/general_widget_scaffold.dart';
import '/features/profile/data/edit_profile_request_model.dart';
import '/features/profile/data/edit_profile_respond_model.dart';
import '/features/profile/domain/repository/profile_repository.dart';
import '/features/profile/presentation/widgets/edit_password.dart';
import '/features/profile/presentation/widgets/edit_svg.dart';
import '/features/profile/presentation/widgets/icon_name.dart';
import '/features/profile/presentation/widgets/image_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _nameFocusNode = FocusNode();

  final FocusNode _phoneFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();

  final FocusNode _confirmPasswordFocusNode = FocusNode();

/*  String? _name;
  String? _phone;
  String? _email;*/
  String? _image;

  bool isEditPhone = true;
  bool isEditName = true;
  bool isEditEmail = true;
  bool isEditPassword = true;
  bool saveEdit = false;

  final GlobalKey<FormState> _profileKey = GlobalKey<FormState>();

  GetModelCubit? _getProfileModelCubit;

  @override
  Widget build(BuildContext context) {
    //   double size = MediaQuery.of(context).size.height;

    return GeneralWidgetScaffold(
      horizontal: 0,
      resizeToAvoidBottomInset: true,
      body: GetModel<GetProfileInfoRespondModel>(
        onCubitCreated: (GetModelCubit cubit) {
          _getProfileModelCubit = cubit;
        },
        repositoryCallBack: (data) => AuthRepository.profileInfo(),
        onSuccess: (GetProfileInfoRespondModel model) {
          SharedStorage.writeImageURL(model.image);
        },
        modelBuilder: (GetProfileInfoRespondModel model) {
          _phoneController.text = model.phone ?? '';
          //_phone = _phoneController!.text;

          _nameController.text = model.name ?? "";
          //_name = _nameController!.text;

          _emailController.text = model.email ?? '';
          //  _email = _emailController!.text;

          _passwordController = TextEditingController(
            text: "************",
          );

          return Form(
            key: _profileKey,
            child: Column(
              children: [
                ImageProfile(
                  model: model,
                  imageUrl: (image) {
                    setState(() {
                      _image = image;
                      saveEdit = _image == null ? false : true;
                    });
                  },
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    color: AppColors.blueLightColor,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...[

                            FadeAnimation(
                              delay: 1,
                              child: Column(
                                children: [
                                  const IconName(
                                    image: AppAssets.phoneProfile,
                                    text: "phone_number",
                                  ),
                                  const SizedBox(height: 15,),
                                  PhoneTextField(
                                    phoneController: _phoneController,
                                    /* onChanged: (value) {
                                      setState(() {

                                      });
                                    },*/
                                    onCountryChange: (value) {},
                                    isEdit: true,
                                    readOnly: isEditPhone,
                                    editPhoneNumber: () {
                                      setState(() {
                                        isEditPhone = false;
                                        saveEdit = true;
                                      });
                                    },
                                    keyboardType: TextInputType.phone,
                                    initialCountryCode: "+963",
                                    focusNode: _phoneFocusNode,
                                    /*validator: (value) =>
                                    Validator.phoneNumberValidator(
                                        _phoneController!.text, context),*/
                                  ),
                                ],
                              ),
                            ),

                            FadeAnimation(
                              delay: 1.4,
                              child: Column(
                                children: [
                                  const IconName(
                                    image: AppAssets.profileProfile,
                                    text: "name",
                                  ),
                                  const SizedBox(height: 15,),
                                  CustomTextField(
                                    hintText: 'name',
                                    suffix: EditSVG(
                                      onTap: () {
                                        setState(() {
                                          isEditName = false;

                                          print(isEditName);
                                        });
                                      },
                                    ),
                                     onChanged: (value) {
                                       saveEdit = true;
                                    },
                                    //readOnly: isEditName,
                                    controller: _nameController,
                                    textInputAction: TextInputAction.next,
                                    focusNode: _nameFocusNode,
                                    onEditingComplete: () =>
                                        FocusScope.of(context).nextFocus(),
                                    keyboardType: TextInputType.name,
                                    validator: (value) => Validator.nameValidate(
                                        _nameController.text, context),
                                  ),
                                ],
                              ),
                            ),

                            FadeAnimation(
                              delay: 1.8,
                              child: Column(
                                children: [
                                  const IconName(
                                    image: AppAssets.emailProfile,
                                    text: "email_address",
                                  ),
                                  const SizedBox(height: 15,),
                                  CustomTextField(
                                    hintText: 'email_address',
                                    suffix: EditSVG(
                                      onTap: () {
                                        setState(() {
                                          isEditEmail = false;
                                          saveEdit = true;
                                          print(isEditEmail);
                                        });
                                      },
                                    ),
                                    /*onChanged: (value) {
                                      setState(() {

                                      });
                                    },*/
                                    readOnly: isEditEmail,
                                    controller: _emailController,
                                    textInputAction: TextInputAction.next,
                                    focusNode: _emailFocusNode,
                                    onEditingComplete: () =>
                                        FocusScope.of(context).nextFocus(),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) => Validator.emailValidator(
                                        _emailController.text, context),
                                  ),
                                ],
                              ),
                            ),

                            FadeAnimation(
                              delay: 2.2,
                              child: Column(
                                children: [
                                  const IconName(
                                    image: AppAssets.passwordProfile,
                                    text: "password",
                                  ),
                                  const SizedBox(height: 15,),
                                  CustomTextField(
                                    hintText: 'password',
                                    suffix: EditSVG(
                                      onTap: () {
                                        setState(() {
                                          isEditPassword = false;
                                          print(isEditPassword);
                                        });
                                      },
                                    ),
                                    readOnly: true,
                                    onTap: () {
                                      changePassword(context);
                                    },
                                    controller: _passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    focusNode: _passwordFocusNode,
                                    onEditingComplete: () => FocusScope.of(context)
                                        .requestFocus(_confirmPasswordFocusNode),
                                    textInputAction: TextInputAction.next,
                                    /*validator: (value) => Validator.passwordValidateLogin(
                                    _passwordController!.text, context),*/
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            _buildEditProfile(saveEdit),
                            /* EditProfile(
                              phone: _phoneController.text ?? _phone,
                              name: _nameController.text ?? _name,
                              email: _emailController.text ?? _email,
                              // password: _passwordController!.text,
                              image: _image,
                              profileKey: _profileKey,
                              saveEdit: saveEdit,
                            ),*/
                          ].expand(
                            (element) => [
                              element,
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /*changePassword(BuildContext context) {
    print("object");
    return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      shape: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.transparent,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(65),
          topRight: Radius.circular(65),
        ),
      ),
      elevation: 5,
      context: context,
      builder: (context) {
        return EditPassword();
      },
    );
  }*/

  changePassword(BuildContext context) {
    print("object");
    return showDialog(
      context: context,
      builder: (context) {
        return  const EditPassword()

        ;
      },
    );
  }

  CreateModelCubit? _editProfileCubit;

  _buildEditProfile(bool saveEdit) {
    return CreateModel<EditProfileRespondModel>(
      repositoryCallBack: (data) => ProfileRepository.updateProfile(data),
      onCubitCreated: (cubit) {
        _editProfileCubit = cubit;
      },
      onSuccess: (EditProfileRespondModel model) {
        SharedStorage.writeImageURL(model.image);
        Navigation.pop(context);
      },
      child: Visibility(
        visible: saveEdit,
        child: FadeAnimation(
          fadeDirection: FadeDirection.top,
          child: Center(
            child: MainElevatedButton(
              onPressed: () {
                if (_profileKey.currentState!.validate()) {
                  _editProfileCubit!.createModel(
                    EditProfileRequestModel(
                      phone: _phoneController.text /* ?? _phone*/,
                      name: _nameController.text /*?? _name*/,
                      email: _emailController.text /* ?? _email*/,
                       //password: "123456",
                      image: _image,
                    ),
                  );
                }
              },
              text: 'save',
            ),
          ),
        ),
      ),
    );
  }
}
