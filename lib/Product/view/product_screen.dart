import 'package:fakestore_apicall/Product/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductProvider? productProviderT;
  ProductProvider? productProviderF;

  Future<void> getdata() async {
    await Provider.of<ProductProvider>(context, listen: false).apihelper();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    productProviderT = Provider.of<ProductProvider>(context, listen: true);
    productProviderF = Provider.of<ProductProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Products",
                  style: GoogleFonts.dancingScript(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold)),
              centerTitle: true,
              backgroundColor: Colors.purple,
            ),
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 2,
              ),
              shrinkWrap: true,
              itemCount: productProviderT!.productapiList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                          "${productProviderT!.productapiList[index].image}",
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${productProviderT!.productapiList[index].ratobj!.rate}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          // margin: EdgeInsets.only(left: 10,right: 10),
                          decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10),
                                  left: Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${productProviderT!.productapiList[index].category}",
                                  style: const TextStyle(
                                      color: Colors.white, letterSpacing: 1),
                                ),
                                Text(
                                  "${productProviderT!.productapiList[index].price}",
                                  style: const TextStyle(
                                      color: Colors.white, letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}
