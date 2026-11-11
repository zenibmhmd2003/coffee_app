import 'package:flutter/material.dart';
import '../cart_state.dart';
import '../models/coffee.dart';
import '../theme.dart';
import '../widgets/common_widgets.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartState.instance;

    return Scaffold(
      backgroundColor: AppColors.brown,
      bottomNavigationBar: CoffeeBottomNav(
        index: 1,
        onTap: (i) {
          if (i == 0) Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: cart,
          builder: (context, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _appBar(context),
                  const SizedBox(height: 18),
                  const Text(
                    'My Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...cart.items.map((item) => _CartTile(item: item, cart: cart)),
                  const SizedBox(height: 4),
                  _summaryCard(cart),
                  const SizedBox(height: 22),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CheckoutScreen()),
                      ),
                      child: const Text(
                        'Finalize Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.chevron_left, color: AppColors.tan),
          ),
          const Text(
            'Cart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Icon(Icons.notifications_none, color: AppColors.tan, size: 20),
        ],
      ),
    );
  }

  Widget _summaryCard(CartState cart) {
    Widget row(String label, int value) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 9)),
          Text('\$$value',
              style: const TextStyle(color: Colors.white, fontSize: 9)),
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.tan,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 34,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.brownDark),
                    borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(4)),
                  ),
                  child: const Text(
                    'Enter Coupon Code here',
                    style: TextStyle(color: AppColors.brownDark, fontSize: 8),
                  ),
                ),
              ),
              Container(
                height: 34,
                width: 70,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.brownDark,
                  borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(4)),
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          row('Sub-total', cart.subTotal),
          row('Shipping', cart.shipping),
          row('Total', cart.total),
        ],
      ),
    );
  }
}

/// عنصر في السلة: اسحبه شمال تظهر سلة المهملات، اسحبه يمين يرجع.
class _CartTile extends StatefulWidget {
  final CartItem item;
  final CartState cart;
  const _CartTile({required this.item, required this.cart});

  @override
  State<_CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<_CartTile> {
  static const double _revealWidth = 48; // عرض المساحة اللي بتظهر فيها السلة
  double _offset = 0; // 0 = مقفول، -_revealWidth = مفتوح
  bool _dragging = false;

  void _onDragUpdate(DragUpdateDetails d) {
    setState(() {
      _dragging = true;
      _offset = (_offset + d.delta.dx).clamp(-_revealWidth, 0.0);
    });
  }

  void _onDragEnd(DragEndDetails d) {
    setState(() {
      _dragging = false;
      _offset = _offset < -_revealWidth / 2 ? -_revealWidth : 0;
    });
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 18,
      height: 18,
      decoration: const BoxDecoration(
        color: AppColors.brownDark,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 12),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final cart = widget.cart;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 66,
        child: Stack(
          children: [
            // سلة المهملات (ورا الكارت على اليمين)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: _revealWidth,
              child: GestureDetector(
                onTap: () => cart.remove(item),
                child: const Center(
                  child: Icon(Icons.delete_outline,
                      color: Colors.white, size: 20),
                ),
              ),
            ),
            // الكارت نفسه
            AnimatedPositioned(
              duration: _dragging
                  ? Duration.zero
                  : const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              left: _offset,
              right: -_offset,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onHorizontalDragUpdate: _onDragUpdate,
                onHorizontalDragEnd: _onDragEnd,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.tan,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Image.asset(item.coffee.image, width: 44, height: 44),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.coffee.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '\$${item.coffee.price}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      _qtyBtn(Icons.remove, () => cart.decrease(item)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '${item.qty}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 11),
                        ),
                      ),
                      _qtyBtn(Icons.add, () => cart.increase(item)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}