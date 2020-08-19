import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tarantar/tools/functions.dart';

class OrderDetail extends StatefulWidget {
  createState() {
    return OrderDetailState();
  }
}

class OrderList {

}

class OrderDetailState extends State<OrderDetail> {
  GoogleMapController mapController;
  List<OrderList> orderList = [];
  LatLng _kMapCenter = LatLng(-7.3329142, 112.7785162);
  Set<Circle> circleSet = Set.from([]);

  void initState() {
    super.initState();
    setCircles(_kMapCenter);
  }

  void setCircles(LatLng point) {
      final String circleIdVal = 'circle_id_1';
      double radius = 2000;
      circleSet.add(
        Circle(
          circleId: CircleId(circleIdVal),
          center: point,
          radius: radius,
          fillColor: Colors.redAccent.withOpacity(0.5),
          strokeWidth: 3,
          strokeColor: Colors.redAccent
        )
      );
    }

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;

    List<String> addressList = [
      "Zybrick Cafe Jalan Siwalankerto",
      "De Mata Trick Eye Museum Jogja",
      "ATM CIMB Niaga",
    ];

    List<Widget> addressWidgetList = [];
    
    for (var i = 0; i < addressList.length; i++) {
      final item = addressList[i];

      addressWidgetList.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
          child: Row(
            children: [
              Expanded(
                flex:1,
                child: Icon(
                  i == 0 ? Icons.person_pin_circle:Icons.swap_vertical_circle,
                  color: i == 0 ? Colors.blueAccent:Color(0XFF2e7d32)
                ),
              ),
              Expanded(
                flex:9,
                child: Text(item, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold))
              ),
            ]
          ),
        )
      );
    }

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Order Detail", style: TextStyle(color: Colors.black)),
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
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: mediaWidth,
                            height: mediaWidth * 0.75,
                            child: GoogleMap(
                              onMapCreated: _onMapCreated,
                              compassEnabled: true,
                              myLocationButtonEnabled: true,
                              myLocationEnabled: true,
                              // markers: Set<Marker>.of(markers.values),
                              initialCameraPosition: CameraPosition(
                                target: _kMapCenter,
                                zoom: 12.0,
                              ),
                              circles: circleSet,
                              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                                Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer(),),
                              ].toSet(),
                            )
                          ),
                          ...addressWidgetList
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                    Container(
                                      color: Colors.grey,
                                      height: 40,
                                      width: 40,
                                      child: ClipOval(
                                        // borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Korean Garlic Cheese Bread", style: TextStyle(fontWeight: FontWeight.bold)),
                                        Text("@Rp. 10.000", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFF2e7d32)))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tanggal Order", style: TextStyle(fontWeight: FontWeight.bold)),
                                Text("Nomor Order", style: TextStyle(fontWeight: FontWeight.bold))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("23 Agustus 2020"),
                                Text("X1001/192320")
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tanggal & Jam Pengambilan"),
                                Text("27 Agustus 2020 19:00", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0XFF2e7d32)))
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex:3,
                                  child: Text("Total Barang"),
                                ),
                                Expanded(
                                  flex:1,
                                  child: Text(":\t\t", textAlign: TextAlign.end),
                                ),
                                Expanded(
                                  flex:6,
                                  child: Text("20 pcs", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold))
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex:3,
                                  child: Text("Berat Total"),
                                ),
                                Expanded(
                                  flex:1,
                                  child: Text(":\t\t", textAlign: TextAlign.end),
                                ),
                                Expanded(
                                  flex:6,
                                  child: Text("800 gr", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold))
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex:3,
                                  child: Text("Dimensi (cm)"),
                                ),
                                Expanded(
                                  flex:1,
                                  child: Text(":\t\t", textAlign: TextAlign.end),
                                ),
                                Expanded(
                                  flex:6,
                                  child: Text("100 x 120 x 30", style: TextStyle(fontWeight: FontWeight.bold))
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex:3,
                                  child: Text("Tipe Kendaraan"),
                                ),
                                Expanded(
                                  flex:1,
                                  child: Text(":\t\t", textAlign: TextAlign.end),
                                ),
                                Expanded(
                                  flex:6,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Chip(
                                      backgroundColor: Color(0XFF2e7d32),
                                      padding: EdgeInsets.all(0),
                                      label: Text("Mobil", style: TextStyle(color: Colors.white))
                                    ),
                                  )
                                ),
                              ],
                            ),
                            Divider(),
                            Text("Catatan :"),
                            Text("Jangan dibalik balik.", style: TextStyle(fontWeight: FontWeight.w600)),
                            Padding(padding: EdgeInsets.symmetric(vertical: 20))
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Informasi Sender", style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(
                              height: 60,
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Container(
                                    color: Colors.grey,
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Reza Ultraman", style: TextStyle(fontWeight: FontWeight.bold)),
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        color: Color(0xFFedfeee),
                                        child: Text("0821123873677", style: TextStyle(color: Colors.green))
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Spacer(flex: 1),
                  Expanded(
                    flex:5,
                    child: OutlineButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      color: Colors.white,
                      child: Text("Batal", style: TextStyle(color: Colors.green)),
                      onPressed: () {
                        Alert(
                          context: context,
                          title: "Apakah anda yakin?",
                          showIcon: false,
                          content: Text("Anda ingin membatalkan kerjasama dengan sender?"),
                          defaultAction: () async {
                            
                          }
                        );
                      },
                    )
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex:12,
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      color: Color(0XFF2e7d32),
                      child: Text("Chat WA Sender", style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        String url = "https://wa.me/6281335611165?text=Selamat siang pizza hut delivery";

                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    )
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
