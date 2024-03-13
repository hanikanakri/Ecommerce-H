import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '/core/animations/grid_view_animation.dart';
import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '/core/boilerplate/create_model/widgets/CreateModel.dart';
import '/core/constants/app_theme.dart';
import '/features/search/data/search_product_request_model.dart';
import '/features/search/data/search_product_respond_model.dart';
import '/features/search/domain/repository/search_repository.dart';
import '/features/search/presentation/widgets/search_card.dart';
import '/features/search/presentation/widgets/search_product.dart';
import '/features/shopping/presentation/widgets/row_icon_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? text = '';

  Key? _refreshIndicatorKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RowIconText(
          text: 'search_product',
          icon: Icons.search,
          vertical: 3,
        ),
        SearchProduct(
          isSearch: true,
          onChanged: (p0) {
            setState(() {
              text = p0;
            });
            if (text!.length > 1) {
              search();
            }
            print("object================");
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () => search(),
            child: _buildListSearchCubit(),
          ),
        ),
      ],
    );
  }

  Future<void> search() async {
    await _searchCubit!.createModel(
      SearchProductRequestModel(
        text: text,
      ),
    );
  }

  CreateModelCubit? _searchCubit;

  SearchProductRespondModel? model1;

  _buildListSearchCubit() {
    return CreateModel<SearchProductRespondModel>(
      withSuccessMessage: true,
      onCubitCreated: (CreateModelCubit cubit) {
        _searchCubit = cubit;
      },
      repositoryCallBack: (data) => SearchRepository.searchProduct(data),
      onSuccess: (SearchProductRespondModel model) {
        setState(() {
          model1 = model;
        });
      },
      child: AnimatedConditionalBuilder(
        condition: model1 != null,
        builder: (BuildContext context) => AnimatedConditionalBuilder(
          condition: model1!.data!.isNotEmpty,
          builder: (context) => GridView.custom(
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4.5,
              pattern: [
                const WovenGridTile(0.54),
                const WovenGridTile(
                  0.52,
                  crossAxisRatio: 0.87,
                  alignment: AlignmentDirectional.centerEnd,
                ),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: model1!.data!.length,
              (context, index) {
                return GridListAnimation(
                  index: index,
                  child: SearchCard(
                    model: model1,
                    index: index,
                  ),
                );
              },
            ),
          ),
          fallback: (context) => Text(
            "there_is_data".tr(),
            style: AppTheme.headline,
          ),
        ),
        fallback: (context) => const SizedBox(),
      ),
    );
  }
}
