import 'package:flutter/foundation.dart';
import 'models/coffee.dart';
import 'theme.dart';

/// بيانات تجريبية للمنتجات
const List<Coffee> kCoffees = [
  Coffee(name: 'Arabica', price: 18, image: AppAssets.arabica),
  Coffee(name: 'Robusta', price: 20, image: AppAssets.robusta, extra: 'With Milk'),
  Coffee(name: 'Excelsa', price: 15, image: AppAssets.excelsa),
  Coffee(name: 'Liberica', price: 12, image: AppAssets.liberica, extra: 'With water'),
  Coffee(name: 'Cirtus', price: 12, image: AppAssets.cirtus, extra: 'With Lemon'),
];

/// السلة (Singleton بسيط بدون packages). لو المشروع كبر استخدم Provider أو Riverpod.
class CartState extends ChangeNotifier {
  CartState._();
  static final CartState instance = CartState._();

  final List<CartItem> items = [
    CartItem(kCoffees[1]),
    CartItem(kCoffees[3]),
    CartItem(kCoffees[4]),
  ];

  int get subTotal =>
      items.fold(0, (sum, i) => sum + i.coffee.price * i.qty);
  int get shipping => items.isEmpty ? 0 : 6;
  int get total => subTotal + shipping;

  void add(Coffee c) {
    final i = items.indexWhere((e) => e.coffee.name == c.name);
    if (i >= 0) {
      items[i].qty++;
    } else {
      items.add(CartItem(c));
    }
    notifyListeners();
  }

  void increase(CartItem item) {
    item.qty++;
    notifyListeners();
  }

  void decrease(CartItem item) {
    if (item.qty > 1) {
      item.qty--;
      notifyListeners();
    }
  }

  void remove(CartItem item) {
    items.remove(item);
    notifyListeners();
  }
}
