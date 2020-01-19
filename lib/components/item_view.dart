import 'package:flutter/material.dart';
import 'package:flutter_architecture/res/dimens.dart';
import 'package:flutter_architecture/res/text_styles.dart';
import 'package:flutter_architecture/utils/image_utils.dart';

class ItemView extends StatelessWidget {
  final Widget leading;
  final Widget subLeading;
  final Widget subTailing;
  final Widget trailing;

  const ItemView(
      {Key key, this.leading, this.subLeading, this.subTailing, this.trailing})
      : super(key: key);

  ItemView.four(final String iconName, String contentText, String hintText)
      : this(
            leading: ImageUtils.assetImage(iconName),
            subLeading: Text(contentText, style: TextStyles.black_16),
            subTailing: Text(hintText, style: TextStyles.blackSub_14),
            trailing:
                ImageUtils.assetImage('common_more', width: 6, height: 12));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      padding:
          EdgeInsets.symmetric(horizontal: Dimens.distance_horizontal_padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          leading,
          SizedBox(width: 14),
          Expanded(child: subLeading),
          SizedBox(width: 8),
          subTailing,
          SizedBox(width: 12),
          trailing,
        ],
      ),
    );
  }
}
