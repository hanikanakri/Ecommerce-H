import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/widgets/custom_text_field.dart';

class SearchProduct extends StatelessWidget {
  SearchProduct({
    super.key,
    this.onTap,
    this.isSearch = false,
    this.searchController,
    this.onChanged,
  });

  TextEditingController? searchController;
  void Function()? onTap;
  void Function(String)? onChanged;
  bool isSearch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSearch ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: CustomTextField(
          controller: searchController,
          fillColor: AppColors.white,
          icon: Icons.search,
          isBorder: false,
          enabled: isSearch,
           onChanged: onChanged,
          textInputAction: TextInputAction.search,
          suffix: const Icon(
            Icons.mic_rounded,
            color: AppColors.primaryGrey,
          ),
          hintText: 'search_any_product'.tr(),
        ),
      ),
    );
  }
}
