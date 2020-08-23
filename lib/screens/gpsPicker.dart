// package
import 'package:flutter/material.dart';
import 'package:tarantar/configuration.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:tarantar/widgets/customText.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:location/location.dart' as loc;

// screens

// widget

// resources

// models

class GpsPicker extends StatefulWidget {
  
  String gps;
  GpsPicker({Key key, this.gps}) : super(key: key);

  @override
  _GpsPickerState createState() => _GpsPickerState();
}

class _GpsPickerState extends State<GpsPicker> {
  LatLng _kMapCenter = LatLng(-7.3329142, 112.7785162);
  bool gpsPickerListLoading = true;
  GoogleMapController mapController;
  double long, lat;
  bool toggle = false;
  int tempIndex = -1;
  double minLat = 0, maxLat = 0;
  double minLong = 0, maxLong = 0;
  double alpha = 1;

  bool isLoading = false;
  int page = 1;

  String address = "", addressName = "";
  String initialGps = "";

  String googleApiKey = "";

  Map<MarkerId, Marker> markerList = <MarkerId, Marker>{};
  
  @override
  void initState(){
    
  }

  // getCurrentLocation() async {
  //   final location = loc.Location();
  //   var currentLocation = await location.getLocation();
  //   initialGps = "${currentLocation.latitude}, ${currentLocation.longitude}";

  //   // kalau map controller masih null akan ditunggu sebentar 1 detik
  //   if (mapController == null)
  //     await Future.delayed(Duration(seconds: 1));

  //   mapController.animateCamera(CameraUpdate.newCameraPosition(
  //     CameraPosition(
  //       bearing: 0,
  //       target: LatLng(currentLocation.latitude, currentLocation.longitude),
  //       zoom: 17.0,
  //     ),
  //   ));
  // }

  LatLng _lastMapPosition = LatLng(-7.332493, 112.778838);
  
  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  // Future<Null> displayPrediction(Prediction p) async {
  //   if (p != null) {
  //     var placeId = p.placeId;
  //     GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: googleApiKey);
  //     PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(placeId);
  //     // printHelp(placeId);
  //     // printHelp(detail);
  //     // printHelp(detail.result);
  //     // printHelp(detail.result.geometry);

  //     double lat = detail.result.geometry.location.lat;
  //     double lng = detail.result.geometry.location.lng;

  //     // var tempAddress = await Geocoder.local.findAddressesFromQuery(p.description);
  //     // printHelp(p.description);
  //     // printHelp(tempAddress[0].addressLine);
  //     // printHelp(tempAddress[0].featureName);
  //     // printHelp(tempAddress[0].locality);
  //     // printHelp(tempAddress[0].subAdminArea);
  //     // printHelp(tempAddress[0].thoroughfare);
  //     // printHelp(tempAddress[0].adminArea);
  //     // printHelp(tempAddress[0].subThoroughfare);

  //     addressName = p.description.split(",")[0];
  //     mapController.animateCamera(CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         bearing: 0,
  //         target: LatLng(lat, lng),
  //         zoom: 17.0,
  //       ),
  //     ));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText("Memilih GPS", color: Colors.black, family: "Montserrat", fontSize: 16),
        iconTheme: IconThemeData(
          color: c.primaryColor
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: c.primaryColor, size: 24),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () async {
        //       Prediction p = await PlacesAutocomplete.show(
        //         context: context,
        //         apiKey: googleApiKey,
        //         mode: Mode.overlay,
        //       );

        //       displayPrediction(p);
        //     },
        //   )
        // ],
      ),
      floatingActionButton: Transform.scale(
        scale: 1,
        child: FloatingActionButton.extended(
          backgroundColor: c.primaryColor,
          icon: Icon(Icons.add, color: Colors.white),
          label: CustomText("Pick", color: Colors.white,),
          onPressed: () async {
            // if (address == "") {
            //   List<Address> tempAddressList = await Geocoder.local.findAddressesFromCoordinates(
            //     Coordinates(_lastMapPosition.latitude, _lastMapPosition.longitude)
            //   );
            //   address = tempAddressList[0].addressLine;
            // }
            Navigator.of(context).pop();
          }
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        alignment: Alignment(0.0, 0.0),
        children: [
          Container(
            height: mediaHeight,
            width: mediaWidth,
            child: GoogleMap(
              onCameraMove: _onCameraMove,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _kMapCenter,
                zoom: 18.0,
              ),
              markers: Set<Marker>.of(markerList.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
          ),
          Positioned(
            top: (mediaHeight - 40 * 3)/ 2,
            right: (mediaWidth - 40)/ 2,
            child: Icon(Icons.place, size: 30, color: Colors.red),
          )
        ]
      ),
    );
  }
}
