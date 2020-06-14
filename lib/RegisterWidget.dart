import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhelloworldapp/LoginWidget.dart';

import 'GlobalData.dart';
import 'MicroServiceWidget.dart';

class RegisterWidget extends StatelessWidget {

  Dio dio = new Dio();

  bool _switchSelected;

  TextEditingController accountController = new TextEditingController();
  TextEditingController secretController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
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
                      hintText: "账号",
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
                  Container(
                    width: 150,
                    margin: EdgeInsets.only(right: 20),
                      child: RaisedButton(
                        color: Colors.cyan,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("注册为普通用户"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () async{
                          Response response;
//                      response = await dio.get("http://192.168.1.112:8080/getAll");

                          response = await dio.post("http://192.168.1.112:8080/register", data: {
                            "username": accountController.text,
                            "password": secretController.text,
                            "roles": [0]});
                          GlobalData.token = response.data.toString();
                          Navigator.push( context,
                              MaterialPageRoute(builder: (context) {
                                return LoginWidget();
                              }));
                        },
                      ),
                  ),
                  Container(
                    width: 150,
                    child: RaisedButton(
                      color: Colors.cyan,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      child: Text("注册为管理员"),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () async {
                        Response response;
//                      response = await dio.get("http://192.168.1.112:8080/getAll");

                        response = await dio.post("http://192.168.1.112:8080/register", data: {
                          "username": accountController.text,
                          "password": secretController.text,
                          "roles": [0,1]});
                        GlobalData.token = response.data.toString();
                        Navigator.push( context,
                            MaterialPageRoute(builder: (context) {
                              return LoginWidget();
                            }));
                      },
                    ),
                  )
                ],
              )

            ],
          )
      ),
    );
  }

}