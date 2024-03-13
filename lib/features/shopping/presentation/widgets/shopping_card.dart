import '/core/animations/animation_text.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/custom_image.dart';
import '/features/home/presentation/widgets/custom_card.dart';
import '/features/shopping/data/get_shopping_data_respond_model.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({
    super.key,
    this.model,
    required this.index,
  });

  final GetShoppingDataRespondModel? model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      color: AppColors.blueLightColor,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...[
              Expanded(
                flex: 3,
                child: CustomCard(
                  hasFavorite: true,
                  isDiscount: model!.data![index].discount! == 0 ? false : true,
                  isFavorite: model!.data![index].inFavorites!,
                  favoriteId: model!.data![index].id!,
                  child: CustomImage.rectangle(
                    image: model!.data![index].image!,
                    isNetworkImage: true,
                    svg: false,
                    viewInFullScreen: false,
                    height: 200,
                  ),
                ),
              ),
              Expanded(
                child: AnimationText(
                  text: model!.data![index].name!,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${model!.data![index].price!}£",
                    style: AppTheme.bodySmall.copyWith(
                      textBaseline: TextBaseline.alphabetic,
                      color: AppColors.primaryColor,
                      fontSize: 12,
                    ),
                  ),
                  model!.data![index].price! != model!.data![index].oldPrice
                      ? Text(
                          "${model!.data![index].oldPrice}£",
                          style: AppTheme.bodySmall.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.blue,
                            fontSize: 12,
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
                    vertical: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
