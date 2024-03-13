import 'package:flutter/material.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/widgets/custom_image.dart';
import '/features/categories/data/get_all_categories_respond_model.dart';
import '/features/categories/presentation/pages/categories_details.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    this.model,
  });

  final GetAllCategoriesRespondModel? model;

  @override
  Widget build(BuildContext context) {
    double sized = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
        itemCount: model!.data!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          List<String>? words = model!.data![index].name!.split(' ');
          return InkWell(
            onTap: () {
              AnimationNavigation.sizePush(
                context,
                CategoriesDetails(
                  id: model!.data![index].id!,
                  index1: index,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(75),
                    child: CustomImage.circular(
                      radius: 60,
                      isNetworkImage: true,
                      image: model!.data![index].image!,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Column(
                    children: words.map((e) => Text(e)).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
