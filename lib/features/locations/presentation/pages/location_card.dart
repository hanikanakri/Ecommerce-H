import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/features/shopping/presentation/widgets/row_text.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      color: Colors.white,
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...[
              const RowText(
                firstText: "address",
                secondText: "syria_damascus",
              ),
              const RowText(
                firstText: "contact",
                secondText: "+963 998 045 287",
              ),
            ].expand(
              (element) => [
                element,
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
