class ProductModel {

  int? id;
  String? title;
  double? price;
  String? desc;
  String? category;
  String? imageUrl;
  double? rate;
  int? reviews;

 ProductModel({this.id, this.title , this.desc , this.price , this.category , this.imageUrl , this.rate, this.reviews});

 
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'] * 1.0;
    desc = json['description'];
    category = json['category'];
    imageUrl = json['image'];
   rate = json['rating'] != null ?   json['rating']['rate'] * 1.0 : 0;
   reviews = json['rating'] != null ?   json['rating']['count']  : 0;
  }
}