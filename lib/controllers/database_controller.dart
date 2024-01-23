import 'package:e_commerce/models/add_to_cart_model.dart';
import 'package:e_commerce/models/delivery_method.dart';
import 'package:e_commerce/models/fav_model.dart';
import 'package:e_commerce/models/shipping_address_model.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/services/firestore_services.dart';
import 'package:e_commerce/utils/constants/api_path.dart';

import '../models/product_model.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();

  Stream<List<AddToCartModel>> myProductsCart();

  Stream<List<Product>> myFavProducts();

  Stream<List<Product>> newProductsStream();

  Stream<List<DeliveryMethodModel>> deliveryMethods();

  Stream<List<ShippingAddressModel>> getShippingAddresses();

  Future<void> setUserData(UserData userData);

  Future<void> saveAddress(ShippingAddressModel shippingAddressModel);

  Future<void> deleteItem(AddToCartModel model);

  Future<void> deleteFavItem(Product model);

  Future<void> addToCart(AddToCartModel model);

  Future<void> addToFav(Product model);
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
        path: ApiPath.addToCart(uId, addToCartModel.id),
        data: addToCartModel.toMap());
  }

  @override
  Stream<List<AddToCartModel>> myProductsCart() {
    return _service.collectionStream(
        path: ApiPath.myCart(uId: uId),
        builder: (data, documentId) =>
            AddToCartModel.fromMap(data!, documentId));
  }

  @override
  Stream<List<DeliveryMethodModel>> deliveryMethods() {
    return _service.collectionStream(
        path: ApiPath.deliveryMethods(),
        builder: (data, documentId) =>
            DeliveryMethodModel.fromMap(data!, documentId));
  }

  @override
  Stream<List<ShippingAddressModel>> getShippingAddresses() {
    return _service.collectionStream(
        path: ApiPath.userShippingAddress(uId),
        builder: (data, documentId) =>
            ShippingAddressModel.fromMap(data!, documentId));
  }

  @override
  Future<void> saveAddress(ShippingAddressModel address) async {
    return await _service.setData(
        path: ApiPath.newAddress(uId, address.id), data: address.toMap());
  }

  @override
  Future<void> deleteItem(AddToCartModel model) async {
    return await _service.deleteData(
        path: ApiPath.deleteCartItem(uId, model.id));
  }

  @override
  Future<void> addToFav(Product model) async {
    return await _service.setData(
        path: ApiPath.addToFav(uId, model.id), data: model.toMap());
  }

  @override
  Stream<List<Product>> myFavProducts() {
    return _service.collectionStream(
        path: ApiPath.myFav(uId: uId),
        builder: (data, documentId) => Product.fromMap(data!, documentId));
  }

  @override
  Future<void> deleteFavItem(Product model) async {
    await _service.deleteData(path: ApiPath.deleteFavItem(uId, model.id));
  }
}
