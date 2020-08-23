import 'package:flutter/material.dart';
import 'package:tarantar/configuration.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tarantar/widgets/customText.dart';
import 'package:tarantar/models/address.dart';

class GpsShow extends StatefulWidget {
  
  String gps;
  GpsShow({Key key, this.gps}) : super(key: key);

  @override
  _GpsShowState createState() => _GpsShowState();
}

class _GpsShowState extends State<GpsShow> {
  List<Address> addressList = [
    Address(id:1, name: "Michael Santoso", phone: "0813356111232", address: "Jalan rungkut mutiara blok b 20", rating: 4, latitude: -7.332756, longitude: 112.778711),
    Address(id:2, name: "Shendy Christyanto",  phone: "0813939498", address: "Jl. Siwalankerto VIII, Ab 11, Padang Pasir", rating: 4, latitude: -7.338982, longitude: 112.733674),
    Address(id:3, name: "Felicia Santoso",  phone: "08787123234", address: "Perumahan graha tirta blok dahlia nomor 10", rating: 3, latitude: -7.351084, longitude: 112.740689),
  ];

  LatLng _kMapCenter = LatLng(-7.331324, 112.757980);
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
  Set<Polyline>_polyline = {};
  
  @override
  void initState() {
    
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

  void initMarkerList() {
    final MarkerId markerId = MarkerId("0");

    LatLng lastMapPosition = LatLng(-7.322005, 112.769728);

    markerList[markerId] = Marker(
      markerId: markerId,
      position: LatLng(
        lastMapPosition.latitude,
        lastMapPosition.longitude
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: InfoWindow(title: "0", snippet: '*'),
      onTap: () {
        
      }
    );

    List<LatLng> latLong = List();
    latLong.add(lastMapPosition);

    for (var i = 0; i < 3; i++) {
      final address = addressList[i];
      final MarkerId markerId = MarkerId((i+1).toString());

      lastMapPosition = LatLng(address.latitude, address.longitude);
      latLong.add(lastMapPosition);

      markerList[markerId] = Marker(
        markerId: markerId,
        position: LatLng(
          address.latitude,
          address.longitude,
        ),
        infoWindow: InfoWindow(title: i.toString(), snippet: '*'),
        onTap: () {
          
        }
      );

    }

    _polyline.add(Polyline(
        polylineId: PolylineId(0.toString()),
        visible: true,
        points: latLong,
        color: Colors.blueAccent,
    ));

    setState(() {
      markerList = markerList;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    initMarkerList();
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText("Preview", color: Colors.black, family: "Montserrat", fontSize: 16),
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
      body: Stack(
        alignment: Alignment(0.0, 0.0),
        children: [
          Container(
            height: mediaHeight,
            width: mediaWidth,
            child: GoogleMap(
              onCameraMove: _onCameraMove,
              myLocationEnabled: true,
              markers: Set<Marker>.of(markerList.values),
              polylines: _polyline,
              initialCameraPosition: CameraPosition(
                target: _kMapCenter,
                zoom: 13.0,
              ),
              onMapCreated: _onMapCreated,
            ),
          ),
        ]
      ),
    );
  }
}
