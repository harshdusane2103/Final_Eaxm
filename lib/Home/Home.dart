import 'dart:io';

import 'package:final_exam_project/Utils/Modal.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
ImagePicker imagePicker =ImagePicker();
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text("STUDENT DATA",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:10),
            ... List.generate(StudentDataList.length, (index) => Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(8),
                height: 200,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(StudentDataList[index].Gird!.text,style:TextStyle(color: Colors.black),),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: (StudentDataList[index].image!=null)?FileImage(StudentDataList[index].image!):null,


                      ),

                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(StudentDataList[index].name!.text,style:TextStyle(color: Colors.black),),
                       Text(StudentDataList[index].std!.text,style:TextStyle(color: Colors.black),),
                     ],
                   ),
                    InkWell(onTap:() {
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        title: Center(child: Text("Edit Data")),
                        content: Container(
                          height: 500,
                          width: 360,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:(StudentDataList[index].image!=null)?FileImage(StudentDataList[index].image!):null,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                        onTap: ()
                                        async {
                                          XFile? xFileImage= await imagePicker.pickImage(source: ImageSource.gallery);
                                          setState(() {
                                            StudentDataList[index].image=File(xFileImage!.path);
                                          });
                                        },
                            
                                        child: Icon(Icons.photo)),
                            
                                  ),
                                ),
                                SizedBox(height: 10,),
                                TextFormField(
                                  controller: StudentDataList[index].Gird!,
                                  decoration: InputDecoration(
                                      enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width: 3 )),
                                      hintText: ("Enter Grid")
                                  ),
                                ),
                                SizedBox(height: 10,),
                                TextFormField(
                                  controller: StudentDataList[index].name!,
                                  decoration: InputDecoration(
                                    enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width: 3 )),
                                    hintText: ("Enter Name "),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                TextFormField(
                                  controller: StudentDataList[index].std!,
                                  decoration: InputDecoration(
                                    enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width: 3 )),
                                    hintText: ("Enter Std "),
                                  ),
                                ),
                                SizedBox(height: 10,),
                            
                                ElevatedButton(onPressed: () {
                                  Navigator.of(context).pushNamed('/');
                                }, child: Text("Update")),
                              ],
                            ),
                          ),

                        ),
                      ));
                    },child: Icon(Icons.edit)),
                    InkWell(onTap:() {
                      setState(() {
                        StudentDataList.removeAt(index);
                      });
                    },child: Icon(Icons.delete)),
                  ],
                ),
              ),
            ))
            

          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          TextEditingController student_name =TextEditingController();
          TextEditingController student_grid =TextEditingController();
          TextEditingController student_standard =TextEditingController();
          setState(() {
            StudentDataList.add(StudentModal(name: student_name,Gird: student_grid,std: student_standard));
          });
          Navigator.of(context).pushNamed('/add');
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),

    );
  }
}
