import '/core/animations/grid_view_animation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '/core/boilerplate/get_model/widgets/GetModel.dart';
import '/core/widgets/buttons/main_elevated_button.dart';
import '/core/widgets/custom_image.dart';
import '/core/widgets/custom_text_rich.dart';
import '/features/categories/data/get_categories_details_respond_model.dart';
import '/features/categories/domain/repository/categories_repository.dart';
import '/features/home/presentation/widgets/custom_card.dart';
import '/features/home/presentation/widgets/general_widget_scaffold.dart';

class CategoriesDetails extends StatelessWidget {
  CategoriesDetails({
    super.key,
    required this.id,
    this.index1,
  });

  final int id;
  final int? index1;

  @override
  Widget build(BuildContext context) {
    return GeneralWidgetScaffold(
      body: _categoriesDetails(),
    );
  }

  GetModelCubit? _categoriesDetailsCubit;
  final ScrollController _scrollController = ScrollController();

  Widget _categoriesDetails() {
    return GetModel<GetCategoriesDetailsRespondModel>(
      onCubitCreated: (cubit) {
        _categoriesDetailsCubit = cubit;
      },
      repositoryCallBack: (data) =>
          CategoriesRepository.getCategoriesDetails(id),
      onSuccess: (GetCategoriesDetailsRespondModel model) {},
      modelBuilder: (GetCategoriesDetailsRespondModel model) {
        double gridViewLength() {
          if (model.data![1].images!.length == 4 ||
              model.data![1].images!.length == 3) {
            return 400;
          } else if (model.data![1].images!.length == 6 ||
              model.data![1].images!.length == 5) {
            return 600;
          } else if (model.data![1].images!.length == 8 ||
              model.data![1].images!.length == 7) {
            return 800;
          } else {
            return 200;
          }
        }

        // int indexGrid = 0;
        return Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...[
                  /*Row(
                    children: model.data![1!].images!
                        .map(
                          (e) => CustomNetworkImage(
                            imageUrl: e,
                          ),
                        )
                        .toList(),
                  ),*/
                  SizedBox(
                    width: double.infinity,
                    height: gridViewLength(),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of items in each row
                        crossAxisSpacing: 10, // Spacing between each column
                        mainAxisSpacing: 10, // Spacing between each row
                      ),
                      itemCount: model.data![1].images!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GridListAnimation(
                          index: index,
                          child: CustomCard(
                            child: CustomImage.rectangle(
                              image: model.data![1].images![index],
                              isNetworkImage: true,
                              viewInFullScreen: true,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  CustomTextRich(
                    mainText: "description",
                    secondText: model.data![1].description != null
                        ? " ${model.data![1].description}"
                        : "there_is_no_description",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextRich(
                        mainText: "price",
                        secondText: " ${model.data![1].price}",
                      ),
                      model.data![1].discount == 0
                          ? const SizedBox()
                          : CustomTextRich(
                              mainText: "discount",
                              secondText: " ${model.data![1].discount} %",
                            ),
                      CustomTextRich(
                        mainText: "old_price",
                        secondText: " ${model.data![1].oldPrice}",
                      ),
                    ],
                  ),
                  MainElevatedButton(
                    onPressed: () {},
                    text: 'order_it_now'.tr(),
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
          ),
        );
      },
    );
  }
}
