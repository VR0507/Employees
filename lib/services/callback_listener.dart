import 'package:get/get.dart';

abstract class CallBackListener extends GetxController{
  callbackFunction(String action,dynamic result);
  callbackFunctionError(String action,dynamic result);
}