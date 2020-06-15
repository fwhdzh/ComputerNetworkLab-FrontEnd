import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GlobalData.dart';
import 'MicroServiceWidget.dart';
import 'RegisterWidget.dart';

class LoginWidget extends StatelessWidget {

  Dio dio = new Dio();

  TextEditingController accountController = new TextEditingController();
  TextEditingController secretController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Center(
          child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: TextFormField(
                  controller: accountController,
                  decoration: InputDecoration(
                      labelText: "账号",
                      hintText: "账号或邮箱",
                      prefixIcon: Icon(Icons.person)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                child: TextFormField(
                  controller: secretController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "密码",
                      prefixIcon: Icon(Icons.dock)
                  ),
                  obscureText: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.cyan,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("注册"),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push( context,
                          MaterialPageRoute(builder: (context) {
                            return RegisterWidget();
                          }));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: RaisedButton(
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      child: Text("登录"),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () async {
                        Response response;
                        response = await dio.post("http://192.168.1.112:8080/login",
                            data: {"username": accountController.text, "password": secretController.text});
                        GlobalData.token = response.data.toString();
                        Navigator.push( context,
                            MaterialPageRoute(builder: (context) {
                              return MicroServiceWidget();
                            }));

                      },
                    ),
                  ),


                ],
              )


            ],
          )
      ),
    );
  }

}