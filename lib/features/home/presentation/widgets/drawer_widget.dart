// ignore_for_file: must_be_immutable

import '/core/constants/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '/core/boilerplate/create_model/widgets/CreateModel.dart';
import '/core/constants/app_colors.dart';
import '/core/utils/general_app_dialog.dart';
import '/core/utils/shared_storage.dart';
import '/features/settings/data/log_out_request_model.dart';
import '/features/settings/data/log_out_respond_model.dart';
import '/features/settings/domain/repository/settings_repository.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _drawerItem(
              'change_language'.tr(),
              onTap: () {
                GeneralChangeLanguageDialog.showChangLanguageDialog(context);
                //changeLanguage(context);
              },
            ),
            _logOutButton(context),
           /* _drawerItem(
              'profile',
              onTap: () {
                AnimationNavigation.slidePush(
                  context,
                  ProfilePage(),
                );
              },
            ),*/
          ],
        ),
      ),
    );
  }

/*
  Function changeLanguage(context){
    return UtilDialog.showAwesomeDialog(
      context: context,
      btnCancelText: 'en',
      btnOkText: 'ar',
      cancel: () {},
      ok: () {},
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Text(
          'change_language'.tr(),
          style: AppTheme.headline,
        ),
      ),
    );
  }*/

  Widget _drawerItem(String text, {GestureTapCallback? onTap}) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.primaryColor,
          ),
          child: ListTile(
            //trailing: Text(text),
            title: Center(
              child: Text(
                text.tr(),
                style: AppTheme.headline,
              ),
            ),

            onTap: onTap,
          ),
        ),
      ],
    );
  }

  CreateModelCubit? _logOutCubit;

  _logOutButton(context) {
    return CreateModel<LogOutRespondModel>(
      repositoryCallBack: (data) => SettingsRepository.logOut(data),
      onCubitCreated: (cubit) {
        _logOutCubit = cubit;
      },
      onSuccess: (LogOutRespondModel model) {
        SharedStorage.removeToken();
        SharedStorage.removeFcmToken();
        Phoenix.rebirth(context);
      },
      child: _drawerItem(
        'log_out'.tr(),
        onTap: () {
          _logOutCubit!.createModel(
            LogOutRequestModel(
              fcmToken: SharedStorage.getFcmToken(),
            ),
          );
        },
      ),
    );
  }
}
