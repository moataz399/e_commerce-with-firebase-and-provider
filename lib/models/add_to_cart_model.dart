class AddToCartModel {
  final String id;

  final String productId;
  final String title;
  final String imgUrl;
  final String color;
  final String size;
  final int quantity;
  final int price;
  final int? discountValue;

  AddToCartModel({
    required this.id,
    required this.productId,
    required this.title,
    required this.imgUrl,
     this.color="Black",
    required this.size,
    this.quantity = 1,
    required this.price,
    this.discountValue = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'discountValue': discountValue,
      'color': color,
      'size': size,
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map, String documentId) {
    return AddToCartModel(
      id: documentId,
      title: map['title'] as String ?? "",
      productId: map['productId'] as String ?? "",
      price: map['price'] as int ?? 0,
      imgUrl: map['imgUrl'] as String ?? "",
      discountValue: map['discountValue']?.toInt() ?? 0,
      size: map['size'] as String ?? "",
      color: map['color'] as String ?? "",
      quantity: map['quantity'] as int ?? 0,
    );
  }
}
