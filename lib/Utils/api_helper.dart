import 'dart:convert';

import 'package:fakestore_apicall/Product/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<List> Apicall() async {
    List<dynamic> productjsonList = [];

    String apilink = "https://fakestoreapi.com/products";
    Uri url = Uri.parse(apilink);
    var response = await http.get(url);
    var json = jsonDecode(response.body);

    productjsonList =
        json.map((e) => ProductModel().productModelfactory(e)).toList();
    return productjsonList;
  }
}
