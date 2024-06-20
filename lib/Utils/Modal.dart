import 'dart:io';

import 'package:flutter/material.dart';
TextEditingController student_name =TextEditingController();
TextEditingController student_grid =TextEditingController();
TextEditingController student_standard =TextEditingController();

class StudentModal
{
  TextEditingController? name;
  TextEditingController? Gird;
  TextEditingController? std;
  File? image;
  StudentModal({this.name,this.Gird,this.std,this.image});

}
List <StudentModal>StudentDataList=[];

// student_grid
// student_standard
// student_image