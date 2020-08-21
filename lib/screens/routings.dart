import 'package:flutter/material.dart';

import 'package:tarantar/screens/dashboard.dart';
import 'package:tarantar/screens/register.dart';
import 'package:tarantar/screens/login.dart';
import 'package:tarantar/screens/orderForm.dart';
import 'package:tarantar/screens/orderAddCustomerForm.dart';
import 'package:tarantar/screens/orderDelivered.dart';
import 'package:tarantar/screens/orderCourierList.dart';
import 'package:tarantar/screens/orderDetail.dart';

MaterialPageRoute routing(int mode, String id, List<String> pages, RouteSettings settings) {
  switch (pages[0]) {
    case '':
      return MaterialPageRoute(builder: (context)=> Login());
      break;
    case 'register':
      return MaterialPageRoute(builder: (context)=> Register());
      break;
    case 'dashboard':
      return MaterialPageRoute(builder: (context)=> Dashboard());
      break;
    case 'orderForm':
      return MaterialPageRoute(builder: (context)=> OrderForm());
      break;
    case 'orderAddCustomerForm':
      return MaterialPageRoute(builder: (context)=> OrderAddCustomerForm());
      break;
    case 'orderDelivered':
      return MaterialPageRoute(builder: (context)=> OrderDelivered());
      break;
    case 'orderCourierList':
      return MaterialPageRoute(builder: (context)=> OrderCourierList());
      break;
    case 'orderDetail':
      return MaterialPageRoute(builder: (context)=> OrderDetail());
      break;
  }
}