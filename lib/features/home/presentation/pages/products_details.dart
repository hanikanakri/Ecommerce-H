import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/animations/grid_view_animation.dart';
import '/core/widgets/buttons/main_elevated_button.dart';
import '/core/widgets/custom_image.dart';
import '/core/widgets/custom_text_rich.dart';
import '/features/home/data/home_page_respond_model.dart';
import '/features/home/presentation/widgets/custom_card.dart';
import '/features/home/presentation/widgets/general_widget_scaffold.dart';

class ProductsDetails extends StatelessWidget {
  ProductsDetails({
    super.key,
    this.model,
    required this.index,
  });

  final HomePageRespondModel? model;
  final int index;

  final ScrollController _scrollController = ScrollController();

  late int gridIndex;

  @override
  Widget build(BuildContext context) {
    return GeneralWidgetScaffold(
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...[
                /*Row(
                  children: model!.products![index].images!
                      .map(
                        (e) => CustomNetworkImage(
                          imageUrl: e,
                        ),
                      )
                      .toList(),
                ),*/
                SizedBox(
                  height: gridViewLength(),
                  width: double.infinity,
                  child: GridViewAnimation(
                    columnCount: 2,
                    gridLength: model!.products![index].images!.length,
                    itemBuilder: (BuildContext context, int index1) {
                      return GridListAnimation(
                        index: index1,
                        child: CustomCard(
                          child: CustomImage.rectangle(
                            image: model!.products![index].images![index1],
                            isNetworkImage: true,
                            svg: false,
                            viewInFullScreen: true,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CustomTextRich(
                    mainText: "name",
                    secondText: " ${model!.products![index].name}"),
                CustomTextRich(
                  mainText: "description",
                  secondText: model!.products![index].description != null
                      ? " ${model!.products![index].description}"
                      : "there_is_no_description",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextRich(
                      mainText: "price",
                      secondText: " ${model!.products![index].price}",
                    ),
                    model!.products![index].discount == 0
                        ? const SizedBox()
                        : CustomTextRich(
                            mainText: 'discount',
                            secondText: " ${model!.products![index].discount}",
                          ),
                    CustomTextRich(
                      mainText: "old_price",
                      secondText: " ${model!.products![index].oldPrice}",
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
      ),
    );
  }

  double gridViewLength() {
    if (model!.products![index].images!.length == 4 ||
        model!.products![index].images!.length == 3) {
      return 400;
    } else if (model!.products![index].images!.length == 6 ||
        model!.products![index].images!.length == 5) {
      return 600;
    } else if (model!.products![index].images!.length == 8 ||
        model!.products![index].images!.length == 7) {
      return 700;
    } else {
      return 200;
    }
  }
}
