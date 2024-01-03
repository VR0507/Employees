import 'package:employees/database/database_model.dart';
import 'package:employees/main.dart';
import 'package:employees/services/api_const.dart';
import 'package:employees/services/callback_listener.dart';
import 'package:employees/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements CallBackListener{
  RxList<Employee> employee =<Employee>[].obs;
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  RxString image="".obs;
  RxInt currentIndex=0.obs;
  RxBool edit =false.obs;
  @override
  void onReady() {
    getAllEmp();
    print("Reday");
  }

  getAllEmployeeFromDataBase()async{
    employee.value=await appDatabase?.employeeDao.getAllEmployee()??[];
    if(employee.isNotEmpty){
      firstNameController.text=employee[currentIndex.value].name?.split(" ").first??'';
      lastNameController.text=employee[currentIndex.value].name?.substring(employee[currentIndex.value].name?.split(" ").first.length??0)??'';
      emailController.text=employee[currentIndex.value].email??'';
      image.value=employee[currentIndex.value].image??'';
    }
  }
  changeIndex(int index){
    currentIndex(index);
    firstNameController.text=employee[currentIndex.value].name?.split(" ").first??'';
      lastNameController.text=employee[currentIndex.value].name?.substring(employee[currentIndex.value].name?.split(" ").first.length??0)??'';
      emailController.text=employee[currentIndex.value].email??'';
      image.value=employee[currentIndex.value].image??'';
      edit(false);

  }
  deleteEmployee()async{
    await appDatabase?.employeeDao.deleteEmployee(employee[currentIndex.value].id??0);
    await getAllEmployeeFromDataBase();
  }
  updateEmployee()async {
    await appDatabase?.employeeDao.updateEmployee(Employee(id: employee[currentIndex.value].id,email: emailController.text,image: employee[currentIndex.value].image,name: "${firstNameController.text} ${lastNameController.text}"));
    await getAllEmployeeFromDataBase();
    edit(false);
  }
  @override
  callbackFunction(String action, result) {
    if(action=="Get All User"){
      print(result);
      result["data"]?.forEach((e) async{
        await appDatabase?.employeeDao.insertEmployee(Employee(name: "${e["first_name"]} ${e["last_name"]}",email: e["email"],image: e["avatar"]));
      });
    }
  }

  @override
  callbackFunctionError(String action, result) {
    // TODO: implement callbackFunctionError
    throw UnimplementedError();
  }

  getAllEmp()async{
    List list=await appDatabase?.employeeDao.getAllEmployee()??[];
    print(list.length);
    if(list.isEmpty){
      print("api calling");
      await apiService.apiGetRequestGet(this, "Get All User", "${ApiConst().user}?page=1");
    }else{
      await getAllEmployeeFromDataBase();
    }
  }


}