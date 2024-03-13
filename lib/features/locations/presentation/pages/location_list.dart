import 'package:e_commerce_h/core/animations/list_view_animations.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '/core/boilerplate/pagination/widgets/PaginationList.dart';
import '/core/widgets/custom_google_maps.dart';
import '/features/home/presentation/widgets/general_widget_scaffold.dart';
import '/features/locations/data/get_list_location_address_respond_model.dart';
import '/features/locations/domain/repository/location_repository.dart';
import '/features/locations/presentation/pages/location_card.dart';
import '/features/locations/presentation/widgets/add_location_widget.dart';
import '/features/locations/presentation/widgets/location_list_card.dart';
import '/features/shopping/presentation/widgets/row_icon_text.dart';

class LocationList extends StatefulWidget {
  const LocationList({
    super.key,
  });

  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  GoogleMapController? _controllerMap;
  late PaginationCubit? _listLocationCubit;

  @override
  Widget build(BuildContext context) {
    return GeneralWidgetScaffold(
      vertical: 5,
      body: Column(
        children: [
          ...[
            const RowIconText(
              text: "main_center_Location",
              icon: Icons.location_on_outlined,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      AnimationNavigation.fadePush(
                        context,
                        CustomGoogleMaps(
                          controllerMap: (GoogleMapController controller) {
                            _controllerMap = controller;
                          },
                          marker: const Marker(
                            markerId: MarkerId('0'),
                            position: LatLng(33.514277, 36.276377),
                          ),
                          initPosition: const LatLng(33.509168, 36.298650),
                        ),
                      );
                    },
                    child: const LocationCard(),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: AddLocationWidget(
                    listLocationCubit: _listLocationCubit,
                  ),
                ),
              ],
            ),
            const RowIconText(
              text: "branches_location",
              icon: Icons.location_on_outlined,
            ),
            Expanded(
              child: _buildListLocations(),
            ),
          ].expand(
            (element) => [
              element,
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



  _buildListLocations() {
    return PaginationList<LocationListDetails>(
      onCubitCreated: (cubit) {
        _listLocationCubit = cubit;
      },
      repositoryCallBack: (data) =>
          LocationRepository.getListLocationAddresses(),
      listBuilder: (List<LocationListDetails> list) {
        return ListViewAnimations(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListAnimation(
              index: index,
              child: LocationListCard(
                model: list,
                index: index,
                listLocationCubit: _listLocationCubit,
                deleteAddress: (addressId) {
                  setState(() {
                    list.removeWhere(
                      (element) => element.id == addressId,
                    );
                  });
                },
              ),
            );
          },
        );
      },
    );
  }

/*_buildListLocations() {
    return PaginationList<LocationListDetails>(
      onCubitCreated: (cubit) {
        _listLocationCubit = cubit;
      },
      repositoryCallBack: (data) =>
          LocationRepository.getListLocationAddresses(),
      listBuilder: (List<LocationListDetails> list) {
        return ListView.builder(
          itemCount: list.length ?? 0,
          itemBuilder: (context, index) {
            return LocationListCard(
              model: list,
              index: index,
              listLocationCubit: _listLocationCubit,
              deleteAddress: (addressId) {
                setState(() {
                  list.removeWhere(
                    (element) => element.id == addressId,
                  );
                });
              },
            );
          },
        );
      },
    );
  }*/
}
