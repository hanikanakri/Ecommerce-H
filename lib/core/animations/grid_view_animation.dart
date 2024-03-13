import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridViewAnimation extends StatelessWidget {
  const GridViewAnimation({
    super.key,
    this.columnCount = 2,
    required this.gridLength,
    required this.itemBuilder,
    this.scrollController,
  });

  final int columnCount;
  final int gridLength;

  final ScrollController? scrollController;

  final Widget? Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: gridLength,
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount, // Number of items in each row
          crossAxisSpacing: 10, // Spacing between each column
          mainAxisSpacing: 10, // Spacing between each row
        ),
        itemBuilder: itemBuilder,
        //TODO must add GridListAnimation inside itemBuilder
      ),
    );
  }
}

class GridListAnimation extends StatelessWidget {
  const GridListAnimation({
    super.key,
    required this.index,//TODO need the index in itemBuilder
    this.columnCount = 2,
    this.duration = 1000,
    required this.child,
  });

  final int index;
  final int columnCount;
  final int? duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      duration: Duration(milliseconds: duration!),
      columnCount: columnCount,
      child: ScaleAnimation(
        child: FadeInAnimation(
          child: child ,
        ),
      ),
    );
  }
}
