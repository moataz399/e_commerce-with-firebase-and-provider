import '../utils/constants/strings.dart';

class Product {
  final String id;
  final String title;
  final String imgUrl;
  final String category;
  final int price;
  final int? discountValue;
  final int? rate;

  Product(
      {required this.id,
      required this.title,
      required this.imgUrl,
      this.category = "other",
      required this.price,
      this.discountValue,
      this.rate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'discountValue': discountValue,
      'category': category,
      'rate': rate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      title: map['title'] as String,
      price: map['price'] as int,
      imgUrl: map['imgUrl'] as String,
      discountValue: map['discountValue'] as int,
      category: map['category'] as String,
      rate: map['rate'] as int,
    );
  }
}

List<Product> dummyProducts = [
  Product(
      id: "1",
      title: "T-shirt",
      imgUrl: AppStrings.image,
      discountValue: 20,
      rate: 5,
      price: 300),
  Product(
      id: "1",
      title: "T-shirt",
      imgUrl:
          "https://assets.hermes.com/is/image/hermesproduct/h-embroidered-t-shirt--072025HA01-worn-1-0-0-800-800_g.jpg",
      discountValue: 20,
      rate: 5,
      price: 300),
  Product(
      id: "1",
      title: "T-shirt",
      imgUrl: AppStrings.image,
      discountValue: 20,
      rate: 5,
      price: 300),
  Product(
      id: "1",
      title: "T-shirt",
      imgUrl: AppStrings.image,
      discountValue: 20,
      rate: 5,
      price: 300),
  Product(
      id: "1",
      title: "T-shirt",
      imgUrl: AppStrings.image,
      discountValue: 20,
      rate: 5,
      price: 300),
  Product(
      id: "1",
      title: "T-shirt",
      imgUrl:
          "https://assets.hermes.com/is/image/hermesproduct/h-embroidered-t-shirt--072025HA01-worn-1-0-0-800-800_g.jpg",
      discountValue: 20,
      rate: 5,
      price: 300)
];
