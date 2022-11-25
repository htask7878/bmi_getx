import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Second extends GetxController {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  double mit = 0.0, bmi = 0.0;
  RxString blanck = "".obs;
  String width = "", height = "";
  RxString interpretation = "".obs,val= "".obs,hgt="".obs;
  RxBool isRadio = false.obs;
  RxString groupValue = "cm".obs;
  RxString groupValue1 = "kg".obs;
  RxList<String> radioList = ["cm", "inches", "feet"].obs;
  RxList<String> radioList1 = ["kg", "pound"].obs;

  calculation(String a,String b) {
    width = t1.text;
    height = t2.text;
    double kg = double.parse(width);
    double ft = double.parse(height);
//feet ma male

    //1 feet = 30.48 cm

    if (a == "cm") {
      ft = ft * 0.032808;
      mit = ft / 3.28084;
      print("1=${mit}");
    } else if (a == "inches") {
      ft = ft * 0.083333;
      print("2=${ft}");

      mit = ft / 3.28084; //TODO feet  codding
      print("2=${mit}");
    } else if (a == "feet") {
      mit = ft / 3.28084; //TODO feet  codding
      print("3=${mit}");
    }
    double m2 = mit * mit;
    print(m2);

    //todo m2 coding
    if (b == "pound") {
      kg = kg * 0.453592; //TODO pound codding
    }
    bmi = kg / m2;
    if (bmi <= 18.4) {
      blanck.value = bmi.toString();
      interpretation.value = "UnderWeight (BMI <= 18.4 kg/m2)";
    } else if (bmi >= 18.5 && bmi <= 27.9) {
      blanck.value = bmi.toString();
      interpretation.value = "NormalWeight (BMI >= 18.5 To BMI <= 27.9 kg/m2)";
      print("Normal");
    } else if (bmi >= 28) {
      blanck.value = bmi.toString();
      interpretation.value = "OverWeight (BMI >= 28 kg/m2)";
      print("OverWeight");
    }
  }

  clear1() {
    width = "";
    height = "";
    interpretation.value = "";
    blanck.value = "";
    t1.clear();
    t2.clear();
    groupValue.value = "cm";
  }
}
