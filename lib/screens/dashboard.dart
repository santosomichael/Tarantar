import 'package:flutter/material.dart';
import 'package:tarantar/configuration.dart';
import 'package:tarantar/tools/functions.dart';
import 'package:tarantar/widgets/customText.dart';
import 'package:tarantar/models/order.dart';

class Dashboard extends StatefulWidget {
  createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  List<Order> orderList = [
    Order(id: 1, name: "Garlic Cheese", totalDestination: 2, price: 10000, total: 20, notes: "Jangan dibalik balik", category: "Food"),
    Order(id: 2, name: "Korean Barbeque", totalDestination: 3, price: 10000, total: 10, notes: "Jangan ditumpuk ya", category: "Minuman"),
    // Order(id:3, name: "Samyang"),
    // Order(id:4, name: "Indomie Ceplok"),
    // Order(id:5, name: "Indomie Ceplok"),
  ];

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Image.asset(
            getAssetImages("tagline.png"),
            width: 175,
          )
        ),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
        leading: null,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Image.asset(
              getAssetImages("account.png"),
              height: 30,
              width: 30
            )
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = orderList[index];

                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  elevation: 10,
                  margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: InkWell(
                    onTap: () {
                      customNavigator(context, "orderDetail");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            color: Color(0XFFF2F0F1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("XI001/20", fontSize: 10, fontWeight: FontWeight.bold),
                                CustomText("Mencari Driver", color: c.primaryColor, fontSize: 10, fontWeight: FontWeight.bold),
                                CustomText("27 Aug 2020", fontSize: 10, fontWeight: FontWeight.bold)
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                height: 80,
                                width: 80,
                                child: Image.network(
                                  "https://sweetrip.id/wp-content/uploads/2020/05/duniakulinersurabaya_84272350_541137659861429_5681105554989196814_n.jpg",
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(item.name, family: "Montserrat", fontSize: 20),
                                  Row(
                                    children: [
                                      CustomText("@${numberFormat(item.price, "Rp")}", fontWeight: FontWeight.bold, color: c.primaryColor, family: "Montserrat"),
                                      CustomText(" (${item.totalDestination} titik tujuan)", fontSize: 10),
                                    ],
                                  ),
                                  CustomText("${item.total} pcs", fontSize: 10, fontWeight: FontWeight.bold),
                                  Divider(),
                                  CustomText("Catatan :", fontSize: 12),
                                  Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                                  CustomText("${item.notes}", fontWeight: FontWeight.bold, fontSize: 12),
                                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            )
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              color: c.primaryColor,
              child: Container(
                width: mediaWidth - 100,
                height: 50,
                child: Center(
                  child: CustomText("Tambah Pesanan", color: Colors.white)
                )
              ),
              onPressed: () {
                customNavigator(context, "orderForm");
              },
            ),
          )
        ],
      ),
    );
  }
}
