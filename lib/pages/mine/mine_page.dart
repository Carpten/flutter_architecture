import 'package:flutter/material.dart';
import 'package:flutter_architecture/components/item_view.dart';
import 'package:flutter_architecture/res/dimens.dart';
import 'package:flutter_architecture/res/text_styles.dart';
import 'package:flutter_architecture/utils/text_style_utils.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildHeader(),
          SizedBox(height: 16),
          ItemView.four('mine_record', '交接班', ''),
          SizedBox(height: 16),
          ItemView.four('mine_print', '打印机', '已开启'),
          SizedBox(height: 1),
          ItemView.four('mine_message', '消息通知', '已开启'),
          SizedBox(height: 1),
          ItemView.four('mine_aboutme', '关于', ''),
          SizedBox(height: 16),
          _buildButton()
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 95,
      padding:
          EdgeInsets.symmetric(horizontal: Dimens.distance_horizontal_padding),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text('中国石油',
                    style: TextStyleUtils.merge(TextStyles.black_22,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 8),
                Text('157 2829 2992', style: TextStyles.black_14)
              ])),
          Image(
              image: NetworkImage(
                  'https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png'),
              width: 56,
              height: 56)
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      alignment: Alignment.center,
      height: 44,
      color: Colors.white,
      child: Text('退出登录', style: TextStyles.blackSub_14),
    );
  }
}
