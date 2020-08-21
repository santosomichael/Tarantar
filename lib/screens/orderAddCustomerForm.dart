import 'package:flutter/material.dart';
import 'package:tarantar/configuration.dart';
import 'package:tarantar/tools/functions.dart';
import 'package:tarantar/widgets/customText.dart';
import 'package:tarantar/widgets/customTextField.dart';
import 'package:tarantar/models/address.dart';

class OrderAddCustomerForm extends StatefulWidget {
  createState() {
    return OrderAddCustomerFormState();
  }
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
    double mediaWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText("Buat Pesanan", color: Colors.black, family: "Montserrat"),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15),
            child: Center(
              child: CustomText("Selesai", fontWeight: FontWeight.bold, color: c.primaryColor)
            )
          )
        ],
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
                    CustomText("Kamu tidak\nmempunyai pesanan", textAlign: TextAlign.center),
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
                              child: CustomText("${index+1}", fontWeight: FontWeight.bold, fontSize: 20)
                            )
                          ),
                          Container(
                            height: 80,
                            width: 40,
                            margin: EdgeInsets.only(right: 15),
                            color: c.primaryColor,
                            child: Icon(Icons.drag_handle, color: Colors.white, size: 32),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomText(item.name, fontWeight: FontWeight.bold, family: "Montserrat"),
                                CustomText(item.phone, color: c.primaryColor, fontWeight: FontWeight.bold, family: "Montserrat"),
                                CustomText(item.address, maxLines: 2, overflow: TextOverflow.ellipsis)
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
                                    content: CustomText("Anda ingin menghapus alamat ini."),
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
                        flex:10,
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                          color: Colors.white,
                          child: Container(
                            height: 50,
                            child: Center(
                              child: CustomText("Preview", color: c.primaryColor, fontWeight: FontWeight.bold)
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
                      Spacer(flex: 1),
                      Expanded(
                        flex:10,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                          color: c.primaryColor,
                          child: Container(
                            height: 50,
                            child: Center(
                              child: CustomText("Tambah", color: Colors.white, fontWeight: FontWeight.bold)
                            )
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (builder) {
                                double mediaWidth = MediaQuery.of(context).size.width;
                                double mediaHeight = MediaQuery.of(context).size.height;
                                
                                return Container(
                                  child: Container(
                                    decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0))),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                CustomText("Masukkan Tujuan", family: "Montserrat"),
                                                InkWell(
                                                  child: Icon(Icons.keyboard_arrow_down, color: c.primaryColor, size: 32),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15,
                                            ),
                                            child: ListView(
                                              children: [
                                                CustomText("Nama"),
                                                CustomTextField(hintText: "Masukkan Nama"),
                                                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                                                CustomText("Nomor Handphone"),
                                                CustomTextField(hintText: "Masukkan Nomor Handphone"),
                                                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                                                CustomText("Alamat"),
                                                CustomTextField(hintText: "Masukkan Alamat Tujuan"),
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
                                                Container(
                                                  padding: EdgeInsets.only(bottom: 25, top: 25),
                                                  child: RaisedButton(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                                    color: c.primaryColor,
                                                    child: Container(
                                                      width: mediaWidth / 2,
                                                      height: 50,
                                                      child: Center(
                                                        child: CustomText("Tambah", color: Colors.white, fontWeight: FontWeight.bold)
                                                      )
                                                    ),
                                                    onPressed: () {
                                                      addressList.add(
                                                        Address(id:6, name: "Linawati", phone: "08136578923", address: "Jln Manyar Rahardjo"),
                                                      );

                                                      setState(() {
                                                        addressList = addressList;  
                                                      });
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
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
