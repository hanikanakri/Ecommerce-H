import 'dart:io';

import 'package:flutter/material.dart';

import '/core/animations/fade_animation.dart';
import '/core/constants/app_assets.dart';
import '/core/utils/tool.dart';
import '/core/widgets/custom_image.dart';
import '/features/auth/data/get_profile_info_respond_model.dart';
import '/features/profile/presentation/widgets/custom_print_image_profile.dart';

class ImageProfile extends StatefulWidget {
  const ImageProfile({
    super.key,
    this.model,
    this.imageUrl,
  });

  final GetProfileInfoRespondModel? model;
  final ValueChanged<String>? imageUrl;

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  File? _imageFile;
  String? _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(double.infinity, 140),
          painter: RPSCustomPainter(),
        ),
        FadeAnimation(
          delay: 0.8,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: CustomImage.circular(
                  radius: 100,
                  image: _imageFile ?? widget.model!.image,
                  isNetworkImage: _imageFile != null ? false : true,
                  viewInFullScreen: true,
                ),
              ),
              InkWell(
                onTap: () {
                  Tool.displayModalBottomSheet(
                    context: context,
                    onSuccess: (image) {
                      setState(() {
                        _imageFile = image?.imageFile;
                        _imageUrl = image?.imageUrl;
                        print(_imageFile);
                        print(_imageUrl);
                        //Navigation.pop(context);
                      });
                      widget.imageUrl!(_imageUrl!);
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 13,
                    child: CustomImage.circular(
                      radius: 13,
                      color: Colors.white,
                      image: AppAssets.editProfile,
                      isNetworkImage: false,
                      svg: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
