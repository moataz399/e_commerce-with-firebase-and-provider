class DeliveryMethodModel {
  final String id;

  final String name;

  final String days;

  final String imgUrl;

  final int price;

  DeliveryMethodModel(
      {required this.id,
      required this.name,
      required this.days,
      required this.imgUrl,
      required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'days': days,
      'img_url': imgUrl,
      'price': price,
    };
  }

  factory DeliveryMethodModel.fromMap(Map<String, dynamic> map,String documentId) {
    return DeliveryMethodModel(
      id: documentId,
      name: map['name'] as String,
      days: map['days'] as String,
      imgUrl: map['img_url'] as String,
      price: map['price'] as int,
    );
  }
}
