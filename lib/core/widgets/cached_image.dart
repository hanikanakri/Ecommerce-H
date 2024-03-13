import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_assets.dart';
import '/core/widgets/loading.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final Widget? placeholder;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      errorWidget: (context, url, error) {
        return Center(
          child: Image.asset(
            AppAssets.errorData,
          ),
        );
      },
      fit: fit ?? BoxFit.cover,
      placeholder: (BuildContext context, _) {
        return placeholder ?? const LoadingWidget();
      },
    );
  }
}
