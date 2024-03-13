import 'package:flutter/material.dart';

class RowListTile extends StatelessWidget {
  final String? leading;
  final String? trailing;
  final bool underline;

  const RowListTile(
      {Key? key, this.leading, this.trailing, this.underline = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading ?? '', style: Theme.of(context).textTheme.titleSmall!),
        Text(trailing ?? '',
            style: underline
                ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                      decoration: TextDecoration.underline,
                    )
                : Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
