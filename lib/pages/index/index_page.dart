import 'package:flutter/material.dart';
import 'package:flutter_architecture/components/switch_image.dart';
import 'package:flutter_architecture/pages/home/home_page.dart';
import 'package:flutter_architecture/pages/mine/mine_page.dart';
import 'package:flutter_architecture/pages/order/order_list_page.dart';
import 'package:flutter_architecture/res/clrs.dart';
import 'package:flutter_architecture/res/dimens.dart';
import 'package:flutter_architecture/utils/image_utils.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
  final _bottomNavigationBarTitles = List.of(['收款', '订单', '我的']);
  final _bottomNavigationBarSelectedIcons = List.of([
    ImageUtils.assetImage('index_home_selected'),
    ImageUtils.assetImage('index_order_selected'),
    ImageUtils.assetImage('index_mine_selected'),
  ]);

  final _bottomNavigationBarUnselectedIcons = List.of([
    ImageUtils.assetImage('index_home_unselected'),
    ImageUtils.assetImage('index_order_unselected'),
    ImageUtils.assetImage('index_mine_unselected'),
  ]);

  final _pageList = List.of([HomePage(), OrderListPage(), MinePage()]);

  var _index = 0;

  void _onTap(int index) {
    if (_index != index) {
      setState(() {
        _index = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: IndexedStack(
          index: _index,
          children: _pageList,
        )),
        _getBottomNavigationBar()
      ],
    );
  }

  ///底部导航栏
  Widget _getBottomNavigationBar() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: BottomNavigationBar(
        selectedFontSize: Dimens.font_11,
        iconSize: 20,
        unselectedFontSize: Dimens.font_11,
        backgroundColor: Colors.white,
        fixedColor: Clrs.colorPrimary,
        unselectedItemColor: Clrs.textBlackLight,
        type: BottomNavigationBarType.fixed,
        items: List.generate(_pageList.length, (position) {
          return BottomNavigationBarItem(
            icon: SwitchImage(
                _index == position,
                _bottomNavigationBarSelectedIcons[position],
                _bottomNavigationBarUnselectedIcons[position]),
            title: Text(_bottomNavigationBarTitles[position]),
          );
        }),
        currentIndex: _index,
        onTap: _onTap,
      ),
    );
  }
}
