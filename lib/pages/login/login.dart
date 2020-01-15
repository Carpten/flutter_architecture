import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture/res/clrs.dart';
import 'package:flutter_architecture/res/text_styles.dart';
import 'package:flutter_architecture/res/themes.dart';
import 'package:flutter_architecture/utils/image_utils.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 78),
              ImageUtils.assetImage('login_logo'),
              SizedBox(height: 36),
              _buildTextField(0),
              _buildTextField(1),
              SizedBox(height: 36),
              Container(
                width: double.infinity,
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: RaisedButton(
                  child: Text('确认登录'),
                  onPressed: () => {},
                  elevation: 0,
                  highlightElevation: 0,
                  color: Clrs.textBlue,
                  highlightColor: Clrs.textBlueDark,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                ),
              ),
              SizedBox(height: 27),
              Row(
                children: <Widget>[
                  SizedBox(width: 40),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          shape: BoxShape.rectangle,
                          color: Colors.blue),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        ),
                      )),
                      SizedBox(width: 8),
                  Text('记住密码', style: TextStyles.black_12),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ///构建输入框,[type]为0是构建手机号,为1时构建密码
  Widget _buildTextField(int type) {
    return Theme(
      data: Themes.norippleTheme,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          children: <Widget>[
            TextField(
              maxLength: type == 0 ? 11 : 32,
              cursorColor: Clrs.textBlack,
              cursorWidth: 1.5,
              obscureText: type == 1,
              cursorRadius: Radius.circular(2),
              style: TextStyles.black_16,
              inputFormatters: type == 0
                  ? [WhitelistingTextInputFormatter.digitsOnly]
                  : null,
              keyboardType:
                  type == 0 ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                counterText: "",
                hintStyle: TextStyles.blackLight_16,
                contentPadding:
                    EdgeInsets.only(top: 16, bottom: 18, left: 42, right: 8),
                hintText: type == 0 ? '请输入手机号' : '请输入密码',
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                    borderSide: BorderSide(color: Clrs.textBlack, width: 1)),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                    borderSide:
                        BorderSide(color: Clrs.textBlackLight, width: 1)),
              ),
            ),
            Positioned(
              bottom: 18,
              child: ImageUtils.assetImage(
                  type == 0 ? 'login_phone' : 'login_password'),
            ),
          ],
        ),
      ),
    );
  }
}
