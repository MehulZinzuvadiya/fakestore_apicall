import 'package:fakestore_apicall/Utils/api_helper.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {
  List<dynamic> productapiList = [];

  Future<void> apihelper() async {
    ApiHelper a1 = ApiHelper();
    productapiList = await a1.Apicall() as List;
  }
}
