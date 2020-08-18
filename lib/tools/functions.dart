import 'package:flutter/material.dart';

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