import 'package:flutter/material.dart';

import '/core/animations/animation_text.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/custom_image.dart';
import '/features/home/presentation/widgets/custom_card.dart';
import '/features/wish_list/data/get_wish_list_respond_model.dart';

class WishListCard extends StatelessWidget {
  WishListCard({
    super.key,
    this.model,
    this.onDelete,
    required this.index,
  });

  List<GetFavoriteModel>? model;
  final int index;

  final Function(int)? onDelete;

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
          children: [
            Expanded(
              flex: 4,
              child: CustomCard(
                hasFavorite: true,
                onDelete: onDelete,
                isDiscount:
                    model![index].product!.discount! == 0 ? false : true,
                favoriteId: model![index].product!.id!,
                child: CustomImage.rectangle(
                  image: model![index].product!.image!,
                  isNetworkImage: true,
                  svg: false,
                  viewInFullScreen: false,
                  height: 200,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: AnimationText(
                  text: model![index].product!.name!,
                ),
                /*Text(
                    model![index].product!.name!,
                    style: AppTheme.bodySmall.copyWith(
                      color: AppColors.black,
                      fontSize: 12,
                    ),
                  ),*/
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${model![index].product!.price!}£",
                  style: AppTheme.bodySmall.copyWith(
                    textBaseline: TextBaseline.alphabetic,
                    color: AppColors.primaryColor,
                  ),
                ),
                //Text("${model!.products![index!].discount}"),
                model![index].product!.price! !=
                        model![index].product!.oldPrice!
                    ? Text(
                        "${model![index].product!.oldPrice!}£",
                        style: AppTheme.bodySmall.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.blue,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
