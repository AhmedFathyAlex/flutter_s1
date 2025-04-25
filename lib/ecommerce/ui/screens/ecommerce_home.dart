import 'package:flutter/material.dart';
import 'package:flutter_s1/ecommerce/data/product_model.dart';
import 'package:flutter_s1/ecommerce/data/product_service.dart';

class EcommerceHome extends StatefulWidget {
   EcommerceHome({super.key});

  @override
  State<EcommerceHome> createState() => _EcommerceHomeState();
}

class _EcommerceHomeState extends State<EcommerceHome> {
  late Future<List<ProductModel>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = ProductService.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(future: futureData,
         builder: (context,snapshot){
          if(snapshot.hasData){
            var products = snapshot.data;
            return ListView.builder(itemBuilder: (context,index){
              return ListTile(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(products![index].title!)));
                },
                title: Text(products![index].title!),
                subtitle: Text(products![index].desc!),
                trailing: CircleAvatar(
                  radius: 40,
                  child: Text(products[index].price.toString()),
                ),
              );
            });
          }else if(snapshot.hasError){
            return Text('Error');
          }else{
            return CircularProgressIndicator();
          }
         })
      )
    );
  }

  // _fetchData() async{
  //  data = await ProductService.fetchData();
  //  setState(() {
     
  //  });
  // }
}