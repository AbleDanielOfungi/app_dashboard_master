class NewProduct {
  String title;
  String image;
  String price;
  String per;
  String category;

  NewProduct({
    required this.title,
    required this.image,
    required this.price,
    required this.per,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "price": price,
    "per": per,
    "category": category,
  };
}
