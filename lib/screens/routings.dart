import 'package:flutter/material.dart';

import 'package:tarantar/screens/dashboard.dart';
import 'package:tarantar/screens/orderForm.dart';
import 'package:tarantar/screens/orderAddCustomerForm.dart';
import 'package:tarantar/screens/orderDetail.dart';

MaterialPageRoute routing(int mode, String id, List<String> pages, RouteSettings settings) {
  switch (pages[0]) {
    case '':
      return MaterialPageRoute(builder: (context)=> Dashboard());
      break;
    case 'orderForm':
      return MaterialPageRoute(builder: (context)=> OrderForm());
      break;
    case 'orderAddCustomerForm':
      return MaterialPageRoute(builder: (context)=> OrderAddCustomerForm());
      break;
    case 'orderDetail':
      return MaterialPageRoute(builder: (context)=> OrderDetail());
      break;
  }
}