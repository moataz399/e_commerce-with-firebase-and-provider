import 'package:e_commerce/models/add_to_cart_model.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/services/firestore_services.dart';
import 'package:e_commerce/utils/constants/api_path.dart';

import '../models/product_model.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();

  Stream<List<Product>> newProductsStream();

  Future<void> setUserData(UserData userData);

  Future<void> addToCart(AddToCartModel model);
}

class FireStoreDatabase implements Database {
  final _service = FireStoreServices.instance;
  final String uId;

  FireStoreDatabase(this.uId);

  @override
  Stream<List<Product>> salesProductsStream() {
    return _service.collectionStream(
        path: ApiPath.products(),
        builder: (data, documentId) => Product.fromMap(data!, documentId),
        queryBuilder: (query) => query.where("discountValue", isNotEqualTo: 0));
  }

  @override
  Stream<List<Product>> newProductsStream() {
    return _service.collectionStream(
        path: ApiPath.products(),
        queryBuilder: (query) => query.where("discountValue", isEqualTo: 0),
        builder: (data, documentId) => Product.fromMap(data!, documentId));
  }

  @override
  Future<void> setUserData(UserData userData) async {
    return await _service.setData(
        path: ApiPath.users(userData.uId), data: userData.toMap());
  }

  @override
  Future<void> addToCart(AddToCartModel addToCartModel) async {
    return _service.setData(
        path: ApiPath.AddToCart(uId, addToCartModel.id),
        data: addToCartModel.toMap());
  }
}
