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
    double mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Buat Pesanan", style: TextStyle(color: Colors.black)),
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
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                                    child: Text("Besar File Maksimum", style: TextStyle(color: Colors.black))
                                  ),
                                ),
                                OutlineButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                  color: Colors.white,
                                  child: Text("Upload Foto", style: TextStyle(color: Colors.black)),
                                  onPressed: () {
                                    
                                  },
                                ),
                                // Card(
                                //   color: Colors.grey,
                                //   child: Container(
                                //     child: Column(
                                //       mainAxisSize: MainAxisSize.min,
                                //       children: [
                                //         Text("Besar File Maksimum", style: TextStyle(color: Colors.black)),
                                //         Text("2 Megabyte (2MB)"),
                                //         Spacer(),
                                //         Text("File yang diperbolehkan"),
                                //         Text("JPG, JPEG, PNG"),
                                //       ]
                                //     )
                                //   )
                                // )
                              ],
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Text("Nama Pesanan"),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Masukkan Nama Pesanan",
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tanggal Penjemputan"),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "19 Agustus 2020",
                                    ),
                                  ),
                                ]
                              )
                            ),
                            Spacer(flex: 1),
                            Expanded(
                              flex: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Jam Penjemputan"),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "19:20",
                                    ),
                                  ),
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
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Detail Barang", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Text("Kategori"),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Masukkan Nama Pesanan",
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Text("Jumlah Barang"),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Masukkan Jumlah Barang",
                          ),
                        ),
                        Text("Dimensi per Barang"),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Masukkan Dimensi Barang",
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Text("Berat per Barang"),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Masukkan Dimensi Barang",
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Text("Catatan"),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Masukkan Catatan",
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lokasi Penjemputan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Text("Alamat Penjemputan"),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Masukkan Alamat Penjemputan",
                          ),
                        ),
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
                                color: Color(0XFF2e7d32),
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
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Masukkan Alamat Penjemputan",
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                  Text("Pastikan lokasi yang Anda tandai di peta sesuai dengan alamat yang Anda isi di atas")
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
                    color: Color(0XFF2e7d32),
                    child: Container(
                      width: mediaWidth - 70,
                      height: 50,
                      child: Center(
                        child: Text("Buat Pesanan", style: TextStyle(color: Colors.white))
                      )
                    ),
                    onPressed: () {
                      Alert(
                        context: context,
                        title: "Berhasil",
                        showIcon: false,
                        content: Text("Buat pesanan berhasil! Menunggu kurir untuk membantu pesanan anda."),
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
