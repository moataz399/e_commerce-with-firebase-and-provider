class ApiPath {
  static String products() => "products";

  static String deliveryMethods() => "delivery_method";

  static String users(String uId) => "users/$uId";

  static String addToCart(String uId, String documentId) =>
      "users/$uId/cart/$documentId";
  static String addToFav(String uId, String documentId) =>
      "users/$uId/favorites/$documentId";
  static String deleteCartItem(String uId, String documentId) =>
      "users/$uId/cart/$documentId";
  static String deleteFavItem(String uId, String documentId) =>
      "users/$uId/favorites/$documentId";

  static String myCart({required String uId, String? docUid}) =>
      "users/$uId/cart/";
  static String myFav({required String uId, String? docUid}) =>
      "users/$uId/favorites/";

  static String userShippingAddress(String uId) =>
      "users/$uId/shipping_addresses/";

  static String newAddress(String uId, String addressId) =>
      "users/$uId/shipping_addresses/$addressId";
}
