import 'package:flutter/material.dart';

import '/core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '/core/boilerplate/get_model/widgets/GetModel.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/custom_text_rich.dart';
import '/features/settings/data/get_settings_data_respond_model.dart';
import '/features/settings/domain/repository/settings_repository.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Settings Page',
            style: AppTheme.headline,
          ),
          _buildSettings(),
        ],
      ),
    );
  }

  GetModelCubit? _settingsCubit;

  _buildSettings() {
    return GetModel<GetSettingsDataRespondModel>(
      onCubitCreated: (cubit) {
        _settingsCubit = cubit;
      },
      repositoryCallBack: (data) => SettingsRepository.getSettings(),
      onSuccess: (GetSettingsDataRespondModel model) {},
      modelBuilder: (GetSettingsDataRespondModel model) {
        return Column(
          children: [
            CustomTextRich(
              mainText: 'about',
              secondText: "  ${model.about}",
            ),
            CustomTextRich(
              mainText: 'terms',
              secondText: "  ${model.terms}",
            ),
            /*Text.rich(
              TextSpan(
                text: 'about'.tr(),
                style: AppTheme.headline,
                children: [
                  TextSpan(
                    text: ,
                    style: AppTheme.bodySmall,
                  )
                ],
              ),
            ),*/
            // Text.rich(
            //   TextSpan(
            //     text: 'terms'.tr(),
            //     style: AppTheme.headline,
            //     children: [
            //       TextSpan(
            //         text: "  ${model.terms}",
            //         style: AppTheme.bodySmall,
            //       )
            //     ],
            //   ),
            // ),
            Text("${model.terms}"),
          ],
        );
      },
    );
  }
}
