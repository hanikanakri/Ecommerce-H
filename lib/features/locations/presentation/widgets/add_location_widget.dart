import 'package:flutter/material.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '/core/constants/app_colors.dart';
import '/features/locations/presentation/pages/add_location_page.dart';

class AddLocationWidget extends StatelessWidget {
    AddLocationWidget({
    super.key,
    this.listLocationCubit,
  });

  late PaginationCubit? listLocationCubit;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        AnimationNavigation.slidePush(
            context,
            AddLocationPage(
              listLocationCubit: listLocationCubit,
            ),);
        print('=============add location===============');
      },
      child: Material(
        elevation: 5,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(
            Icons.add_location_alt_outlined,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
