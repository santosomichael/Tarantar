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
        title: CustomText("Buat Pesanan", color: Colors.black, family: "Montserrat", fontSize: 16),
        iconTheme: IconThemeData(
          color: c.primaryColor
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: c.primaryColor, size: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                height: 140,
                                width: 140,
                                child: Image.network(
                                  "https://sweetrip.id/wp-content/uploads/2020/05/duniakulinersurabaya_84272350_541137659861429_5681105554989196814_n.jpg",
                                ),
                              )
                            ),
                            Expanded(
                              flex:1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Card(
                                    color: Color(0XFFF6F6F6),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15)
                                      ),
                                      height: 95,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText("Besar File Maksimum", fontWeight: FontWeight.bold),
                                          CustomText("2 Megabyte (2MB)"),
                                          Padding(padding: EdgeInsets.symmetric(vertical: 2.5)),
                                          CustomText("File yang diperbolehkan", fontWeight: FontWeight.bold),
                                          CustomText("JPG, JPEG, PNG")
                                        ]
                                      )
                                    )
                                  ),
                                  OutlineButton(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                    color: Colors.white,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 35),
                                      child: CustomText("Upload Foto", color: Colors.black)
                                    ),
                                    onPressed: () {
                                      
                                    },
                                  )
                                ],
                              ),
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
                                  CustomText("Tanggal Pengambilan"),
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
                                  CustomText("Jam Pengambilan"),
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
                        CustomText("Detail Barang", fontWeight: FontWeight.bold, fontSize: 16),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                        CustomText("Kategori"),
                        CustomTextField(hintText: "Masukkan Kategori Pesanan"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                        CustomText("Jumlah Barang"),
                        CustomTextField(hintText: "Masukkan Jumlah Barang"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                        CustomText("Dimensi per Barang"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2.5)),
                        CustomText("Format: Panjang x Lebar x Tinggi", fontStyle: FontStyle.italic, color: Colors.grey),
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
                        CustomText("Lokasi Pengambilan", fontWeight: FontWeight.bold, fontSize: 16, family: "Montserrat"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        CustomText("Alamat Pengambilan"),
                        CustomTextField(hintText: "Masukkan Alamat Pengambilan"),
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
                                  customNavigator(context, "gpsPicker");
                                },
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CustomTextField(hintText: "Masukkan Alamat Pengambilan"),
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
                // Container(
                //   padding: EdgeInsets.only(bottom: 10, top: 10),
                //   child: RaisedButton(
                //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                //     color: c.primaryColor,
                //     child: Container(
                //       width: mediaWidth - 70,
                //       height: 50,
                //       child: Center(
                //         child: CustomText("Tambahkan Alamat Pengantaran", color: Colors.white, fontWeight: FontWeight.bold)
                //       )
                //     ),
                //     onPressed: () {
                //       Alert(
                //         context: context,
                //         title: "Berhasil",
                //         showIcon: false,
                //         content: CustomText("Buat pesanan berhasil! Menunggu kurir untuk membantu pesanan anda."),
                //         cancel: false,
                //         defaultAction: () async {
                //           Navigator.of(context).pop();
                //         }
                //       );
                //     },
                //   ),
                // ),
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
                              flex: 12,
                              child: OutlineButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                color: Colors.white,
                                child: Container(
                                  height: 50,
                                  child: Center(
                                    child: CustomText("Tambah Penerima", color: c.primaryColor, fontWeight: FontWeight.bold)
                                  )
                                ),
                                onPressed: () {
                                  customNavigator(context, "orderAddCustomerForm");
                                },
                              ),
                            ),
                            Spacer(flex: 1),
                            Expanded(
                              flex: 12,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                color: c.primaryColor,
                                child: Container(
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
                            ),
                            Spacer(flex: 2),
                          ],
                        )
                      ),
                    ],
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
