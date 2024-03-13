import 'package:flutter/material.dart';

import '../../../search/presentation/widgets/search_product.dart';
import '/core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '/core/boilerplate/get_model/widgets/GetModel.dart';
import '/features/categories/presentation/pages/all_categories.dart';
import '/features/home/data/home_page_respond_model.dart';
import '/features/home/domain/repository/home_page_repository.dart';
import '/features/home/presentation/widgets/ads_widget.dart';
import '/features/home/presentation/widgets/console_slider_banner.dart';
import '/features/home/presentation/widgets/shopping_list_home_page.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
    this.pageController,
  });

  PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildHomePage(pageController!),
    );
  }

  GetModelCubit? _getHomePageDataCubit;

  Widget _buildHomePage(PageController pageController) {
    return GetModel<HomePageRespondModel>(
      onCubitCreated: (cubit) {
        _getHomePageDataCubit = cubit;
      },
      onSuccess: (HomePageRespondModel model) {},
      repositoryCallBack: (data) => HomePageRepository.homePageData(),
      modelBuilder: (HomePageRespondModel model) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ...[
                SearchProduct(
                  onTap: () {
                    pageController.jumpToPage(3);
                    print("object");
                  },
                ),
                AllCategories(),
                ConsoleSliderBanner(model: model),
                AdsWidget(model: model),
                ShoppingListHomePage(model: model),
              ].expand(
                (element) => [
                  element,
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
