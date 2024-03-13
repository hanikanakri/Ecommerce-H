import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '/core/animations/grid_view_animation.dart';
import '/core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '/core/boilerplate/pagination/widgets/PaginationList.dart';
import '/features/wish_list/data/get_wish_list_respond_model.dart';
import '/features/wish_list/domain/repository/wish_list_repository.dart';
import '/features/wish_list/presentation/widgets/wish_list_card.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  int columnCount = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildGetFavorites(),
        ),
      ],
    );
  }

  PaginationCubit? _favoriteCubit;


/*  late PaginationCubit _refresh;

  Future<void> _refreshWishListPage() async {
    _refresh.getList();
  }*/

  _buildGetFavorites() {
    return PaginationList<GetFavoriteModel>(
      interactive: true,
      onCubitCreated: (cubit) {
        _favoriteCubit = cubit;
       // _refresh = cubit;
      },
      repositoryCallBack: (data) => WishListRepository.getFavorites(),
      listBuilder: (List<GetFavoriteModel> list) {
        return Center(
          child: GridView.custom(
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
              childCount: list.length,
                  (context, index) {
                return GridListAnimation(
                  index: index,
                  child: WishListCard(
                    model: list,
                    index: index,
                    onDelete: (itemId) {
                      setState(() {
                        list.removeWhere(
                                (element) => element.product!.id == itemId);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
