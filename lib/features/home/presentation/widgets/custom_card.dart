import 'package:flutter/material.dart';

import '/core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '/core/boilerplate/create_model/widgets/CreateModel.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';
import '/core/widgets/custom_button.dart';
import '../../../locations/data/add_favorites_request_model.dart';
import '/features/shopping/data/add_favorites_respond_model.dart';
import '/features/shopping/domain/repository/shopping_repository.dart';

class CustomCard extends StatefulWidget {
  CustomCard({
    super.key,
    this.child,
    this.onDelete,
    this.favoriteId,
    this.isDiscount = false,
    this.isFavorite = true,
    this.hasFavorite = false,
    this.width = double.infinity,
  });

  final Widget? child;
  final double? width;

  final bool? hasFavorite;

  bool isFavorite;
  int? favoriteId;

  final bool isDiscount;

  final Function(int)? onDelete;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: widget.width,
        //margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.white,
        ),
        child: Stack(
          children: [
            widget.child ?? const SizedBox(),
            widget.isDiscount ? _buildDiscount() : const SizedBox(),
            widget.hasFavorite == true ? _buildFavorite() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildDiscount() {
    return Align(
      alignment: SharedStorage.getLanguage() == "en"
          ? Alignment.bottomLeft
          : Alignment.bottomRight,
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 3.5,
        color: AppColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  2),
          child: Text(
            "discount",
            style: AppTheme.bodySmall.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  CreateModelCubit? _favoritesCubit;

  _buildFavorite() {
    return CreateModel<AddFavoritesRespondModel>(
      repositoryCallBack: (data) => ShoppingRepository.addFavorites(data),
      withSuccessMessage: false,
      onCubitCreated: (cubit) {
        _favoritesCubit = cubit;
      },
      onSuccess: (AddFavoritesRespondModel model) {
        if (widget.onDelete != null) {
          widget.onDelete!(widget.favoriteId!);
        }

        final snackBar = SnackBar(
          content: Text(
            SharedStorage.getSuccessMessage(),
            style: AppTheme.bodySmall.copyWith(
              color: AppColors.white,
            ),
          ),
          duration: const Duration(
            seconds: 2,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Align(
        alignment: SharedStorage.getLanguage() == "en"
            ? Alignment.topRight
            : Alignment.topLeft,
        child: CustomIconButton(
          icon: widget.isFavorite ? Icons.favorite : Icons.favorite_border,
          iconColor:
              widget.isFavorite ? AppColors.primaryColor : AppColors.black,
          onPressed: () {
            setState(() {
              widget.isFavorite = !widget.isFavorite;
            });
            print("==============addFavorites==============");
            _favoritesCubit?.createModel(
              AddFavoritesRequestModel(
                productId: widget.favoriteId,
              ),
            );
          },
        ),
      ),
    );
  }
}
