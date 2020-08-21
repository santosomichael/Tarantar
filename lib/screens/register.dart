import 'package:flutter/material.dart';
import 'package:tarantar/configuration.dart';
import 'package:tarantar/tools/functions.dart';
import 'package:tarantar/widgets/customTextField.dart';
import 'package:tarantar/widgets/customText.dart';

class Register extends StatefulWidget {
  createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  bool isSeePassword = false;

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText("Daftar", color: Colors.black, family: "Montserrat",),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomText("Email", fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextField(hintText: "Masukkan Email",controller: controller)
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomText("Nomor Handphone", fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextField(hintText: "Nomor Handphone",controller: controller)
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomText("Nama Depan", fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextField(hintText: "Nama Depan", controller: controller)
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomText("Nama Belakang", fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextField(hintText: "Nama Belakang",controller: controller)
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      color: c.primaryColor,
                      child: Container(
                        width: mediaWidth - 100,
                        height: 50,
                        child: Center(
                          child: CustomText("Daftar", color: Colors.white, fontWeight: FontWeight.bold)
                        )
                      ),
                      onPressed: () {
                        Alert(
                          context: context,
                          title: "Berhasil",
                          showIcon: false,
                          content: CustomText("Pendaftaran berhasil!"),
                          cancel: false,
                          defaultAction: () async {
                            Navigator.of(context).pop();
                          }
                        );
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
