import '/core/utils/shared_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/widgets/custom_image.dart';
import '/features/home/presentation/pages/home_page.dart';
import '/features/home/presentation/widgets/botton_nav_bar_animation.dart';
import '/features/home/presentation/widgets/drawer_widget.dart';
import '/features/profile/presentation/pages/profile_page.dart';
import '/features/search/presentation/pages/search_page.dart';
import '/features/settings/presentation/pages/settings_page.dart';
import '/features/shopping/presentation/pages/shopping_page.dart';
import '/features/wish_list/presentation/pages/wish_list_page.dart';

class GeneralScaffoldHome extends StatefulWidget {
  const GeneralScaffoldHome({
    super.key,
    this.body,
    this.pages,
  });

  final Widget? body;
  final List<Widget>? pages;

  @override
  State<GeneralScaffoldHome> createState() => _GeneralScaffoldHomeState();
}

class _GeneralScaffoldHomeState extends State<GeneralScaffoldHome> {
  int currentIndex = 0;
  bool isNavBar = true;

  GlobalKey<ScaffoldState>? homeScaffoldKey = GlobalKey<ScaffoldState>();
   PageController? pageController;


  late List<Widget> pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);

     pages = [
      HomePage(pageController:pageController),
      const WishListPage(),
      ShoppingPage(),
      const SearchPage(),
      SettingPage(),
    ];
  }





  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: homeScaffoldKey,
          backgroundColor: AppColors.backgroundGray,
          appBar: appBarWidget(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: widget.body ??
                PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  children: pages,
                ),
          ),
          bottomNavigationBar: HomeBottomNavBar(
            currentIndex: currentIndex,
            index: (value) {
              setState(() {
                currentIndex = value;
              });

              switch (currentIndex) {
                case 0:
                  {
                    pageController!.jumpToPage(0);
                  }
                  break;
                case 1:
                  {
                    pageController!.jumpToPage(1);
                  }
                  break;
                case 2:
                  {
                    pageController!.jumpToPage(2);
                  }
                  break;
                case 3:
                  {
                    pageController!.jumpToPage(3);
                  }
                  break;
                case 4:
                  {
                    pageController!.jumpToPage(4);
                  }
                  break;
              }
              print(value);
            },
          ),
          drawer: DrawerWidget(),
          onDrawerChanged: (isOpened) {
            setState(() {
              isNavBar = !isOpened;
            });
          },
        ),
        Visibility(
          visible: isNavBar,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: FloatingActionButton(
                  backgroundColor: currentIndex == 2
                      ? AppColors.primaryColor
                      : AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    setState(() {
                      currentIndex = 2;
                      pageController!.jumpToPage(2);
                    });
                  },
                  child: SvgPicture.asset(
                    AppAssets.shoppingNave,
                    color:
                    currentIndex == 2 ? AppColors.white : AppColors.black,
                  )),
            ),
          ),
        ),
      ],
    );
  }

  appBarWidget() {
    return AppBar(
      backgroundColor: AppColors.backgroundGray,
      leading: InkWell(
        onTap: () {
          homeScaffoldKey!.currentState!.openDrawer();
        },
        child: Container(
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.lightGrey),
          child: SvgPicture.asset(
            AppAssets.drawerMenu,
            fit: BoxFit.fill,
            color: AppColors.black,
          ),
        ),
      ),
      title: SvgPicture.asset(
        AppAssets.homePageAppBarLogo,
        fit: BoxFit.contain,
      ),
      actions: [
        /*_buildProfilePage(),*/
        InkWell(
          onTap: () {
            AnimationNavigation.slidePush(
              context,
              const ProfilePage(),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              right: SharedStorage.getLanguage() == 'en' ? 8.0 : 0.0,
              left: SharedStorage.getLanguage() == 'ar' ? 8.0 : 0.0,
            ),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(100),
              child: CustomImage.circular(
                radius: 48,
                image: SharedStorage.getImageURL() ?? AppAssets.profilePicture,
                isNetworkImage: SharedStorage.getImageURL() == null
                    ? false
                    : true,
              ),
            ),
          ),
        ),
      ],
    );
  }


}
