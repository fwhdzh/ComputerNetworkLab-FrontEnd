import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GlobalData.dart';

class MicroServiceWidget extends StatelessWidget {

  Dio dio;

  MicroServiceWidget(){
    dio = new Dio();
    dio.options.headers["authorization"] = GlobalData.token;
  }

  void showMyMaterialDialog(BuildContext context, String content) {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text("信息"),
            content: new Text(content),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("确认"),
              ),
            ],
          );
        });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MicroService"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only( top: 30,bottom: 20),
          child: Column(
            children: <Widget>[
              Container(
                width: 200,
//                margin: EdgeInsets.only(top: 30),
                child: RaisedButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("普通微服务调用"),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () async{
                    dio.options.headers["authorization"] = GlobalData.token;
                    print(dio.options.headers["authorization"]);
                    Response response;
                    response = await dio.get("http://192.168.1.112:8080/microService/primaryService");
                    String content = response.data.toString();
                    showMyMaterialDialog(context, content);
                  },
                ),
              ),
              Container(
                width: 200,
                child: RaisedButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("高级微服务调用"),

                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () async {
                    dio.options.headers["authorization"] = GlobalData.token;
                    print(dio.options.headers["authorization"]);
                    Response response;
                    response = await dio.get("http://192.168.1.112:8080/microService/seniorService");
//                    print(response.headers["mState"]);
                    String content = response.data.toString();
                    if (content == ""){
                      content = "调用服务失败";
                    }
                    showMyMaterialDialog(context, content);
                  },
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}