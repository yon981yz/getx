import 'dart:typed_data';

class Address {
  final int? id;
  final String name;
  final String phone;
  final String estimate;
  final double lat;
  final double lng;
  final Uint8List? image;

  Address({
    this.id,
    required this.name,
    required this.phone,
    required this.estimate,
    required this.lat,
    required this.lng,
    this.image,
  });

  Address.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        phone = res['phone'],
        estimate = res['estimate'],
        lat = res['lat'],
        lng = res['lng'],
        image = res['image'];
}
