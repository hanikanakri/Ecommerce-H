// import '/core/utils/shared_storage.dart';
//
// import '/core/utils/navigation.dart';
// import 'package:flutter/material.dart';
//
// import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
// import '/core/boilerplate/create_model/widgets/CreateModel.dart';
// import '/core/widgets/buttons/main_elevated_button.dart';
// import '/features/profile/data/edit_profile_request_model.dart';
// import '/features/profile/data/edit_profile_respond_model.dart';
// import '/features/profile/domain/repository/profile_repository.dart';
//
// class EditProfile extends StatelessWidget {
//    EditProfile({
//     super.key,
//     this.phone,
//     this.email,
//    // this.password,
//     this.name,
//     this.image,
//     this.profileKey,
//     this.saveEdit = false,
//   });
//
//   final GlobalKey<FormState>? profileKey;
//
//   final String? name;
//   final String? phone;
//   final String? email;
//   //final String? password;
//   final String? image;
//   bool saveEdit;
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return CreateModel<EditProfileRespondModel>(
//       repositoryCallBack: (data) => ProfileRepository.updateProfile(data),
//       onCubitCreated: (cubit) {
//         _editProfileCubit = cubit;
//       },
//       onSuccess: (EditProfileRespondModel model) {
//         SharedStorage.writeImageURL(model.image);
//         Navigation.pop(context);
//       },
//       child: Visibility(
//         visible: saveEdit,
//         child: Center(
//           child: MainElevatedButton(
//             onPressed: () {
//               /*if (profileKey!.currentState!.validate()) { },*/
//               _editProfileCubit!.createModel(
//                 EditProfileRequestModel(
//                   phone: phone,
//                   name: name,
//                 //  password: password,
//                   email: email,
//                   image: image,
//                 ),
//               );
//             },
//             text: 'save',
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   CreateModelCubit? _editProfileCubit;
//
// }
