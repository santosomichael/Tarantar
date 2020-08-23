import 'package:flutter/material.dart';
import 'package:tarantar/configuration.dart';
import 'package:tarantar/tools/functions.dart';
import 'package:tarantar/widgets/customText.dart';
import 'package:tarantar/widgets/customTextField.dart';
import 'package:tarantar/models/address.dart';
import 'package:tarantar/models/order.dart';

class OrderDelivered extends StatefulWidget {
  createState() {
    return OrderDeliveredState();
  }
}

class OrderDeliveredState extends State<OrderDelivered> {
  List<Address> addressList = [
    Address(id:1, name: "Michael Santoso", phone: "0813356111232", address: "Jalan rungkut mutiara blok b 20", rating: 4, latitude: -7.332756, longitude: 112.778711),
    Address(id:2, name: "Shendy Christyanto",  phone: "0813939498", address: "Jl. Siwalankerto VIII, Ab 11, Padang Pasir", rating: 4, latitude: -7.338982, longitude: 112.733674),
    Address(id:3, name: "Felicia Santoso",  phone: "08787123234", address: "Perumahan graha tirta blok dahlia nomor 10", rating: 3, latitude: -7.351084, longitude: 112.740689),
  ];

  Order order = Order(id: 2, name: "Korean Barbeque", totalDestination: 3, price: 10000, total: 10, notes: "Jangan ditumpuk ya", category: "Makanan");

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText("Buat Kirim", family: "Montserrat",),
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
                    Card(
                      elevation: 0,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              elevation: 0,
                              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                              color: Color(0xFFedfeee),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(vertical: 5),
                                        height: 40,
                                        width: 40,
                                        child: Image.network(
                                          "https://sweetrip.id/wp-content/uploads/2020/05/duniakulinersurabaya_84272350_541137659861429_5681105554989196814_n.jpg",
                                        ),
                                      )
                                    ),
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText("${order.name}", family: "Montserrat", fontSize: 20),
                                        CustomText("${numberFormat(order.price, "Rp")}", fontWeight: FontWeight.bold, color: c.primaryColor, family: "Montserrat")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                            CustomText("Shendy Christyanto", family: "Montserrat"),
                            Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                            CustomText("${addressList[1].address} ${addressList[1].phone}"),
                            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            OutlineButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                              color: Colors.white,
                              child: Container(
                                height: 150,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.camera_alt, size: 32),
                                      CustomText("Ambil Gambar", fontWeight: FontWeight.bold)
                                    ],
                                  )
                                )
                              )
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                            CustomText("Pastikan barang terfoto dengan jelas", fontStyle: FontStyle.italic, fontSize: 12, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText("Catatan (Opsional)"),
                            CustomTextField(hintText: "Masukan Catatan"),
                            Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                            CustomText("Contoh: Barang dititipkan di satpam", fontStyle: FontStyle.italic, fontSize: 12, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            )
          ),
          Card(
            margin: EdgeInsets.all(0),
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Row(
                    children: [
                      Spacer(flex: 2),
                      Expanded(
                        flex:5,
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                          color: Colors.white,
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Icon(Icons.call, color: c.primaryColor)
                            )
                          ),
                          onPressed: () {
                            
                          },
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex:5,
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                          color: Colors.white,
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Image.asset(
                                getAssetImages("iconWaGreen.png"),
                                height: 25,
                                width: 25
                              ),
                            )
                          ),
                          onPressed: () {
                            
                          },
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex:20,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                          color: c.primaryColor,
                          child: Container(
                            height: 50,
                            child: Center(
                              child: CustomText("Kirim & Lanjut", color: Colors.white, fontWeight: FontWeight.bold)
                            )
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _updateMyItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    Address tempAddress = addressList.removeAt(oldIndex);
    addressList.insert(newIndex, tempAddress);

  }
}
