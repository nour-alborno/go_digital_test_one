class Category {
  String? name;
  List<ProductModel>? products;

  Category(Map map){
    name = map["name"];

     List<Map<String,dynamic>> productsMaps = map['products'];

     products = productsMaps.map((e) {
       print(e);
       return ProductModel(e);
     }).toList();


     print(products?[0] ?? "error");


  }
}

class ProductModel {
  String? image;
  int? id;
  String? name;
  double? price;
  ProductModel(Map map){
    image = map["image"];
    id=map["id"];
    name = map["name"];
    price = map['price'];

    print(price);
  }
}