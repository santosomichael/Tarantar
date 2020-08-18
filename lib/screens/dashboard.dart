import 'package:flutter/material.dart';
import 'package:tarantar/tools/functions.dart';

class Dashboard extends StatefulWidget {
  createState() {
    return DashboardState();
  }
}

class OrderList {

}

class DashboardState extends State<Dashboard> {
  List<OrderList> orderList = [OrderList(),OrderList(),OrderList(),OrderList(),OrderList(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Tarantar"),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
        actions: [
          Icon(Icons.person)
          // Image.asset(
          //   getAssetImages("account.png"),
          //   height: 40,
          //   width: 40
          // )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.all(20),  
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                border: OutlineInputBorder(),
                hintText: "Cari Pesanan",
              ),
            ),
          ),
          Expanded(
            child: orderList.length == 0 ?
            ListView.builder(
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
            :
            ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    height: 75,
                    child: Row(
                      children: [
                        Expanded(
                          flex:1,
                          child: Container()
                        ),
                        Expanded(
                          flex:1,
                          child: Container(
                            color: Colors.grey,
                            height: 40,
                            width: 40,
                            child: ClipOval(
                              // borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child: Container()
                        ),
                        Expanded(
                          flex:7,
                          child: Text("Gambar"),
                        ),
                      ],
                    )
                  )
                );
              }
            )
          ),
          RaisedButton(
            color: Colors.green,
            child: Text("Tambah Pesanan", style: TextStyle(color: Colors.white)),
            onPressed: () {
              customNavigator(context, "orderForm");
            },
          )
        ],
      ),
    );
  }
}
