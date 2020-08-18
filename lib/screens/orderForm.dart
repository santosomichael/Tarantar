import 'package:flutter/material.dart';
import 'package:tarantar/tools/functions.dart';

class OrderForm extends StatefulWidget {
  createState() {
    return OrderFormState();
  }
}

class OrderList {

}

class OrderFormState extends State<OrderForm> {
  List<OrderList> orderList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Tarantar"),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Image.asset(
                      getAssetImages("orderNotFound.png"),
                      height: 300,
                      width: 300
                    ),
                    Text("Kamu tidak\nmempunyai pesanan", textAlign: TextAlign.center),
                  ],
                );
              }
            )
          ),
          RaisedButton(
            color: Colors.green,
            child: Text("Tambah Pesanan", style: TextStyle(color: Colors.white)),
            onPressed: () {
              
            },
          )
        ],
      ),
    );
  }
}
