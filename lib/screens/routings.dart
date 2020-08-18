import 'package:flutter/material.dart';

import 'package:tarantar/screens/dashboard.dart';
import 'package:tarantar/screens/orderForm.dart';

MaterialPageRoute routing(int mode, String id, List<String> pages, RouteSettings settings) {
  switch (pages[0]) {
    case '':
      return MaterialPageRoute(builder: (context)=> Dashboard());
      break;
    case 'orderForm':
      return MaterialPageRoute(builder: (context)=> OrderForm());
      break;
  }
}