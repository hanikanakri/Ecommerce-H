import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/core/animations/fade_animation.dart';
import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '/core/boilerplate/create_model/widgets/CreateModel.dart';
import '/core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/navigation.dart';
import '/core/utils/validators.dart';
import '/core/widgets/address_selection.dart';
import '/core/widgets/buttons/main_elevated_button.dart';
import '/core/widgets/custom_text_field.dart';
import '/core/widgets/dropdown_textfield.dart';
import '/core/widgets/registration_drop_down.dart';
import '/features/home/presentation/widgets/general_widget_scaffold.dart';
import '/features/locations/data/add_branch_location_address_request_model.dart';
import '/features/locations/data/delete_address_respond_model.dart';
import '/features/locations/domain/repository/location_repository.dart';
import '/features/locations/presentation/widgets/icon_text_button.dart';
import '/features/shopping/presentation/widgets/row_icon_text.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({
    super.key,
    this.listLocationCubit,
  });

  final PaginationCubit? listLocationCubit;

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  final List<DropDownValueModel<dynamic>> dropDownList = [
    DropDownValueModel(name: "work".tr(), value: 0),
    DropDownValueModel(name: "branch".tr(), value: 1),
    DropDownValueModel(name: "group".tr(), value: 2),
  ];

  SingleValueDropDownController controller = SingleValueDropDownController();

  AddLocationData locationData = AddLocationData();

  LatLng? latLng;

  final TextEditingController _regionController = TextEditingController();

  final TextEditingController _streetController = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();

  final GlobalKey<FormState> _locationKey = GlobalKey<FormState>();

  final FocusNode _regionFocusNode = FocusNode();

  final FocusNode _cityFocusNode = FocusNode();

  final FocusNode _streetFocusNode = FocusNode();

  final FocusNode _noteFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ggggggggggg===================");
    locationData.name = dropDownList.first.name;
  }

  @override
  Widget build(BuildContext context) {
    return GeneralWidgetScaffold(
      body: Form(
        key: _locationKey,
        child: Column(
          children: [
            const RowIconText(
              icon: Icons.add_location_alt_outlined,
              text: "add_your_branch_location",
            ),
            CustomDropDown_2(
              values: dropDownList,
              hintText: "select_your_location_type",
              labelText: "select_your_location_type",
              initialValue: dropDownList.first.name,
              hintStyle: AppTheme.headline.copyWith(
                color: Colors.black,
              ),
              validationText: 'must_not_be_empty'.tr(),
              onChangeSelectedItem: (dropDownValue) {
                if (dropDownValue != null && dropDownValue != "") {
                  locationData.name = dropDownValue.name;
                  print(dropDownValue.name);
                }
              },
              inputDecoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            IconTextButton(
              onTap: () {
                AnimationNavigation.scalePush(
                  context,
                  AddressSelection(
                    onMarkerSelected: (p0, {index}) async {
                      latLng = p0;

                      List<Placemark> placeMarks =
                          await placemarkFromCoordinates(
                        latLng!.latitude,
                        latLng!.longitude,
                      );
                      print(placeMarks);
                      print(index);
                      if (placeMarks.isNotEmpty) {
                        locationData.city =
                            _cityController.text = placeMarks.first.locality!;
                        locationData.region = _regionController.text =
                            placeMarks.first.administrativeArea!;
                        locationData.details = _streetController.text =
                            placeMarks.first.subAdministrativeArea!;
                      }
                      locationData.latitude = latLng!.latitude;
                      locationData.longitude = latLng!.longitude;
                    },
                  ),
                );
              },
              text: "tap_to_select_your_location_on_map",
              icon: Icons.location_searching_sharp,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...[
                  FadeAnimation(
                    child: CustomTextField(
                      hintText: 'city'.tr(),
                      isBorder: true,
                      icon: Icons.location_city,
                      controller: _cityController,
                      textInputAction: TextInputAction.next,
                      focusNode: _cityFocusNode,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                          Validator.nameValidate(_cityController.text, context),
                    ),
                  ),
                  FadeAnimation(
                    delay: 1.4,
                    child: CustomTextField(
                      hintText: 'region'.tr(),
                      icon: Icons.area_chart,
                      controller: _regionController,
                      textInputAction: TextInputAction.next,
                      focusNode: _regionFocusNode,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      keyboardType: TextInputType.text,
                      validator: (value) => Validator.emailValidator(
                        _regionController.text,
                        context,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    delay: 1.8,
                    child: CustomTextField(
                      hintText: 'street'.tr(),
                      icon: Icons.edit_road,
                      keyboardType: TextInputType.text,
                      focusNode: _streetFocusNode,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      controller: _streetController,
                      textInputAction: TextInputAction.next,
                      validator: (value) => Validator.passwordValidateLogin(
                          _streetController.text, context),
                    ),
                  ),
                  FadeAnimation(
                    delay: 2.2,
                    child: CustomTextField(
                      hintText: 'your_notes'.tr(),
                      keyboardType: TextInputType.text,
                      focusNode: _noteFocusNode,
                      onEditingComplete: () {
                        _addLocationCubit!.createModel(
                          AddBranchLocationAddressRequestModel(
                            latitude: locationData.latitude,
                            longitude: locationData.longitude,
                            city: locationData.city,
                            details: locationData.details,
                            name: locationData.name,
                            notes: _noteController.text,
                            region: locationData.region,
                          ),
                        );
                      },
                      controller: _noteController,
                      textInputAction: TextInputAction.done,
                      maxLines: 10,
                    ),
                  ),
                ].expand(
                  (element) => [
                    element,
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            _buildAddLocation(
              locationData,
              context,
              _noteController,
            ),
          ],
        ),
      ),
    );
  }

  CreateModelCubit? _addLocationCubit;

  _buildAddLocation(AddLocationData locationData, BuildContext context,
      TextEditingController? controller) {
    return CreateModel<DeleteAddressRespondModel>(
      repositoryCallBack: (data) =>
          LocationRepository.addBranchLocationAddress(data),
      onCubitCreated: (cubit) {
        _addLocationCubit = cubit;
      },
      onSuccess: (DeleteAddressRespondModel model) {
        widget.listLocationCubit!.getList();
        Navigation.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: MainElevatedButton(
          onPressed: () {
            _addLocationCubit!.createModel(
              AddBranchLocationAddressRequestModel(
                latitude: locationData.latitude,
                longitude: locationData.longitude,
                city: locationData.city,
                details: locationData.details,
                name: locationData.name,
                notes: controller!.text,
                region: locationData.region,
              ),
            );
          },
          text: 'add',
        ),
      ),
    );
  }
}

class AddLocationData {
  String? name;
  String? city;
  String? region;
  String? details;
  double? latitude;
  double? longitude;
  String? notes;

  AddLocationData({
    this.name,
    this.city,
    this.region,
    this.details,
    this.latitude,
    this.longitude,
    this.notes,
  });
}
