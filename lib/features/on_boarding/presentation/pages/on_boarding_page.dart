import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/constants/constant.dart';
import '/core/widgets/custom_button.dart';
import '/core/widgets/custom_text_rich.dart';
import '/core/widgets/image_title_subtitle.dart';
import '/features/auth/presentation/pages/register.dart';
import '/features/auth/presentation/widgets/general_scaffold_auth.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  String? city;
  String? region;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return GeneralScaffoldAuth(
      horizontal: 10,
      actions: [
        TextButton(
          onPressed: () {
            AnimationNavigation.slidePush(context, const Register());
          },
          child: Text(
            "skip".tr(),
            style: AppTheme.bodySmall.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
      leading: Center(
        child: CustomTextRich(
          mainText: '${currentIndex + 1}',
          secondText: '/3',
          secondStyle: AppTheme.bodySmall,
          mainStyle: AppTheme.bodySmall.copyWith(
            fontWeight: FontWeight.bold,
            color: currentIndex + 1 == 3
                ? AppColors.primaryColor
                : AppColors.black,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (builder, sizes) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: CarouselSlider(
                  carouselController: _carouselController,
                  items: [
                    ImageTitleSubtitle(
                      imageUrl: AppAssets.onBoarding1URI,
                      title: 'choose_products',
                      subTitle: "all_data_in_this_app_is_fake",
                      onPressButton: () {
                        _carouselController.nextPage();
                      },
                    ),
                    ImageTitleSubtitle(
                      imageUrl: AppAssets.onBoarding2URI,
                      title: 'make_payment',
                      subTitle: "all_payment_process_in_this_app_is_fake",
                      onPressButton: () {
                        _carouselController.nextPage();
                      },
                    ),
                    ImageTitleSubtitle(
                      imageUrl: AppAssets.onBoarding3URI,
                      title: 'get_your_order',
                      subTitle: "this_app_is_only_to_test",
                      onPressButton: () {
                        _carouselController.nextPage();
                      },
                    ),
                  //  SvgPicture.asset(AppAssets.onBoarding1URI),
                  ],
                  options: CarouselOptions(
                      height: double.maxFinite,
                      autoPlay: false,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlayCurve: Curves.easeInOutCirc,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 900),
                      onPageChanged: (index, _) {
                        setState(() {
                          currentIndex = index;
                        });
                      }),
                ),
              ),
              Expanded(
                child: buildFooterPage(
                  sizes: sizes,
                  currentIndex: currentIndex,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  buildFooterPage({sizes, required int currentIndex}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: currentIndex == 0 ? false : true,
          child: TextButton(
            onPressed: () {
              _carouselController.animateToPage(currentIndex - 1);
            },
            child: Text(
              'prev'.tr(),
              style: AppTheme.bodySmall.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        AnimatedSmoothIndicator(
          count: 3,
          activeIndex: currentIndex,
          effect: ExpandingDotsEffect(
            dotHeight: sizes.maxHeight * 1.2 / 100,
            dotWidth: sizes.maxWidth * 0.02,
            expansionFactor: 5,
            spacing: 12,
            activeDotColor: AppColors.black,
            dotColor: AppColors.greyApp,
          ),
        ),
        CustomTextButton(
          onPressed: currentIndex == 2
              ? () {
                  AnimationNavigation.slidePush(
                    context,
                    const Register(),
                  );
                }
              : () {
                  _carouselController.nextPage();
                },
          title: currentIndex == 2 ? 'get_started'.tr() : 'next'.tr(),
          style: AppTheme.bodySmall.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        /*TextButton(
          onPressed: currentIndex == 2
              ? () {
                  AnimationNavigation.slidePush(
                    context,
                    const Register(),
                  );
                }
              : () {
                  _carouselController.nextPage();
                },
          child: Text(
            currentIndex == 2 ? 'get_started'.tr() : 'next'.tr(),
            style: AppTheme.bodySmall.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),*/
      ],
    );
  }
}
