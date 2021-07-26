import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hoop_seek/screens/components/forms-components.dart';
import 'package:hoop_seek/utils/constants.dart';
import 'package:hoop_seek/screens/components/match-components.dart';
import 'package:hoop_seek/utils/size_helpers.dart';
import 'package:hoop_seek/utils/themes.dart';

final double visiblePinPillPosition = 120;
final double invisiblePinPillPosition = -220;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String search = '';
  Set<Marker> _markers = {};
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(37.77, -122.43), zoom: 13.5);

  var _googleMapController;
  late BitmapDescriptor mapMarker;

  double _pinPillPosition = invisiblePinPillPosition;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/marker.png');
    print('hello');
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(
        BrandTheme.isLight ? Utils.lightMapStyle : Utils.darkMapStyle);
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(37.77, -122.43),
          icon: mapMarker,
          onTap: () {
            setState(() {
              _pinPillPosition = visiblePinPillPosition;
            });
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);

    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: GoogleMap(
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            markers: _markers,
            myLocationButtonEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onTap: (LatLng loc) {
              setState(() {
                _pinPillPosition = invisiblePinPillPosition;
              });
            },
          ),
        ),
        MatchQuickView(
          pinPillPosition: _pinPillPosition,
        ),
        Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Map Match'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: kTitleTextStyle,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CustomButton(
                    label: '+Create match',
                    onPressed: () {},
                  ),
                )
              ],
            )),
        Positioned(
            bottom: -20,
            left: 0,
            right: 0,
            child: Padding(
                padding: EdgeInsets.fromLTRB(
                    sizer.sx(kPadding), 0, sizer.sx(kPadding), 0),
                child: WidgetBackground(
                    child: Container(
                  height: sizer.sx(0.85),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextField(
                          label: 'Search for match at location',
                          hintText: 'Search Court',
                          suffixIcon: Icon(Icons.search),
                          onChanged: (val) {
                            setState(() => search = val.trim());
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Email cannot be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  index == 0
                                      ? Column(
                                          children: [
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                    'matches'.toUpperCase())),
                                            SizedBox(
                                                height: sizer.sx(kPadding)),
                                          ],
                                        )
                                      : SizedBox(),
                                  MatchInfo(
                                    active: true,
                                  ),
                                  Divider(),
                                  SizedBox(height: sizer.sx(kPadding))
                                ],
                              );
                            })
                      ],
                    ),
                  ),
                ))))
      ]),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () => _googleMapController.animateCamera(
      //         CameraUpdate.newCameraPosition(_initialCameraPosition)),
      //     child: const Icon(Icons.center_focus_strong_rounded)),
    );
  }
}

class Utils {
  static String darkMapStyle = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#181818"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1b1b1b"
      }
    ]
  },
  {
    "featureType": "poi.sports_complex",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2c2c2c"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8a8a8a"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#373737"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3c3c3c"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#4e4e4e"
      }
    ]
  },
  {
    "featureType": "road.local",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3d3d3d"
      }
    ]
  }
]''';

  static String lightMapStyle = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "poi.sports_complex",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
}
