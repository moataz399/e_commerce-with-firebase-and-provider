
class ApiPath{

  static  String  products ()=> "products";
  static  String  users (String uId)=> "users/$uId";
  static  String  AddToCart (String uId,String documentId) => "users/$uId/cart/$documentId";
}