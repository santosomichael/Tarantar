import 'package:flutter/material.dart';
import 'package:tarantar/configuration.dart';
import 'package:tarantar/tools/functions.dart';
import 'package:tarantar/widgets/customText.dart';
import 'package:tarantar/widgets/customTextField.dart';

class Login extends StatefulWidget {
  createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  bool isSeePassword = true;
  
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText("Login", color: Colors.black, family: "Montserrat"),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    getAssetImages("loginTop.png"),
                    height: 300,
                    width: 300
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomText("Email", color: c.primaryColor, fontWeight: FontWeight.w600)
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextField(hintText: "Masukkan Email", controller: emailController)
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomText("Password", color: c.primaryColor, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: passwordController,
                      obscureText: isSeePassword,
                      decoration: InputDecoration(
                        hintText: "Masukkan Password",
                        labelStyle: TextStyle(color: c.primaryColor),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: c.primaryColor, width: 2),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              isSeePassword = !isSeePassword;
                            });
                          }
                        )
                      ),
                      cursorColor: c.primaryColor
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      color: c.primaryColor,
                      child: Container(
                        width: mediaWidth - 100,
                        height: 50,
                        child: Center(
                          child: CustomText("Login", color: Colors.white, fontWeight: FontWeight.bold,)
                        )
                      ),
                      onPressed: () {
                        customNavigator(context, "dashboard");
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText("Tidak punya akun? "),
                      InkWell(
                        child: CustomText("Daftar", color: c.primaryColor, fontWeight: FontWeight.bold),
                        onTap: () {
                          customNavigator(context, "register");
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                ],
              ),
            )
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              getAssetImages("banner.jpg"),
              width: mediaWidth
            ),
          )
        ],
      ),
    );
  }
}
