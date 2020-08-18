import 'package:flutter/material.dart';
import 'package:tarantar/screens/routings.dart';

void main() async {
  runApp(
    MaterialApp(
        title: "Tarantar",
        color: Colors.green,
        onGenerateRoute: (RouteSettings settings) {
          List<String> pages = [];
          int mode = 0;
          String id = "0";

          pages = settings.name.split("/");
          if (pages.length > 1) {
              id = pages[1];
          }

          if (pages.length > 2) {
            mode = int.tryParse(pages[2]);
          }

          return routing(mode, id, pages, settings);
        },
      )
  );
}