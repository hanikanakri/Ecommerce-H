import 'package:flutter/material.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/features/home/data/home_page_respond_model.dart';
import '/features/home/presentation/pages/products_details.dart';
import '/features/home/presentation/widgets/custom_card_shopping_list_home_page.dart';

class ShoppingListHomePage extends StatefulWidget {
  const ShoppingListHomePage({
    Key? key,
    this.model,
  }) : super(key: key);

  final HomePageRespondModel? model;

  @override
  State<ShoppingListHomePage> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingListHomePage> {
  bool isListViewScrollable = true;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          ListView.builder(
            physics: isListViewScrollable
                ? const NeverScrollableScrollPhysics()
                : null,
            scrollDirection: Axis.horizontal,
            itemCount: widget.model!.products!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  AnimationNavigation.sizePush(
                    context,
                    ProductsDetails(
                      model: widget.model,
                      index: index,
                    ),
                  );
                },
                child: CustomCardShoppingList(
                  model: widget.model,
                  index: index,
                  isScroll: (value) {
                    setState(() {
                      isListViewScrollable = value;
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }


}
