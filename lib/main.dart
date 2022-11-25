import 'package:bmi_getx/second.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    home: Bmi(),
  ));
}

class Bmi extends StatelessWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Second s = Get.put(Second());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bmi Calculator",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    color: Color(0xfff0e8d2),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          height: 50,
                          alignment: Alignment.topLeft,
                          child: Text("Input Weight :",
                              style: TextStyle(height: 1, fontSize: 18)),
                        ),
                        Container(
                            child: Obx(
                          () => TextField(
                            cursorColor: Colors.teal,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              hintText:
                                  "Enter value (weight in ${s.groupValue1})",
                              filled: true,
                            ),
                            controller: s.t1,
                          ),
                        )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => GFRadio(
                          size: 22,
                          value: s.radioList1[0],
                          groupValue: s.groupValue1.value,
                          onChanged: (value) {
                            s.groupValue1.value = value.toString();
                          },
                          radioColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Kilogram(kg)"),
                      SizedBox(
                        width: 20,
                      ),
                      Obx(
                        () => GFRadio(
                          size: 22,
                          value: s.radioList1[1],
                          groupValue: s.groupValue1.value,
                          onChanged: (value) {
                            s.groupValue1.value = value.toString();
                          },
                          radioColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Pound(lbs)"),
                    ],
                  ),
                  Container(
                    height: 100,
                    color: Color(0xfff0e8d2),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          color: Color(0xfff0e8d2),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                height: 50,
                                alignment: Alignment.topLeft,
                                child: Text("Input Height :",
                                    style: TextStyle(height: 1, fontSize: 18)),
                              ),
                              Container(
                                child: Obx(() => TextField(
                                      cursorColor: Colors.teal,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                      decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        enabledBorder: InputBorder.none,
                                        hintText:
                                            "Enter value (height in ${s.groupValue})",
                                        filled: true,
                                      ),
                                      controller: s.t2,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => GFRadio(
                          size: 22,
                          value: s.radioList[0],
                          groupValue: s.groupValue.value,
                          onChanged: (value) {
                            s.groupValue.value = value.toString();
                          },
                          radioColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("cm"),
                      SizedBox(
                        width: 20,
                      ),
                      Obx(
                        () => GFRadio(
                          size: 22,
                          value: s.radioList[1],
                          groupValue: s.groupValue.value,
                          onChanged: (value) {
                            s.groupValue.value = value.toString();
                          },
                          radioColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("inches"),
                      SizedBox(
                        width: 20,
                      ),
                      Obx(
                        () => GFRadio(
                          size: 22,
                          value: s.radioList[2],
                          groupValue: s.groupValue.value,
                          onChanged: (value) {
                            s.groupValue.value = value.toString();
                          },
                          radioColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("feet"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    fixedSize: Size(130, 20),
                    primary: Colors.teal,
                    onPrimary: Color(0xfff0e8d2),
                  ),
                  onPressed: () {
                    s.calculation(s.groupValue.value, s.groupValue1.value);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Calculate",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Icon(Icons.accessibility, color: Colors.white),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    s.clear1();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Clear",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    fixedSize: Size(130, 20),
                    primary: Colors.teal,
                    onPrimary: Color(0xfff0e8d2),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10, bottom: 5),
                      alignment: Alignment.topLeft,
                      child: Text("Result :",
                          style: TextStyle(
                            height: 2,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ))),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Obx(() => Text(
                        "Boby Mass Index is ${s.blanck.value} kg/m2",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15))),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Obx(
                        () => Text("Interpretation : ${s.interpretation.value}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15)),
                      )),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
//mit=ft/3.2808
// m/2=mit*mit
