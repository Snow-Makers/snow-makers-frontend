// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:snowmakers/core/utilities/extensions.dart';
import 'package:snowmakers/generated/locale_keys.g.dart';

class MapView extends StatefulWidget {
  final void Function(PickedData pickedData) onPicked;
  final IconData zoomInIcon;
  final IconData zoomOutIcon;
  final IconData currentLocationIcon;
  final IconData locationPinIcon;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color locationPinIconColor;
  final String locationPinText;
  final TextStyle locationPinTextStyle;
  final String buttonText;
  final String hintText;
  final double buttonHeight;
  final double buttonWidth;
  final TextStyle buttonTextStyle;
  final String baseUri;
  final bool showSearch;
  final bool showConfirm;
  final bool showPickCurrentLocation;
  final double? lat;
  final double? long;

  const MapView({
    super.key,
    required this.onPicked,
    this.zoomOutIcon = Icons.zoom_out_map,
    this.zoomInIcon = Icons.zoom_in_map,
    this.currentLocationIcon = Icons.my_location,
    this.buttonColor = Colors.blue,
    this.locationPinIconColor = Colors.blue,
    this.locationPinText = 'Location',
    this.locationPinTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
    this.hintText = 'Search',
    this.buttonTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.buttonTextColor = Colors.white,
    this.buttonText = 'Set Current Location',
    this.buttonHeight = 50,
    this.buttonWidth = 200,
    this.baseUri = 'https://nominatim.openstreetmap.org',
    this.locationPinIcon = Icons.location_on,
    this.showConfirm = true,
    this.showPickCurrentLocation = true,
    this.showSearch = true,
    this.long,
    this.lat,
  });

  @override
  State<MapView> createState() => _OpenStreetMapSearchAndPickState();
}

class _OpenStreetMapSearchAndPickState extends State<MapView> {
  MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<OSMdata> _options = <OSMdata>[];
  Timer? _debounce;
  Map<String, String> headers = {'accept-language': 'en'};

  var client = http.Client();
  late Future<Position?> latlongFuture;

  Future<Position?> getCurrentPosLatLong() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();

