import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:permission_handler/permission_handler.dart';

import '/core/animations/grid_view_animation.dart';
import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '/core/boilerplate/get_model/widgets/GetModel.dart';
import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/custom_image.dart';
import '/features/locations/presentation/pages/location_card.dart';
import '/features/locations/presentation/pages/location_list.dart';
import '/features/shopping/data/get_shopping_data_respond_model.dart';
import '/features/shopping/domain/repository/shopping_repository.dart';
import '/features/shopping/presentation/widgets/row_icon_text.dart';
import '/features/shopping/presentation/widgets/shopping_card.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double sized = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: _refreshShoppingPage,
      child: Scrollbar(
        radius: const Radius.circular(25),
//        thumbVisibility: true,
        interactive: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImage.rectangle(
                            image: AppAssets.locationShopping,
                            svg: true,
                            isNetworkImage: false,
                            color: AppColors.black,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'main_address'.tr(),
                              style: AppTheme.headline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        print(
                            '===================location===========================');
                        _requestPermission().then((value) {
                          AnimationNavigation.sizePush(context, const LocationList());
                        });
                      },
                      child: const LocationCard(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const RowIconText(
                      icon: Icons.shopping_cart_outlined,
                      text: 'main_products',
                    ),
                    _buildShoppingList(),
                  ],
                ),
              ].expand(
                (element) => [
                  element,
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _requestPermission() async {
    final status = await Permission.location.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      final PermissionStatus newStatus = await Permission.location.request();
      if (newStatus.isDenied) {
        // The user denied the permission.
        await Permission.location.request();
        print("Location permission request is denied");
      }
    } else {
      print("Location permission is already granted");
    }
  }

  GetModelCubit? _getShoppingCubit;

  late GetModelCubit _refresh;

  Future<void> _refreshShoppingPage() async {
    _refresh.getModel();
  }

  _buildShoppingList() {
    return GetModel<GetShoppingDataRespondModel>(
      repositoryCallBack: (data) => ShoppingRepository.shoppingList(),
      onCubitCreated: (cubit) {
        _getShoppingCubit = cubit;
        _refresh = cubit;
      },
      onSuccess: (GetShoppingDataRespondModel model) {},
      modelBuilder: (GetShoppingDataRespondModel model) {
        return GridView.custom(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4.5,
            pattern: [
              const WovenGridTile(0.54),
              const WovenGridTile(
                0.52,
                crossAxisRatio: 0.87,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: model.data!.length,
            (context, index) {
              return GridListAnimation(
                index: index,
                child: ShoppingCard(
                  model: model,
                  index: index,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
