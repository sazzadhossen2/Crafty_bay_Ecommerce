/// msg : "success"
/// data : [{"id":839,"user_id":205,"product_id":1,"color":"Red","size":"X","qty":"5","price":"470000","created_at":"2024-02-15T07:42:07.000000Z","updated_at":"2024-02-15T07:42:07.000000Z","product":{"id":1,"title":"MacBook Air M1 8/256GB","short_des":"MacBook Air M1 8/256GB 13-inch Space Gray","price":"94000","discount":0,"discount_price":"0","image":"https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg","stock":1,"star":80,"remark":"new","category_id":1,"brand_id":1,"created_at":"2023-08-15T08:24:06.000000Z","updated_at":"2023-09-09T17:07:51.000000Z"}},{"id":861,"user_id":205,"product_id":9,"color":"Green","size":"2X","qty":"0","price":"0","created_at":"2024-02-17T12:52:00.000000Z","updated_at":"2024-02-17T12:52:00.000000Z","product":{"id":9,"title":"MacBook Air M1 8/256GB","short_des":"MacBook Air M1 8/256GB 13-inch Space Gray","price":"94000","discount":0,"discount_price":"0","image":"https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg","stock":1,"star":80,"remark":"popular","category_id":1,"brand_id":1,"created_at":"2023-08-15T08:24:06.000000Z","updated_at":"2023-09-09T17:07:51.000000Z"}}]

class CartListModel {
  CartListModel({
    String? msg,
    List<CartItemList>? cartItems,
  }) {
    _msg = msg;
    _data = cartItems;
  }

  CartListModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CartItemList.fromJson(v));
      });
    }
  }

  String? _msg;
  List<CartItemList>? _data;

  CartListModel copyWith({
    String? msg,
    List<CartItemList>? data,
  }) =>
      CartListModel(
        msg: msg ?? _msg,
        cartItems: data ?? _data,
      );

  String? get msg => _msg;

  List<CartItemList>? get cartItems => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 839
/// user_id : 205
/// product_id : 1
/// color : "Red"
/// size : "X"
/// qty : "5"
/// price : "470000"
/// created_at : "2024-02-15T07:42:07.000000Z"
/// updated_at : "2024-02-15T07:42:07.000000Z"
/// product : {"id":1,"title":"MacBook Air M1 8/256GB","short_des":"MacBook Air M1 8/256GB 13-inch Space Gray","price":"94000","discount":0,"discount_price":"0","image":"https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg","stock":1,"star":80,"remark":"new","category_id":1,"brand_id":1,"created_at":"2023-08-15T08:24:06.000000Z","updated_at":"2023-09-09T17:07:51.000000Z"}

class CartItemList {
  CartItemList({
    num? id,
    num? userId,
    int? productId,
    String? color,
    String? size,
    int? qty,
    String? price,
    String? createdAt,
    String? updatedAt,
    Product? product,
   // int quantity = 1,
  }) {
    _id = id;
    _userId = userId;
    _productId = productId;
    _color = color;
    _size = size;
    _qty = qty;
    _price = price;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _product = product;
  }

  CartItemList.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _color = json['color'];
    _size = json['size'];
    _qty = json['qty'];
    _price = json['price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  num? _id;
  num? _userId;
  int? _productId;
  String? _color;
  String? _size;
  int? _qty;
  String? _price;
  String? _createdAt;
  String? _updatedAt;
  Product? _product;


  CartItemList copyWith({
    num? id,
    num? userId,
    int? productId,
    String? color,
    String? size,
    int? qty,
    String? price,
    String? createdAt,
    String? updatedAt,
    Product? product,
  }) =>
      CartItemList(
        id: id ?? _id,
        userId: userId ?? _userId,
        productId: productId ?? _productId,
        color: color ?? _color,
        size: size ?? _size,
        qty: qty ?? _qty,
        price: price ?? _price,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        product: product ?? _product,
      );
  num get quantity =>quantity;
  num? get id => _id;

  num? get userId => _userId;

  int? get productId => _productId;

  String? get color => _color;

  String? get size => _size;
  int? get qty => _qty;

  String? get price => _price;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['color'] = _color;
    map['size'] = _size;
    map['qty'] = _qty;
    map['price'] = _price;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }
}

/// id : 1
/// title : "MacBook Air M1 8/256GB"
/// short_des : "MacBook Air M1 8/256GB 13-inch Space Gray"
/// price : "94000"
/// discount : 0
/// discount_price : "0"
/// image : "https://photo.teamrabbil.com/images/2023/09/09/product1.jpeg"
/// stock : 1
/// star : 80
/// remark : "new"
/// category_id : 1
/// brand_id : 1
/// created_at : "2023-08-15T08:24:06.000000Z"
/// updated_at : "2023-09-09T17:07:51.000000Z"

class Product {
  Product({
    num? id,
    String? title,
    String? shortDes,
    String? price,
    num? discount,
    String? discountPrice,
    String? image,
    num? stock,
    num? star,
    String? remark,
    num? categoryId,
    num? brandId,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _title = title;
    _shortDes = shortDes;
    _price = price;
    _discount = discount;
    _discountPrice = discountPrice;
    _image = image;
    _stock = stock;
    _star = star;
    _remark = remark;
    _categoryId = categoryId;
    _brandId = brandId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _shortDes = json['short_des'];
    _price = json['price'];
    _discount = json['discount'];
    _discountPrice = json['discount_price'];
    _image = json['image'];
    _stock = json['stock'];
    _star = json['star'];
    _remark = json['remark'];
    _categoryId = json['category_id'];
    _brandId = json['brand_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _title;
  String? _shortDes;
  String? _price;
  num? _discount;
  String? _discountPrice;
  String? _image;
  num? _stock;
  num? _star;
  String? _remark;
  num? _categoryId;
  num? _brandId;
  String? _createdAt;
  String? _updatedAt;

  Product copyWith({
    num? id,
    String? title,
    String? shortDes,
    String? price,
    num? discount,
    String? discountPrice,
    String? image,
    num? stock,
    num? star,
    String? remark,
    num? categoryId,
    num? brandId,
    String? createdAt,
    String? updatedAt,
  }) =>
      Product(
        id: id ?? _id,
        title: title ?? _title,
        shortDes: shortDes ?? _shortDes,
        price: price ?? _price,
        discount: discount ?? _discount,
        discountPrice: discountPrice ?? _discountPrice,
        image: image ?? _image,
        stock: stock ?? _stock,
        star: star ?? _star,
        remark: remark ?? _remark,
        categoryId: categoryId ?? _categoryId,
        brandId: brandId ?? _brandId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get title => _title;

  String? get shortDes => _shortDes;

  String? get price => _price;

  num? get discount => _discount;

  String? get discountPrice => _discountPrice;

  String? get image => _image;

  num? get stock => _stock;

  num? get star => _star;

  String? get remark => _remark;

  num? get categoryId => _categoryId;

  num? get brandId => _brandId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['short_des'] = _shortDes;
    map['price'] = _price;
    map['discount'] = _discount;
    map['discount_price'] = _discountPrice;
    map['image'] = _image;
    map['stock'] = _stock;
    map['star'] = _star;
    map['remark'] = _remark;
    map['category_id'] = _categoryId;
    map['brand_id'] = _brandId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
