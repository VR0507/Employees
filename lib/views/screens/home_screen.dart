import 'package:employees/controllers/home_controller.dart';
import 'package:employees/views/widgets/custom_button.dart';
import 'package:employees/views/widgets/custom_text.dart';
import 'package:employees/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final controller =Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Obx(() {
        print(controller.employee.length);
          return Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      controller.employee.length,
                      (index) => GestureDetector(
                        onTap: (){
                          controller.currentIndex(index);
                        },
                        child: Container(
                          height: 100,
                          // width: 100,
                          decoration: BoxDecoration(
                            border: Border()
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: CustomText(text: controller.employee[index].name??''),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                if(controller.employee.isNotEmpty)
                  Card(
                    margin: EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(controller.image.value),
                              ),
                              Spacer(),
                              Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: ()=>controller.edit(true), icon: Icon(Icons.edit_outlined,color: Colors.green,)),
                                  IconButton(onPressed: ()=>controller.deleteEmployee(), icon: Icon(Icons.delete,color: Colors.red,)),
                                ],
                              )
                            ],
                          ),
                          IgnorePointer(
                            ignoring: !controller.edit.value,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CustomText(text: "First Name : "),
                                    Container(width:width/2 ,
                                        child: CustomTextField(controller: controller.firstNameController,hintText: "First Name",)),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    CustomText(text: "Last Name : "),
                                    Container(width:width/2 ,
                                        child: CustomTextField(controller: controller.lastNameController,hintText: "Last Name",)),
                                  ],
                                ),SizedBox(height: 10,),
                                Row(
                                  children: [
                                    CustomText(text: "Email : "),
                                    Container(width:width/2 ,
                                        child: CustomTextField(controller: controller.emailController,hintText: "Email",)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if(controller.edit.value)
                          Column(
                            children: [
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Expanded(child: CustomButton(onPresses: ()=>controller.edit(false), text: "Cancel", background: Colors.grey.shade300)),
                                  SizedBox(width: 10,),
                                  Expanded(child: CustomButton(onPresses: ()=>controller.updateEmployee(), text: "Update", background: Colors.greenAccent)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
      ),
    );
  }
}