    /// do not have location permission
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      return await getPosition(locationPermission);
    }

    /// have location permission
    final position = await Geolocator.getCurrentPosition();
    setNameCurrentPosAtInit(position.latitude, position.longitude);
    return position;
  }

  Future<Position?> getPosition(LocationPermission locationPermission) async {
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      return null;
    }
    final position = await Geolocator.getCurrentPosition();
    setNameCurrentPosAtInit(position.latitude, position.longitude);
    return position;
  }

  void setNameCurrentPos() async {
    final latitude = _mapController.camera.center.latitude;
    final longitude = _mapController.camera.center.longitude;
    if (kDebugMode) {
      print(latitude);
    }
    if (kDebugMode) {
      print(longitude);
    }

    final url =
        '${widget.baseUri}/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';

    final response = await client.get(Uri.parse(url), headers: headers);
    final decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;

    _searchController.text = decodedResponse['display_name'] as String;
    setState(() {});
  }

  Future<void> setNameCurrentPosAtInit(
      double latitude, double longitude) async {
    if (kDebugMode) {
      print(latitude);
    }
    if (kDebugMode) {
      print(longitude);
    }

    final url =
        '${widget.baseUri}/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';

    final response = await client.get(Uri.parse(url), headers: headers);
    // var response = await client.post(Uri.parse(url));
    final decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;

    _searchController.text = decodedResponse['display_name'] as String;
  }

  @override
  void initState() {
    _mapController = MapController();

    _mapController.mapEventStream.listen(
      (event) async {
        if (event is MapEventMoveEnd) {
          final client = http.Client();
          String url =
              '${widget.baseUri}/reverse?format=json&lat=${event.camera.center.latitude}&lon=${event.camera.center.longitude}&zoom=18&addressdetails=1';

          final response = await client.get(Uri.parse(url), headers: headers);
          // var response = await client.post(Uri.parse(url));
          final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes))
              as Map<dynamic, dynamic>;

          _searchController.text = decodedResponse['display_name'] as String;
          setState(() {});
        }
      },
    );

    latlongFuture = getCurrentPosLatLong();

    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: widget.buttonColor),
    );
    return FutureBuilder<Position?>(
      future: latlongFuture,
      builder: (context, snapshot) {
        LatLng? mapCentre;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        }

        if (widget.lat != null && widget.long != null) {
          mapCentre = LatLng(widget.lat!, widget.long!);
        } else if (snapshot.hasData && snapshot.data != null) {
          mapCentre = LatLng(snapshot.data!.latitude, snapshot.data!.longitude);
        }
        return SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Positioned.fill(
                child: FlutterMap(
                  options: MapOptions(
                      initialCenter: mapCentre ?? const LatLng(0, 0),
                      initialZoom: 15.0,
                      maxZoom: 18,
                      minZoom: 6),
                  mapController: _mapController,
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                      // attributionBuilder: (_) {
                      //   return Text("© OpenStreetMap contributors");
                      // },
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Icon(
                        widget.locationPinIcon,
                        size: 50,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.showPickCurrentLocation)
                Positioned(
                  right: 16.w,
                  bottom: 100.h,
                  child: GestureDetector(
                    onTap: () {
                      if (mapCentre != null) {
                        _mapController.move(
                          LatLng(mapCentre.latitude, mapCentre.longitude),
                          _mapController.camera.zoom,
                        );
                      } else {
                        _mapController.move(
                          const LatLng(50.5, 30.51),
                          _mapController.camera.zoom,
                        );
                      }
                      setNameCurrentPos();
                    },
                    child: CircleAvatar(
                      backgroundColor: context.appTheme.white,
                      radius: 25.r,
                      child: const Icon(
                        Icons.my_location_rounded,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      if (widget.showSearch)
                        TextFormField(
                          controller: _searchController,
                          focusNode: _focusNode,
                          style: context.appTextStyles.bodyMedium.copyWith(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: widget.hintText,
                            border: inputBorder,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.search,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: context
                                .theme.inputDecorationTheme.focusedBorder,
                          ),
                          onChanged: (String value) {
                            if (_debounce?.isActive ?? false) {
                              _debounce?.cancel();
                            }

                            _debounce = Timer(
                                const Duration(milliseconds: 1000), () async {
                              if (kDebugMode) {
                                print(value);
                              }
                              var client = http.Client();
                              try {
                                String url =
                                    '${widget.baseUri}/search?q=$value&format=json&polygon_geojson=1&addressdetails=1';
                                if (kDebugMode) {
                                  print(url);
                                }
                                var response = await client.get(Uri.parse(url),
                                    headers: headers);
                                // var response = await client.post(Uri.parse(url));
                                var decodedResponse =
                                    jsonDecode(utf8.decode(response.bodyBytes))
                                        as List<dynamic>;
                                if (kDebugMode) {
                                  print(decodedResponse);
                                }
                                _options = decodedResponse
                                    .map(
                                      (e) => OSMdata(
                                        displayname:
                                            e['display_name'] as String,
                                        lat: double.parse(e['lat'] as String),
                                        lon: double.parse(e['lon'] as String),
                                      ),
                                    )
                                    .toList();
                                setState(() {});
                              } finally {
                                client.close();
                              }

                              setState(() {});
                            });
                          },
                        ),
                      if (widget.showSearch && _options.isNotEmpty)
                        StatefulBuilder(
                          builder: (context, setState) {
                            return ColoredBox(
                              color: Colors.white,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    _options.length > 5 ? 5 : _options.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      _options[index].displayname,
                                      style: context.appTextStyles.bodyMedium
                                          .copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    onTap: () {
                                      _mapController.move(
                                        LatLng(
                                          _options[index].lat,
                                          _options[index].lon,
                                        ),
                                        15.0,
                                      );

                                      _focusNode.unfocus();
                                      _options.clear();
                                      setState(() {});
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
              if (widget.showConfirm)
                Positioned(
                  bottom: 20.h,
                  left: 16.w,
                  right: 16.w,
                  child: ElevatedButton(
                    onPressed: () async {
                      final value = await pickData();
                      widget.onPicked(value);
                    },
                    child: Text(LocaleKeys.mapView_confirm.tr()),
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  Future<PickedData> pickData() async {
    final center = LatLong(_mapController.camera.center.latitude,
        _mapController.camera.center.longitude);
    final client = http.Client();
    final url =
        '${widget.baseUri}/reverse?format=json&lat=${_mapController.camera.center.latitude}&lon=${_mapController.camera.center.longitude}&zoom=18&addressdetails=1';

    final response = await client.get(
      Uri.parse(url),
      headers: headers,
    );
    // var response = await client.post(Uri.parse(url));
    final decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;
    final displayName = decodedResponse['display_name'] as String;
    final location = (decodedResponse["address"]["city"] ??
        decodedResponse["address"]["town"]) as String;

    return PickedData(center, displayName,
        decodedResponse["address"] as Map<String, dynamic>, location);
  }
}

class OSMdata {
  final String displayname;
  final double lat;
  final double lon;

  OSMdata({required this.displayname, required this.lat, required this.lon});

  @override
  String toString() {
    return '$displayname, $lat, $lon';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is OSMdata && other.displayname == displayname;
  }

  @override
  int get hashCode => Object.hash(displayname, lat, lon);
}

class LatLong {
  final double latitude;
  final double longitude;

  const LatLong(this.latitude, this.longitude);
}

class PickedData {
  final LatLong latLong;
  final String addressName;
  final String location;
  final Map<String, dynamic> address;

  PickedData(this.latLong, this.addressName, this.address, this.location);
}
