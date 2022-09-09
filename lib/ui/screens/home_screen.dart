import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiOverlayStyle, rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icab/configs/theme_manager.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );

  final ValueNotifier<Set<Marker>> _markers = ValueNotifier<Set<Marker>>({});

  Future<Uint8List> getBytesFromAsset({
    required String path,
    required int width,
  }) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          splashRadius: 25,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            splashRadius: 25,
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Consumer<ThemeNotifier>(
            builder: (context, theme, _) {
              return ValueListenableBuilder<Set<Marker>>(
                valueListenable: _markers,
                builder: (context, markers, _) {
                  return GoogleMap(
                    onMapCreated: (GoogleMapController mapController) async {
                      if (theme.getTheme() == theme.lightTheme) {
                        SystemChrome.setSystemUIOverlayStyle(
                          const SystemUiOverlayStyle(
                            statusBarColor: Colors.transparent,
                            statusBarIconBrightness: Brightness.dark,
                          ),
                        );
                        await mapController.setMapStyle(
                          await DefaultAssetBundle.of(context)
                              .loadString('assets/map_styles/silver.json'),
                        );
                      } else {
                        SystemChrome.setSystemUIOverlayStyle(
                          const SystemUiOverlayStyle(
                            statusBarColor: Colors.transparent,
                            statusBarIconBrightness: Brightness.light,
                          ),
                        );
                        await mapController.setMapStyle(
                          await DefaultAssetBundle.of(context)
                              .loadString('assets/map_styles/dark.json'),
                        );
                      }

                      final Uint8List customMarker = await getBytesFromAsset(
                        path: 'assets/marker.png', //paste the custom image path
                        width: 50, // size of custom image as marker
                      );
                      _markers.value.add(
                        Marker(
                          markerId: const MarkerId('id-1'),
                          position: const LatLng(33.5246509, 36.2852715),
                          icon: BitmapDescriptor.fromBytes(customMarker),
                        ),
                      );
                    },
                    markers: markers,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(33.5246509, 36.2852715),
                      zoom: 100,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
