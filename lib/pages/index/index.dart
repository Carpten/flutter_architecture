import 'package:flutter/material.dart';
import 'package:flutter_architecture/components/switch_image.dart';
import 'package:flutter_architecture/res/clrs.dart';
import 'package:flutter_architecture/res/dimens.dart';
import 'package:flutter_architecture/utils/image_utils.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<Index> {
  final _bottomNavigationBarTitles = List.of(['收款',  '订单', '我的']);
  final _bottomNavigationBarSelectedIcons = List.of([
    ImageUtils.assetImage('index_home_unselected'),
    ImageUtils.assetImage('index_order_unselected'),
    ImageUtils.assetImage('index_mine_unselected'),
  ]);

  final _bottomNavigationBarUnselectedIcons = List.of([
    ImageUtils.assetImage('index_home_unselected'),
    ImageUtils.assetImage('index_order_unselected'),
    ImageUtils.assetImage('index_mine_unselected'),
  ]);

  final _pageList = List.of([Text('1'), Text('2'), Text('3')]);

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
