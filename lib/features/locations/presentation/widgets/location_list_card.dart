import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '/core/boilerplate/create_model/widgets/CreateModel.dart';
import '/core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';
import '/core/widgets/custom_google_maps.dart';
import '/features/locations/data/delete_address_respond_model.dart';
import '/features/locations/data/get_list_location_address_respond_model.dart';
import '/features/locations/domain/repository/location_repository.dart';
import '/features/locations/presentation/widgets/edit_location_page.dart';
import '/features/shopping/presentation/widgets/row_text.dart';

class LocationListCard extends StatelessWidget {
  LocationListCard({
    super.key,
    required this.model,
    required this.index,
    this.deleteAddress,
    this.listLocationCubit,
  });

  final PaginationCubit? listLocationCubit;

  final List<LocationListDetails> model;
  final int index;

  GoogleMapController? _mapController;

  final Function(int)? deleteAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        child: Container(
          width: double.infinity,
          //height: 400,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    "${model[index].name}",
                    style: AppTheme.bodySmall.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildDeleteLocation(
                        model[index].id!,
                        context,
                      ),
                      IconButton(
                        onPressed: () {
                          AnimationNavigation.sizePush(
                            context,
                            EditLocationPage(
                              model: model,
                              listLocationCubit: listLocationCubit,
                              index: index,
                              id: model[index].id!,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ...[
                const Divider(
                  color: AppColors.lightGrey,
                ),
                InkWell(
                  onTap: () {
                    AnimationNavigation.fadePush(
                      context,
                      CustomGoogleMaps(
                        controllerMap: (controller) {
                          _mapController = controller;
                        },
                        marker: Marker(
                          markerId: MarkerId('index ${model[index].id}'),
                          position: LatLng(
                            model[index].latitude!,
                            model[index].longitude!,
                          ),
                        ),
                        initPosition: LatLng(
                          model[index].latitude!,
                          model[index].longitude!,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.blueColor,
                        size: 15,
                      ),
                      Text(
                        "press_to_see_location_on_map".tr(),
                        style: AppTheme.bodySmall.copyWith(
                          color: AppColors.blueColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.blueColor,
                        ),
                      ),
                    ],
                  ),
                ),
                RowText(
                  firstText: 'address',
                  secondText:
                      " ${model[index].city}, ${model[index].region}, ${model[index].details}",
                ),
                AnimatedConditionalBuilder(
                  condition: model[index].notes != null,
                  builder: (context) => RowText(
                    firstText: 'notes',
                    isReadMore: true,
                    secondText: "  ${model[index].notes}",
                  ),
                  fallback: (context) => const SizedBox(),
                ),
              ].expand(
                (element) => [
                  element,
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  CreateModelCubit? _deleteLocationCubit;

  _buildDeleteLocation(int index, BuildContext context) {
    return CreateModel<DeleteAddressRespondModel>(
      repositoryCallBack: (data) =>
          LocationRepository.deleteLocationAddress(index),
      onCubitCreated: (cubit) {
        _deleteLocationCubit = cubit;
      },
      onSuccess: (DeleteAddressRespondModel model) {
        deleteAddress!(model.id!);
        final snackBar = SnackBar(
          content: Text(
            SharedStorage.getSuccessMessage(),
            style: AppTheme.bodySmall.copyWith(
              color: AppColors.white,
            ),
          ),
          duration: const Duration(
            seconds: 2,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: IconButton(
        onPressed: () {
          if (_deleteLocationCubit != null) {
            _deleteLocationCubit!.createModel(null);
          } else {
            null;
          }
        },
        icon: const Icon(
          Icons.delete_outline,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
