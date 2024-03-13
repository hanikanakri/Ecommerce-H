import 'package:flutter/material.dart';

import '/core/animations/animation_text.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';
import '/core/widgets/custom_image.dart';
import '/features/home/data/home_page_respond_model.dart';
import '/features/home/presentation/widgets/custom_card.dart';

class CustomCardShoppingList extends StatefulWidget {
  const CustomCardShoppingList({
    super.key,
    this.model,
    this.index,
    this.isVisible = true,
    this.isScroll,
  });

  final HomePageRespondModel? model;
  final int? index;

  final ValueChanged<bool>? isScroll;

  final bool? isVisible;

  @override
  State<CustomCardShoppingList> createState() => _CustomCardShoppingListState();
}

class _CustomCardShoppingListState extends State<CustomCardShoppingList> {
  bool s = true;

  @override
  Widget build(BuildContext context) {
    //List<String>? images = widget.model!.products![widget.index!].images;
    return SizedBox(
      // height: 300,
      width: 250,
      child: Stack(
        children: [
          Card(
            color: AppColors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  ...[
                    CustomCard(
                      isDiscount:
                          widget.model!.products![widget.index!].discount! == 0
                              ? false
                              : true,
                      child: CustomImage.rectangle(
                        image: widget.model!.products![widget.index!].image!,
                        isNetworkImage: true,
                        svg: false,
                        viewInFullScreen: false,
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: AnimationText(
                        text: widget.model!.products![widget.index!].name!,
                      ),
                    ),
                    /*Text(
                      widget.model!.products![widget.index!].name!,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.bodySmall.copyWith(
                        color: AppColors.black,
                      ),
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.model!.products![widget.index!].price}£",
                          style: AppTheme.bodySmall.copyWith(
                            textBaseline: TextBaseline.alphabetic,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        //Text("${model!.products![index!].discount}"),
                        widget.model!.products![widget.index!].oldPrice !=
                                widget.model!.products![widget.index!].price
                            ? Text(
                                "${widget.model!.products![widget.index!].oldPrice}£",
                                style: AppTheme.bodySmall.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: AppColors.blue,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ].expand(
                    (element) => [
                      element,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: widget.index == 1 && s,
            child: Align(
              alignment: SharedStorage.getLanguage() == "en"
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                  left: SharedStorage.getLanguage() == "en" ? 50 : 0,
                  right: SharedStorage.getLanguage() == "ar" ? 50 : 0,
                ),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isScroll!(false);
                      s = false;
                    });
                  },
                  icon: SharedStorage.getLanguage() == "ar"
                      ? const Icon(
                          Icons.arrow_back_ios,
                        )
                      : const Icon(
                          Icons.arrow_forward_ios,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
