import 'dart:convert';

import 'package:employees/services/callback_listener.dart';
import 'package:http/http.dart' as http;
class Service{
  http.Client client=http.Client();
  late CallBackListener apiCallBackListener;
  late String apiUrl;
  late String action;
  late String reqType;
  apiGetRequestGet(CallBackListener callBackListener, String action,url)async{
    http.Response response;
    reqType="get";
    apiCallBackListener=callBackListener;
    action=action;
    apiUrl=url;
    Map<String, String> headers={};
    headers["Accept"]="application/json";
    try{
      response=await client.get(Uri.parse(apiUrl),headers: headers);
      apiCallBackListener.callbackFunction(action, json.decode(response.body));
    }catch(e){
      print("ERROR----> e");
    }
  }
  static Service apiService(){
    return Service();
  }
}
final apiService=Service.apiService();