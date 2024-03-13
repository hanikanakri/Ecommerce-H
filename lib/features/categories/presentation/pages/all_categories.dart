import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '/core/boilerplate/get_model/widgets/GetModel.dart';
import '/core/constants/app_theme.dart';
import '/features/categories/data/get_all_categories_respond_model.dart';
import '/features/categories/domain/repository/categories_repository.dart';
import '/features/categories/presentation/widgets/categories_list.dart';

class AllCategories extends StatelessWidget {
  AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...[
          Text(
            'all_categories'.tr(),
            style: AppTheme.headline,
            textAlign: TextAlign.start,
          ),
          _allCategories(),
        ].expand(
          (element) => [
            element,
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }

  GetModelCubit? _getAllCategoriesCubit;

  _allCategories() {
    return GetModel<GetAllCategoriesRespondModel>(
      repositoryCallBack: (data) => CategoriesRepository.getAllCategories(),
      onCubitCreated: (cubit) {
        _getAllCategoriesCubit = cubit;
      },
      onSuccess: (GetAllCategoriesRespondModel model) {},
      modelBuilder: (GetAllCategoriesRespondModel model) {
        return CategoriesList(model: model);
      },
    );
  }
}
