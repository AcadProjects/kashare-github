import 'package:latlong2/latlong.dart';

class MapMarker {
  final String? image;
  final String? title;
  final String? address;
  final LatLng? location;
  final int? rating;

  MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.location,
    required this.rating,
  });
}

final mapMarkers = [
  MapMarker(
      image: 'assets/images/restaurant_1.jpg',
      title: 'Marker 1',
      address: 'Marker 1 Address',
      location: LatLng(14.29633, 120.988607),
      rating: 4),
  MapMarker(
      image: 'assets/images/restaurant_2.jpg',
      title: 'Marker 2',
      address: 'Marker 2 Address',
      location: LatLng(14.29622, 121.988537),
      rating: 5),
  MapMarker(
      image: 'assets/images/restaurant_3.jpg',
      title: 'Marker 3',
      address: 'Marker 3 Address',
      location: LatLng(14.233622, 121.03233438605),
      rating: 2),
  MapMarker(
      image: 'assets/images/restaurant_4.jpg',
      title: 'Marker 4',
      address: 'Marker 4 Address',
      location: LatLng(14.29633, 121.032138605),
      rating: 3),
  MapMarker(
    image: 'assets/images/restaurant_5.jpg',
    title: 'Marker 5',
    address: 'Marker 5 Address',
    location: LatLng(14.29633, 120.98860437),
    rating: 4,
  ),
];
