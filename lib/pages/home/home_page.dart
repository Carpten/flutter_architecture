import 'package:flutter/material.dart';
import 'package:flutter_architecture/components/flex_grid_view.dart';
import 'package:flutter_architecture/res/clrs.dart';
import 'package:flutter_architecture/res/text_styles.dart';
import 'package:flutter_architecture/utils/image_utils.dart';
import 'package:flutter_architecture/utils/text_style_utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: <Widget>[
              SizedBox(height: 48),
              _buildGasList(),
              SizedBox(height: 8),
              _buildAmountShowcase(),
              SizedBox(height: 56),
              _buildKeyboard(),
              SizedBox(height: 8),
            ],
          )),
    );
  }

  Widget _buildGasList() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2), color: Colors.white),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                SizedBox(width: 10),
                ImageUtils.assetImage('home_gas'),
                SizedBox(width: 8),
                Text('油品选择', style: TextStyles.black_14)
              ],
            ),
            SizedBox(height: 10),
            Container(
                color: Clrs.divide,
                height: 0.5,
                margin: EdgeInsets.symmetric(horizontal: 10)),
            GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                padding: EdgeInsets.all(10.0),
                crossAxisCount: 4,
                childAspectRatio: 1.4,
                children: List.generate(8, (index) => _buildGasItem())),
          ],
        ));
  }

  Widget _buildGasItem() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Clrs.textBlackLight),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('92#', style: TextStyles.black_16),
              SizedBox(height: 2),
              Text('¥9.00/升', style: TextStyles.blackSub_12)
            ]));
  }

  Widget _buildAmountShowcase() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2), color: Colors.white),
      padding: EdgeInsets.only(left: 16, right: 14),
      height: 56,
      child: Row(children: <Widget>[
        Text("¥", style: TextStyles.black_18),
        SizedBox(width: 8),
        Expanded(
            child: TextField(
          cursorColor: Clrs.textBlack,
          cursorWidth: 1.5,
          cursorRadius: Radius.circular(2),
          decoration: InputDecoration(
              border: InputBorder.none, hintStyle: TextStyles.blackLight_24),
          style: TextStyles.black_24,
        )),
        SizedBox(width: 8),
        ImageUtils.assetImage('home_del')
      ]),
    );
  }

  Widget _buildKeyboard() {
    return Expanded(
        child: Row(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: FlexGridView(
              rowCount: 3,
              columnCount: 4,
              rowSpacing: 8,
              columnSpacing: 8,
              indexedWidgetBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white),
                  alignment: Alignment.center,
                  child: _buildKeyboardItem(index)),
            )),
        SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: _buildKeyboardActions(),
        )
      ],
    ));
  }

  Widget _buildKeyboardItem(int index) {
    if (index < 9) {
      return Text((index + 1).toString(), style: TextStyles.black_20);
    } else if (index == 9) {
      return Text('.', style: TextStyles.black_20);
    } else if (index == 10) {
      return Text('0', style: TextStyles.black_20);
    } else {
      return ImageUtils.assetImage('home_keyboard_del');
    }
  }

  Widget _buildKeyboardActions() {
    return Column(children: <Widget>[
      Expanded(
        flex: 3,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2), color: Clrs.orange),
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: Text('会员\n收款',
                style: TextStyleUtils.merge(TextStyles.white_15,
                    fontWeight: FontWeight.w700, height: 1.5))),
      ),
      SizedBox(height: 8),
      Expanded(
        flex: 5,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Clrs.colorPrimary),
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: Text('非会员\n收款',
                textAlign: TextAlign.center,
                style: TextStyleUtils.merge(TextStyles.white_15,
                    fontWeight: FontWeight.w700, height: 1.5))),
      )
    ]);
  }
}
