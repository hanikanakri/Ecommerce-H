import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

import '/core/constants/app_colors.dart';
import '/features/home/data/home_page_respond_model.dart';

class ConsoleSliderBanner extends StatelessWidget {
  ConsoleSliderBanner({
    super.key,
    this.model,
  });

  HomePageRespondModel? model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: CustomCarouselSlider(
        items: model!.banners!.map((e) {
          return CarouselItem(
            image: NetworkImage(e.image!),/*Image.network(
              e.image!,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.transparent,
                    backgroundImage: NetworkImage(e.image!),
                  );
                }
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: LoadingWidget(),
                );
              },
            ),*/
            onImageTap: (p0) {},
            boxDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100),),
              border: Border.all(
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              gradient: LinearGradient(
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                colors: [
                  Colors.blueAccent.withOpacity(1),
                  Colors.black.withOpacity(.3),
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          );
        }).toList(),
        height: 150,
        subHeight: 50,
        animationCurve: Curves.linear,
        width: MediaQuery.of(context).size.width * .9,
        autoplay: true,
        showText: false,
        showSubBackground: false,
        indicatorPosition: IndicatorPosition.bottom,
        indicatorShape: BoxShape.circle,
        selectedDotColor: AppColors.primaryColor,
        unselectedDotColor: AppColors.grey4,
      ),
    );
  }
}
