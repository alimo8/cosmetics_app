import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  final double? width;
  final double? height;

  const GoogleMapWidget({super.key, this.width, this.height});

  @override
  State<GoogleMapWidget> createState() => _MapSampleState();
}

class _MapSampleState extends State<GoogleMapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.0594699, 31.3285046),
    zoom: 14.4746,
  );

  Set<Marker> markers = {};

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(
      format: ui.ImageByteFormat.png,
    ))!.buffer.asUint8List();
  }

  Future<void> loadMarker() async {
    // مثال لو حبيت تضيف أيقونة مخصصة:
    final Uint8List markerIcon = await getBytesFromAsset(
      'assets/images/location_pin.png',
      40,
    );

    final Marker marker = Marker(
      markerId: const MarkerId('1'),
      position: const LatLng(30.0594699, 31.3285046),
      infoWindow: const InfoWindow(
        title: 'Market 1',
        snippet: 'Market 1 snippet',
      ),
      // ignore: deprecated_member_use
      icon: BitmapDescriptor.fromBytes(markerIcon),
    );

    setState(() {
      markers.add(marker);
    });
  }

  @override
  void initState() {
    super.initState();
    loadMarker();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: widget.width ?? 340.w,
        height: widget.height ?? 500.h,
        child: GoogleMap(
          zoomControlsEnabled: false,
          markers: markers,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
