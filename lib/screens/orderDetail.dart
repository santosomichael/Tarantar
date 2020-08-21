import 'package:flutter/foundation.dart';
import 'package:tarantar/configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tarantar/tools/functions.dart';
import 'package:tarantar/widgets/customText.dart';
import 'package:tarantar/models/order.dart';

class OrderDetail extends StatefulWidget {
  createState() {
    return OrderDetailState();
  }
}

class OrderDetailState extends State<OrderDetail> {
  GoogleMapController mapController;
  List<Order> orderList = [];
  LatLng _kMapCenter = LatLng(-7.3329142, 112.7785162);
  Set<Circle> circleSet = Set.from([]);

  int selectedMessageValue = 0;
  int orderStatus = 2;
  // 1 dibatalkan
  // 2 dibuat, mencari driver
  // 3 menunggu driver ada yang diterima
  // 4 menunggu mulai antar
  // 5 mulai mengantar

  int userRole = 2;
  // 1 sender
  // 2 driver

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
                  color: i == 0 ? Colors.blueAccent:c.primaryColor
                ),
              ),
              Expanded(
                flex:9,
                child: CustomText(item, maxLines: 1, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold)
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
        title: CustomText("Pesanan", color: Colors.black, family: "Montserrat"),
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
                          // kalau orderan berjalan, rute yang harus dikunjungi akan di atas
                          if (orderStatus == 5)
                          ...addressWidgetList,
                          Container(
                            width: mediaWidth,
                            height: orderStatus != 5 ? mediaWidth * 0.75 : mediaWidth * 1.5,
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
                          if (orderStatus != 5)
                          ...addressWidgetList
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),

                    // pesanan mulai diantarkan
                    if (orderStatus != 5)
                    Card(
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
                                      height: 40,
                                      width: 40,
                                      child: Image.network(
                                        "https://sweetrip.id/wp-content/uploads/2020/05/duniakulinersurabaya_84272350_541137659861429_5681105554989196814_n.jpg",
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText("Botol", family: "Montserrat", fontSize: 20),
                                        Row(
                                          children: [
                                            CustomText("@Rp. 10.000", fontWeight: FontWeight.bold, color: c.primaryColor, family: "Montserrat"),
                                            CustomText(" (2 titik tujuan)", fontSize: 10),
                                          ],
                                        ),
                                        CustomText("20 pcs", fontSize: 10, fontWeight: FontWeight.bold),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("Tanggal Order", fontWeight: FontWeight.bold),
                                CustomText("Nomor Order", fontWeight: FontWeight.bold),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("23 Agustus 2020", fontSize: 12),
                                CustomText("X1001/192320", fontSize: 12)
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("Tanggal & Jam Pengambilan", fontSize: 10),
                                CustomText("27 Agustus 2020 19:00", fontWeight: FontWeight.bold, color: c.primaryColor, family: "Montserrat", fontSize: 12)
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex:5,
                                  child: CustomText("Kategori", fontSize: 12),
                                ),
                                Expanded(
                                  flex:1,
                                  child: CustomText(":\t\t", textAlign: TextAlign.end),
                                ),
                                Expanded(
                                  flex:6,
                                  child: CustomText("Minuman", textAlign: TextAlign.start, fontWeight: FontWeight.bold, fontSize: 12)
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex:5,
                                  child: CustomText("Berat Total", fontSize: 12),
                                ),
                                Expanded(
                                  flex:1,
                                  child: CustomText(":\t\t", textAlign: TextAlign.end),
                                ),
                                Expanded(
                                  flex:6,
                                  child: CustomText("800 gr", textAlign: TextAlign.start, fontWeight: FontWeight.bold, fontSize: 12)
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex:5,
                                  child: CustomText("Dimensi per produk (cm)", fontSize: 12),
                                ),
                                Expanded(
                                  flex:1,
                                  child: CustomText(":\t\t", textAlign: TextAlign.end),
                                ),
                                Expanded(
                                  flex:6,
                                  child: CustomText("100 x 120 x 30", fontWeight: FontWeight.bold, fontSize: 12)
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex:5,
                                  child: CustomText("Tipe Kendaraan", fontSize: 12),
                                ),
                                Expanded(
                                  flex:1,
                                  child: CustomText(":\t\t", textAlign: TextAlign.end),
                                ),
                                Expanded(
                                  flex:6,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                      color: c.primaryColor,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                        child: CustomText("Mobil", color: Colors.white, fontSize: 12)
                                      )
                                    )
                                  )
                                ),
                              ],
                            ),
                            Divider(),
                            CustomText("Catatan :", fontSize: 12),
                            Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                            CustomText("Jangan dibalik balik.", fontWeight: FontWeight.bold, fontSize: 12),
                            Padding(padding: EdgeInsets.symmetric(vertical: 20))
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),

                    if (orderStatus != 5)
                    Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText("Informasi Sender", family: "Montserrat"),
                            Container(
                              height: 60,
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.network(
                                        "https://www.1999.co.jp/itbig54/10547622.jpg",
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText("Reza Ultraman", fontWeight: FontWeight.bold),
                                      Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        color: Color(0xFFedfeee),
                                        child: CustomText("0821123873677", color: Colors.green)
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (orderStatus == 5 && userRole == 2)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText("Nathanael Rayestu", family: "Montserrat"),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                        CustomText("Jl Siwalankerto Blok A7 No 23, Siwalankerto, Surabaya. 081335611166")
                      ]
                    )
                  ),
                  if (orderStatus == 5 && userRole == 2)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider()
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: getBottomButtonWidgetList()
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getBottomButtonWidgetList() {
    double mediaWidth = MediaQuery.of(context).size.width;

    if (orderStatus == 2 && userRole == 2) {
      // order dibuat, mencari driver, driver
      return [
        Container(
          width: mediaWidth - 70,
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            color: c.primaryColor,
            child: Container(
              width: mediaWidth - 70,
              height: 50,
              child: Center(
                child: CustomText("Terima Pesanan", color: Colors.white)
              )
            ),
            onPressed: () {
              Alert(
                context: context,
                title: "Berhasil",
                showIcon: false,
                content: CustomText("Menunggu sender menerima permintaan anda."),
                cancel: false,
                defaultAction: () async {
                  setState(() {
                    orderStatus = 3;
                    userRole = 1;
                  });
                  // Navigator.of(context).pop();
                }
              );
            },
          )
        )
      ];
    } else if (orderStatus == 3 && userRole == 1) {
      return [
        // driver ditemukan, sender
        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
        getOrderCancel(),
        Padding(padding: EdgeInsets.symmetric(horizontal: 2.5)),
        Expanded(
          flex:1,
          child: RaisedButton(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: c.primaryColor,
            child: Container(
              height: 50,
              child: Center(
                child: CustomText("Lihat List Driver (3)", color: Colors.white)
              )
            ),
            onPressed: () async {
              bool refresh = await customNavigator(context, "orderCourierList") as bool;
              if (refresh ?? false) {
                setState(() {
                    orderStatus = 4;
                    userRole = 2;
                  });
              }
            },
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
      ];
    } else if (orderStatus == 4 && userRole == 2) {
      // driver telah dipilih, sender
      return [
        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
        getOrderCancel(),
        Padding(padding: EdgeInsets.symmetric(horizontal: 2.5)),
        Expanded(
          flex:1,
          child: RaisedButton(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: c.primaryColor,
            child: Container(
              height: 50,
              child: Center(
                child: CustomText("Mulai Antar", color: Colors.white)
              )
            ),
            onPressed: () async {
              Alert(
                context: context,
                title: "Order akan dimulai",
                showIcon: false,
                content: CustomText("Pastikan kurir telah mengambil barang anda yang akan diantarkan."),
                defaultAction: () async {
                  setState(() {
                    orderStatus = 5;
                    userRole = 2;
                  });
                }
              );
            },
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
      ];
    } else {
      if (orderStatus == 5 && userRole == 2) {
        return [
          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          getOrderCancel(),
          Container(
            width: 60,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: OutlineButton(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              child: Icon(Icons.call, color: c.primaryColor),
              onPressed: () async {

              },
            )
          ),
          Container(
            width: 60,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: OutlineButton(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              child: Image.asset(
                getAssetImages("iconWa.png"),
                height: 25,
                width: 25
              ),
              onPressed: () async {

              },
            )
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 2.5)),
          Expanded(
            flex:1,
            child: RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: c.primaryColor,
              child: Container(
                height: 50,
                child: Center(
                  child: CustomText("Pesanan sampai di titik", color: Colors.white, fontSize: 12)
                )
              ),
              onPressed: () async {
                customNavigator(context, "orderDelivered");
              },
            )
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
        ];
      } else {
        return [
          Spacer(flex: 1),
          Expanded(
            flex:5,
            child: OutlineButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              color: Colors.white,
              child: CustomText("Batal", color: Colors.green),
              onPressed: () {
                Alert(
                  context: context,
                  title: "Apakah anda yakin?",
                  showIcon: false,
                  content: CustomText("Anda ingin membatalkan kerjasama dengan sender?"),
                  defaultAction: () async {
                    
                  }
                );
              },
            )
          ),
          Spacer(flex: 1),
          // dibuat mencari driver, sender
          if (orderStatus == 2 && userRole == 1)
          Expanded(
            flex:12,
            child: RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: c.primaryColor,
              child: CustomText("Edit", color: Colors.white),
              onPressed: () async {

              },
            )
          ),
        ];
      }
    }
  }

  Widget getContactWa() {
    return Container(
      width: 50,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: OutlineButton(
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Image.asset(
          getAssetImages("iconWa.png"),
          height: 25,
          width: 25
        ),
        onPressed: () async {

        },
      )
    );
  }

  Widget getOrderCancel() {
    List<String> cancelMessageList = [
      "Kecelakaan",
      "Lokasi penjemputan terlalu jauh",
      "Sender tidak dapat dihubungi",
      "Transportasi tidak muat angkut",
      "Kendaraan rusak",
      "Saya tidak dapat menyelesaikan orderan ini",
      "Alasan lain"
    ];
    List<Widget> cancelMessageWidgetList = [];

    for (var i = 0; i < cancelMessageList.length; i++) {
      final item = cancelMessageList[i];

      cancelMessageWidgetList.add(
        RadioListTile(
          title: CustomText("$item"),
          groupValue: selectedMessageValue,
          value: i,
          onChanged: (val) {
            setState(() {
              selectedMessageValue = val;
            });
          }
        )
      );
    }
    
    return Container(
      width: 60,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: OutlineButton(
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Icon(Icons.remove_circle_outline, color: Colors.red),
        onPressed: () {
          Alert(
            context: context,
            title: "Batalkan Pesanan",
            showIcon: false,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...cancelMessageWidgetList
              ]
            ),
            cancel: false,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OutlineButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: CustomText("Kirim", color: c.primaryColor),
                    onPressed: () async {

                    },
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: c.primaryColor,
                    child: CustomText("Batal", color: Colors.white),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ],
          );
        },
      )
    );
  }
}
