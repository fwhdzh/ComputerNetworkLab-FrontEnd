import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhelloworldapp/GlobalData.dart';
import 'package:flutterhelloworldapp/MicroServiceWidget.dart';
import 'package:flutterhelloworldapp/RegisterWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    home: LoginWidget(),
    );
  }
}

class LoginWidget extends StatelessWidget {

  Dio dio = new Dio();

  TextEditingController accountController = new TextEditingController();
  TextEditingController secretController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
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
//                      response = await dio.get("http://192.168.1.112:8080/getAll");
                      response = await dio.post("http://192.168.1.112:8080/login", data: {"username": accountController.text, "password": secretController.text});
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