import 'package:flutter/material.dart';
import 'package:tarantar/configuration.dart';
import 'package:tarantar/tools/functions.dart';
import 'package:tarantar/widgets/customText.dart';
import 'package:tarantar/widgets/customTextField.dart';
import 'package:tarantar/models/order.dart';

class OrderForm extends StatefulWidget {
  createState() {
    return OrderFormState();
  }
}

class OrderFormState extends State<OrderForm> {
  List<Order> orderList = [];

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText("Buat Pesanan", color: Colors.black, family: "Montserrat"),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              customNavigator(context, "orderAddCustomerForm");
            },
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                "http://via.placeholder.com/300",
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Card(
                                  // color: Colors.grey,
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: CustomText("Besar File Maksimum", color: Colors.black)
                                  ),
                                ),
                                OutlineButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                  color: Colors.white,
                                  child: CustomText("Upload Foto", color: Colors.black),
                                  onPressed: () {
                                    
                                  },
                                ),
                                // Card(
                                //   color: Colors.grey,
                                //   child: Container(
                                //     child: Column(
                                //       mainAxisSize: MainAxisSize.min,
                                //       children: [
                                //         CustomText("Besar File Maksimum", style: TextStyle(color: Colors.black)),
                                //         CustomText("2 Megabyte (2MB)"),
                                //         Spacer(),
                                //         CustomText("File yang diperbolehkan"),
                                //         CustomText("JPG, JPEG, PNG"),
                                //       ]
                                //     )
                                //   )
                                // )
                              ],
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        CustomText("Nama Pesanan"),
                        CustomTextField(hintText: "Masukkan Nama Pesanan",),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText("Tanggal Penjemputan"),
                                  CustomTextField(hintText: "19 Agustus 2020")
                                ]
                              )
                            ),
                            Spacer(flex: 1),
                            Expanded(
                              flex: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText("Jam Penjemputan"),
                                  CustomTextField(hintText: "19:20"),
                                ]
                              )
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      ]
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText("Detail Barang", fontWeight: FontWeight.bold, fontSize: 16, family: "Montserrat"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                        CustomText("Kategori"),
                        CustomTextField(hintText: "Masukkan Nama Pesanan"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                        CustomText("Jumlah Barang"),
                        CustomTextField(hintText: "Masukkan Jumlah Barang"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2.5)),
                        CustomText("Format: Panjang x Lebar x Tinggi", fontStyle: FontStyle.italic, color: Colors.grey),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                        CustomText("Dimensi per Barang"),
                        CustomTextField(hintText: "Masukkan Dimensi Barang"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                        Row(
                          children: [
                            CustomText("Berat per Barang "),
                            Icon(Icons.info, color: c.primaryColor, size: 16)
                          ],
                        ),
                        CustomTextField(hintText: "Masukkan Berat Barang"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                        CustomText("Catatan"),
                        CustomTextField(hintText: "Masukkan Catatan"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2.5)),
                        CustomText("Contoh: Barang jangan dibalik balik", fontStyle: FontStyle.italic, color: Colors.grey),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      ]
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText("Lokasi Penjemputan", fontWeight: FontWeight.bold, fontSize: 16, family: "Montserrat"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        CustomText("Alamat Penjemputan"),
                        CustomTextField(hintText: "Masukkan Alamat Penjemputan"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              margin: EdgeInsets.only(right: 15),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                color: c.primaryColor,
                                child: Icon(Icons.pin_drop, color: Colors.white, size: 40),
                                onPressed: () {
                                  
                                },
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CustomTextField(hintText: "Masukkan Alamat Penjemputan"),
                                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                  CustomText("Pastikan lokasi yang Anda tandai di peta sesuai dengan alamat yang Anda isi di atas", fontStyle: FontStyle.italic, color: Colors.grey)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    color: c.primaryColor,
                    child: Container(
                      width: mediaWidth - 70,
                      height: 50,
                      child: Center(
                        child: CustomText("Buat Pesanan", color: Colors.white, fontWeight: FontWeight.bold)
                      )
                    ),
                    onPressed: () {
                      Alert(
                        context: context,
                        title: "Berhasil",
                        showIcon: false,
                        content: CustomText("Buat pesanan berhasil! Menunggu kurir untuk membantu pesanan anda."),
                        cancel: false,
                        defaultAction: () async {
                          Navigator.of(context).pop();
                        }
                      );
                    },
                  ),
                )
              ],
            );
          }
        )
      ),
    );
  }
  
  Future<bool> onWillPop() async {
    return true;
  }
}
