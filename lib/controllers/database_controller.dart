import 'package:e_commerce/services/firestore_services.dart';
import 'package:e_commerce/utils/constants/api_path.dart';

import '../models/product_model.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();

  Stream<List<Product>> newProductsStream();
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
}
