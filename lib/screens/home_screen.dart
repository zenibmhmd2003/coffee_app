import 'package:flutter/material.dart';
import '../cart_state.dart';
import '../models/coffee.dart';
import '../theme.dart';
import '../widgets/common_widgets.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = kCoffees.take(4).toList();

    return Scaffold(
      backgroundColor: AppColors.brown,
      bottomNavigationBar: CoffeeBottomNav(
        index: 0,
        onTap: (i) {
          if (i == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartScreen()),
            );
          }
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32), // نزّلت الهيدر شوية عن الحافة
              _header(),
              const SizedBox(height: 16),
              _promoBanner(),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.88,
                  ),
                  itemBuilder: (context, i) => _ProductCard(coffee: products[i]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 17,
          backgroundImage: AssetImage(AppAssets.avatar),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shahzaib',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Good Morning!',
                style: TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
        ),
        const Icon(Icons.search, color: Colors.white, size: 20),
        const SizedBox(width: 14),
        const Icon(Icons.notifications_none, color: Colors.white, size: 20),
      ],
    );
  }

  Widget _promoBanner() {
    return Container(
      height: 84,
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: AppColors.tanLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Get 20% Discount\nOn your First Order!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
          Image.asset(AppAssets.promoCup, height: 80),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Coffee coffee;
  const _ProductCard({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CartState.instance.add(coffee);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${coffee.name} added to cart'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.tan,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(child: Image.asset(coffee.image, fit: BoxFit.contain)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  coffee.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${coffee.price}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Lorem ipsum dolor sit amet cons',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 7),
            ),
          ],
        ),
      ),
    );
  }
}