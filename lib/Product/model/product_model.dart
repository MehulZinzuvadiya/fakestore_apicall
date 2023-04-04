import 'dart:ffi';

class ProductModel {
  String? title, description, category, image;
  double? price;
  rating? ratobj;
  int? id;

  ProductModel({this.id,
    this.title,
    this.description,
    this.category,
    this.image,
    this.price,
    this.ratobj});

  ProductModel productModelfactory(Map m1) {
    id = m1['id'];
    title = m1['title'];
    description = m1['description'];
    category = m1['category'];
    image = m1['image'];
    price = m1['price']==null?0.0:m1['price'].toDouble();
    ratobj = rating().ratingfromjson(m1['rating']);

    ProductModel pm1 = ProductModel(
      id: id,
      description: description,
      title: title,
      image: image,
      category: category,
      price: price,
      ratobj: ratobj,
    );
    return pm1;
  }
}

class rating {
  double? rate;
  int? count;

  rating({this.rate, this.count});

  rating ratingfromjson(Map m1) {

    rate = m1['rate']==null?0.0:m1['rate'].toDouble();
    count = m1['count'];

    rating r1 = rating(
      rate: rate,
      count: count,
    );
    return r1;
  }
}
