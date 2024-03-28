import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locator;
// import 'package:location/location.dart';
import 'package:paytex/shared/utils/themes/theme.dart';
import 'package:paytex/shared/utils/utils.dart';
import 'package:paytex/shared/widgets/space.dart';

import '../../shared/widgets/base_view.dart';
import 'viewmodel/authentication_vm.dart';

class SignUp extends StatefulWidget {
  final bool? isChangePwd;
  SignUp({Key? key, this.isChangePwd}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GoogleMapController? mapController;
  locator.Location location = locator.Location();
  Set<Marker> markers = {};

  Future<void> _requestLocationPermission() async {
    final status = await location.requestPermission();
    if (status == locator.PermissionStatus.granted) {
      // Permission granted, proceed with using location
      _getUserLocation();
    } else {
      // Permission denied, handle accordingly
    }
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    final userLocation = await location.getLocation();
    setState(() {
      markers.add(Marker(
          markerId: MarkerId('userLocation'),
          position: LatLng(userLocation.latitude!, userLocation.longitude!),
          infoWindow: InfoWindow(title: 'Your Location'),
          onTap: () {}));
    });
  }

  Set<Polyline> polylines = {
    Polyline(
      polylineId: PolylineId('route1'),
      points: [
        LatLng(37.7749, -122.4194),
        LatLng(37.8051, -122.4300),
        LatLng(37.8070, -122.4093),
      ],
      color: Colors.blue,
      width: 4,
    ),
  };

  Set<Polygon> polygons = {
    Polygon(
      polygonId: PolygonId('area1'),
      points: [
        LatLng(37.7749, -122.4194),
        LatLng(37.8051, -122.4300),
        LatLng(37.8070, -122.4093),
      ],
      fillColor: Colors.green.withOpacity(0.3),
      strokeColor: Colors.green,
      strokeWidth: 2,
    ),
  };

  Future<void> _performGeocoding() async {
    List<Location> locations = await locationFromAddress(
        '1600 Amphitheatre Parkway, Mountain View, CA');
    if (locations.isNotEmpty) {
      print(
          'Latitude: ${locations.first.latitude}, Longitude: ${locations.first.longitude}');
    }
  }

  Future<void> _performReverseGeocoding() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(37.7749, -122.4194);
    if (placemarks.isNotEmpty) {
      print(
          'Address: ${placemarks.first.street}, ${placemarks.first.locality}, ${placemarks.first.country}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
        vmBuilder: (context) => AuthViewModel(context: context),
        builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: deviceWidth(context),
          height: deviceHeight(context),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Styles.bold(
                'Create account',
                color: pmTheme.text,
                fontSize: 24.sp,
              ),
              HSpace(32.h),
              Styles.semiBold(
                'Full Name',
                color: pmTheme.text,
                fontSize: 14.sp,
              ),
              Expanded(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.7749, -122.4194),
                    zoom: 12,
                  ),
                  mapType: MapType.normal, // Change to other map types
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  markers: markers,
                  onTap: (LatLng latLng) {
                    // Hide info window when tapping on the map
                    setState(() {
                      markers.forEach((marker) {
                        markers.remove(marker.copyWith(
                            infoWindowParam: InfoWindow.noText));
                      });
                    });
                  },
                  zoomGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
