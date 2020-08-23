import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:tarantar/widgets/customText.dart';

String getAssetImages(String image) {
  return "lib/assets/images/$image";
}

Future<T> customNavigator<T extends Object> (BuildContext context, String route, {VoidCallback onTap, Object arguments}) async {
  // List<String> needLogin = ["notificationList", "transactionList", "commentList", "productCartList", "productReviewAdd", "productCommentAdd"];
  // if (needLogin.contains(route.split("/")[0])) {
  //   if (await checkLogin(context) == false) {
  //     return login(context);
  //   }
  // }
  
  if (onTap == null) {    
    if (ModalRoute.of(context).settings.name != "$route") {
      return Navigator.pushNamed(
        context,
        route,
        arguments: arguments
      );
    }
  }
}

void Alert({
    context, String title, Widget content, List<Widget> actions, VoidCallback defaultAction,
    bool cancel = true, String type = "warning", bool showIcon = true, bool disableBackButton = false,
    VoidCallback willPopAction, loading = false, Icon icon, Widget titleWidget
  }) {
  
  // kalau bukan mode loading
  if (loading == false) {
    if (actions == null) {
      actions = [];
    }

    // if (willPopAction == null) {
    //   willPopAction = () {};
    // }

    if (defaultAction == null) {
      defaultAction = () {};
    }
  
    Widget icon;
    if (icon != null) {
      icon = icon;
    } else if (type == "success") {
      icon = Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 30.0,
      );
    } else if (type == "warning") {
      icon = Icon(
        Icons.warning,
        color: Colors.orange,
        size: 30.0,
      );
    } else {
      icon = Icon(
        Icons.error,
        color: Colors.red,
        size: 30.0,
      );
    }

  Widget titleWidget;
    // kalau titlenya gak null, judulnya ada
    if (title != null) {
      // kalau titlenya kosongan, brarti gk ada judulnya
      if (title == "") {
        titleWidget = null;
      } else {
        titleWidget = Row(
          children: <Widget>[
            showIcon ? Padding(padding: EdgeInsets.only(right: 20), child:icon) : Container(),
            CustomText(title, family: "Montserrat"),
          ],
        );
        
      }
    } else {
      // kalau titlenya null berarti auto generate tergantung typenya
      titleWidget = Row(
        children: <Widget>[
          showIcon ? Padding(padding: EdgeInsets.only(right: 20), child:icon) : Container(),
          CustomText(""),
        ],
      );
    }
    
    showDialog (
      context: context,
      barrierDismissible: false,
      builder: (context){
        return WillPopScope(
          onWillPop: disableBackButton ? () {

          }:willPopAction,
          child:AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.5)),
            ),
            title: titleWidget,
            content: content == null ? null:content,
            // kalau actions nya kosong akan otomatis mengeluarkan tombol ok untuk menutup alert
            actions: actions.length == 0 ?
            [
              defaultAction != null && cancel ?
              RaisedButton(
                key: Key("cancel"),
                child: CustomText("Cancel", color: Colors.black, fontWeight: FontWeight.bold),
                color: Colors.white,
                elevation: 0,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ) : Container(),
              RaisedButton(
                key: Key("ok"),
                color: Color(0XFF2e7d32),
                child: CustomText("Ok", color: Colors.white, fontWeight: FontWeight.bold),
                onPressed: () {
                  Navigator.of(context).pop();
                  defaultAction();
                },
              ),
              // kalau ada default action akan otomatis menampilkan tombol cancel, jadi akan muncul ok dan cancel
            ]
            :
            [
              // kalau ada pilihan tombol lain, akan otomatis mengeluarkan tulisan cancel
              if (cancel != false)
              RaisedButton(
                key: Key("cancel"),
                child: CustomText("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ]..addAll(actions)..add(Padding(padding: EdgeInsets.only(right:5)))
          )
        );
      }
    );    
  } else if (loading) {
    showDialog (
      context: context,
      barrierDismissible: false,
      builder: (context){
        return WillPopScope(
          onWillPop: disableBackButton ? () {

          }:willPopAction,
          child:AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.5)),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: <Widget>[
                    Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
                    CustomText("Loading")
                  ],
                ),
              ]
            )
          )
        );
      }
    );
  }
}

String numberFormat(int number, String currency) {
  var f = NumberFormat.decimalPattern(); 
  if (currency != "") {
    return "$currency. " + f.format(number);
  }

  return f.format(number);
}