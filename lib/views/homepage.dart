import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Homepage extends StatefulWidget {
  const Homepage ({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if(image != null) Image.network(image!), // Garantindo que a Imagem não é nula
          ElevatedButton(
            onPressed: () async {
            // vou chamar a API e mostrar os dados no console
              
              var url = "https://fakestoreapi.com/products/1";

              var response = await http.get(Uri.parse(url));
              // Uri.parse() transforma uma string no tipo URL


              var jsonResponse = convert.jsonDecode(response.body);

                setState((){
                  image = jsonResponse['image'];
                }
                );

                print(response.body);
                print(jsonResponse['title']);
                print(jsonResponse['image']);
                print(jsonResponse['description']);
                print(jsonResponse['category']);
                print(jsonResponse['price']);
                print(jsonResponse['rating']);
                print(jsonResponse['rating']['rate']);
                print(jsonResponse['rating']['count']);

                
            },
            child: const Text("Get Data"),
            )
        ],
      ),
    );
  }
}