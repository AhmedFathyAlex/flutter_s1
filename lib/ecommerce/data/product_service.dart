import 'dart:convert';

import 'package:flutter_s1/ecommerce/data/product_model.dart';
import 'package:http/http.dart' as http;
class ProductService{
  
 static Future<List<ProductModel>> fetchData() async{

  List<ProductModel> products  =[];
 
   await Future.delayed(Duration(seconds: 3));
   var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
   var decodedResponse =  jsonDecode(response.body);
   for (var map in decodedResponse) {

      var model = ProductModel.fromJson(map);
      products.add(model);
   }
  return products;
  }


}