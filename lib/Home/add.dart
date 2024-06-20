

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:final_exam_project/Utils/Modal.dart';
import 'package:image_picker/image_picker.dart';
ImagePicker imagePicker =ImagePicker();




class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
          "Detail Screen",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ...List.generate(
                StudentDataList.length,
                    (index) => Center(
                  child: Container(
                    padding: EdgeInsets.all(25),
                    margin: EdgeInsets.only(bottom: 10),
                    height: 430,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple.shade50,
                    ),
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
                        }, child:Text('Submit',style: TextStyle(color: Colors.deepPurple),))
                      ],
                    ),
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
