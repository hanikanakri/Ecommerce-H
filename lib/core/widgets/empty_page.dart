import '/core/constants/app_assets.dart';
import '/core/widgets/custom_image.dart';
import '/core/widgets/loading.dart';
import 'package:flutter/material.dart';



class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: CustomImage.rectangle(
                placeHolder: const LoadingWidget(),
                image: AppAssets.splashLogo,
                isNetworkImage: false,
                svg: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
