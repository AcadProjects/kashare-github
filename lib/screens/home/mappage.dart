import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:kashare/constants/map_constants.dart';
import 'package:kashare/models/map_marker_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
//MarkerLayerOptions({Key? key, List<Marker> markers = const [], dynamic rebuild})
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  final pageController = PageController();
  int selectedIndex = 0;
  var currentLocation = MapConstants.myLocation;

  late final MapController mapController;
  
  get layer => null;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 148, 63),
        automaticallyImplyLeading: false,
        title: const Text('Map'),
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              minZoom: 2,
              maxZoom: 18,
              zoom: 11,
              center: LatLng(14.7861079261, 121.032138605),
            ),
             key: layer[
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/anghelz/cla7wwzq8000k14sak5ymmdf6/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5naGVseiIsImEiOiJjbDd2anV6NHUwYzh4M3ZveHdudGQ0dHU1In0.m5vUkL5mWj1JxmojY55ZCg",
                additionalOptions: const {
                  'mapStyleId': MapConstants.mapBoxStyleId,
                  'accessToken': MapConstants.mapBoxAccessToken,
                },
              ),
              
              MarkerLayer(
                markers: [
                  for (int i = 0; i < mapMarkers.length; i++)
                    Marker(
                      height: 40,
                      width: 40,
                      point: mapMarkers[i].location ?? MapConstants.myLocation,
                      builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            pageController.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            selectedIndex = i;
                            currentLocation = mapMarkers[i].location ??
                                MapConstants.myLocation;
                            _animatedMapMove(currentLocation, 11.5);
                            setState(() {});
                          },
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 500),
                            scale: selectedIndex == i ? 1 : 0.7,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: selectedIndex == i ? 1 : 0.5,
                              child: SvgPicture.asset(
                                'assets/icons/map_marker.svg',
                             ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                selectedIndex = value;
                currentLocation =
                    mapMarkers[value].location ?? MapConstants.myLocation;
                _animatedMapMove(currentLocation, 11.5);
                setState(() {});
              },
              itemCount: mapMarkers.length,
              itemBuilder: (_, index) {
                final item = mapMarkers[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 50, 148, 63),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: item.rating,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      item.address ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item.image ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                );
              },
        
            ),
          )
        ],
      ),
    );
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    var controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }
}
