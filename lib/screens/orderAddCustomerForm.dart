import 'package:flutter/material.dart';
import 'package:tarantar/tools/functions.dart';

class OrderAddCustomerForm extends StatefulWidget {
  createState() {
    return OrderAddCustomerFormState();
  }
}

class Address {
  int id;
  String name;
  String phone;
  String address;
  String latitude;
  String longitude;

  Address({this.id, this.name, this.phone, this.address, this.latitude, this.longitude});
}

class OrderAddCustomerFormState extends State<OrderAddCustomerForm> {
  List<Address> addressList = [
    Address(id:1, name: "Michael Santoso", phone: "0813356111232", address: "Jalan kedondong timur nomor 45"),
    Address(id:2, name: "Shendy Christyanto",  phone: "0813939498", address: "Jalan pengangsaan timur nomo 20"),
    Address(id:3, name: "Felicia Santoso",  phone: "08787123234", address: "Perumahan graha tirta blok dahlia nomor 10"),
    Address(id:4, name: "Farenza Kharisma Putra", phone: "0813239894", address: "Jalan Menganti, Ruko Menanggal Blok A No 42, depan indomaret"),
    Address(id:5, name: "Shandy Christyanto", phone: "0898823232", address: "Jln Pahlawan gang 3 nomor 45"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Buat Pesanan", style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: addressList.length == 0 ?
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
            ReorderableListView(
              children: List.generate(addressList.length, (index) {
                final item = addressList[index];
                return Card(
                  key: ValueKey(item.id),
                  child: InkWell(
                    child: Container(
                      height: 80,
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Center(
                              child: Text("${index+1}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                            )
                          ),
                          Container(
                            height: 80,
                            width: 40,
                            margin: EdgeInsets.only(right: 15),
                            color: Color(0XFF2e7d32),
                            child: Icon(Icons.drag_handle, color: Colors.white, size: 32),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                                Text(item.phone, style: TextStyle(color: Color(0XFF2e7d32), fontWeight: FontWeight.bold)),
                                Text(item.address, maxLines: 2, overflow: TextOverflow.ellipsis)
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.edit),
                                ),
                                onTap: () {
                                  
                                }
                              ),
                              InkWell(
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.delete),
                                ),
                                onTap: () {
                                  Alert(
                                    context: context,
                                    title: "Apakah anda yakin?",
                                    showIcon: false,
                                    content: Text("Anda ingin menghapus alamat ini."),
                                    defaultAction: () async {
                                      
                                    }
                                  );
                                }
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      
                    },
                  )
                );
              }),
              onReorder: (int oldIndex, int newIndex) {
                setState(() {

                  _updateMyItems(oldIndex, newIndex);

                });

              },
            )
          ),
          Card(
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Masukkan Tujuan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      IconButton(
                        icon: Icon(Icons.chevron_right, color: Color(0XFF2e7d32), size: 32)
                      )
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:10),
                  child: Row(
                    children: [
                      Spacer(flex: 2),
                      Expanded(
                        flex:10,
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          color: Colors.white,
                          child: Text("Lihat Rute", style: TextStyle(color: Colors.green)),
                          onPressed: () {
                            
                          },
                        )
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex:10,
                        child: RaisedButton(
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          color: Color(0XFF2e7d32),
                          child: Text("Simpan", style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Alert(
                              context: context,
                              title: "Berhasil",
                              showIcon: false,
                              content: Text("Alamat berhasil disimpan."),
                              cancel: false,
                              defaultAction: () async {
                                Navigator.of(context).pop();
                              }
                            );
                          },
                        )
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
