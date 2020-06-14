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
                  child: Text("查询当前时间"),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () async{
                    dio.options.headers["authorization"] = GlobalData.token;
                    print(dio.options.headers["authorization"]);
                    Response response;
                    response = await dio.get("http://192.168.1.112:8080/microService/dateMicroService");
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
                  child: Text("查询今日油价"),

                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () async {
                    dio.options.headers["authorization"] = GlobalData.token;
                    print(dio.options.headers["authorization"]);
                    Response response;
                    response = await dio.get("http://192.168.1.112:8080/microService/oilPriceMicroService");
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
                  child: Text("查询美国当前人口数目"),

                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () async {
                    dio.options.headers["authorization"] = GlobalData.token;
                    print(dio.options.headers["authorization"]);
                    Response response;
                    response = await dio.get("http://192.168.1.112:8080/microService/populationService");
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
                  child: Text("启动网络DDOS攻击"),

                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: ()  async {
                    dio.options.headers["authorization"] = GlobalData.token;
                    print(dio.options.headers["authorization"]);
                    Response response;
                    response = await dio.get("http://192.168.1.112:8080/microService/DDosAttackService");
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
                  child: Text("启动天网自动打击系统"),

                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () async {
                    dio.options.headers["authorization"] = GlobalData.token;
                    print(dio.options.headers["authorization"]);
                    Response response;
                    response = await dio.get("http://192.168.1.112:8080/microService/SkyNetService");
                    String content = response.data.toString();
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