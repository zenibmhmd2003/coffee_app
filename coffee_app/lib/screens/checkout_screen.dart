import 'package:flutter/material.dart';
import '../cart_state.dart';
import '../theme.dart';
import '../widgets/common_widgets.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartState.instance;

    return Scaffold(
      backgroundColor: AppColors.brown,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child:
                          const Icon(Icons.chevron_left, color: AppColors.tan),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Deliver Address',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              _addressRow(),
              const SizedBox(height: 22),
              const Text(
                'Product List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  itemCount: cart.items.length,
                  separatorBuilder: (_, __) => const Divider(
                    color: Colors.white12,
                    height: 1,
                  ),
                  itemBuilder: (context, i) {
                    final item = cart.items[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.tan,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Image.asset(item.coffee.image),
                          ),
                          const SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.coffee.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.coffee.extra,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 8),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${item.coffee.price}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              PrimaryButton(
                label: 'Continue Payment',
                color: AppColors.tan,
                textColor: AppColors.dark,
                onPressed: () {
                  // TODO: اربط صفحة الدفع هنا
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addressRow() {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            color: AppColors.brownDark,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.location_on_outlined,
              color: AppColors.tan, size: 18),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '1910, wien stadt, At',
                style: TextStyle(color: Colors.white70, fontSize: 8),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.tan,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text('Change',
              style: TextStyle(color: Colors.white, fontSize: 7)),
        ),
      ],
    );
  }
}
