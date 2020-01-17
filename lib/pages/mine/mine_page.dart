import 'package:flutter/material.dart';

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
          _buildItem(),
          SizedBox(height: 16),
          _buildItem(),
          SizedBox(height: 1),
          _buildItem(),
          SizedBox(height: 1),
          _buildItem(),
          SizedBox(height: 16),
          _buildButton()
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(height: 95, color: Colors.red);
  }

  Widget _buildItem() {
    return Container(height: 60, color: Colors.red);
  }

  Widget _buildButton(){
    return Container(height: 44, color: Colors.red);
  }
}
