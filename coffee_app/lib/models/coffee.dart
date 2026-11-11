class Coffee {
  final String name;
  final int price;
  final String image;
  final String extra; // "With Milk", "With water"...

  const Coffee({
    required this.name,
    required this.price,
    required this.image,
    this.extra = '',
  });
}

class CartItem {
  final Coffee coffee;
  int qty;
  CartItem(this.coffee, {this.qty = 1});
}
