import 'package:flutter/material.dart';
import 'package:flutter_architecture/res/clrs.dart';
import 'package:flutter_architecture/res/dimens.dart';
import 'package:flutter_architecture/res/text_styles.dart';
import 'package:flutter_architecture/utils/text_style_utils.dart';

class OrderListPage extends StatefulWidget {
  OrderListPage({Key key}) : super(key: key);

  @override
  _OrderPageListState createState() => _OrderPageListState();
}

class _OrderPageListState extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 1,
          color: Clrs.backgroundColor,
        ),
        itemCount: 20,
        itemBuilder: (context, index) => _buildOrderListItem(),
      ),
    );
  }

  Widget _buildOrderListItem() {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: Dimens.distance_horizontal_padding),
      height: 68,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _buildOrderListItemIcon(),
          SizedBox(width: 10),
          _buildOrderListItemBody(),
          _buildOrderListItemTail(),
        ],
      ),
    );
  }

  Widget _buildOrderListItemIcon() {
    return Container(
      width: 36,
      height: 36,
      decoration:
          BoxDecoration(color: Clrs.colorPrimary, shape: BoxShape.circle),
      child: Center(
          child: Text('92#',
              style: TextStyleUtils.merge(TextStyles.white_14,
                  fontWeight: FontWeight.w700))),
    );
  }

  Widget _buildOrderListItemBody() {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Text('支付宝', style: TextStyles.black_14),
          SizedBox(height: 4),
          Text('2019.09.09 09:00:00', style: TextStyles.blackSub_11)
        ]));
  }

  Widget _buildOrderListItemTail() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('¥100.00', style: TextStyles.black_14),
          SizedBox(height: 7),
          Text('交易成功', style: TextStyles.blackSub_11)
        ]);
  }
}
