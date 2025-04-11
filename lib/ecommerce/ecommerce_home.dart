import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EcommerceHome extends StatelessWidget {
  const EcommerceHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed:_fetchData,
         child: Text('Get Data')),
      ),
    );
  }

  _fetchData() async{
   var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
  //  log(response.body);
   var decodedResponse =  jsonDecode(response.body);
   log((decodedResponse as List)[0].toString());
  }
}