import '/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/features/home/data/home_page_respond_model.dart';
import '/features/home/presentation/widgets/custom_card.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({
    Key? key,
    this.model,
  }) : super(key: key);

  final HomePageRespondModel? model;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: size * 0.25,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.blueShade,
        ),
        child: CustomCard(
          child: Center(
            child: CustomImage.rectangle(
              image: model!.ad!,
              isNetworkImage: true,
              cornerRadius: 15,
            ),
          ),
          // child: CustomNetworkImage(
          //   imageUrl: model!.ad!,
          // ),
        ), /*Image.network(
          ,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const LoadingWidget();
          },
        ),*/
      ),
    );
  }
}
