import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/shipping_address_model.dart';

class AddShippingAddressArgs {
  final Database database;
  final ShippingAddressModel? shippingAddress;

  AddShippingAddressArgs({required this.database, this.shippingAddress});
}
