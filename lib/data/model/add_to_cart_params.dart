class AddToCartParams {
  AddToCartParams(
      {required this.product_id,
      required this.color,
      required this.size,
      this.qty=0
      });

  final int product_id;
  final String color;
  final String size;
  final int qty;

  Map<String, dynamic> toJson() =>
      {"product_id": product_id, "color": color, "size": color, "qty": qty};
}
