class ApiPath {
  static String products() => "products";

  static String deliveryMethods() => "delivery_method";

  static String users(String uId) => "users/$uId";

  static String addToCart(String uId, String documentId) =>
      "users/$uId/cart/$documentId";

  static String myCart(
    String uId,
  ) =>
      "users/$uId/cart/";

  static String userShippingAddress(String uId) =>
      "users/$uId/shipping_addresses/";

  static String newAddress(String uId, String addressId) =>
      "users/$uId/shipping_addresses/$addressId";
}
