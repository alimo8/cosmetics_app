import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:cosmetics/views/home/pages/cart.dart';
import 'package:cosmetics/views/home/pages/categories.dart';
import 'package:cosmetics/views/home/pages/home.dart';
import 'package:cosmetics/views/home/pages/personal.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomePage(),
    const CategoriesPage(),
    const CartPage(),
    const PersonalPages.PersonalPage(),
  ];

  final List<String> icons = [
    'home_icon.svg',
    'categories_icon.svg',
    'cart_icon.svg',
    'profile_icon.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 16, left: 12, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(25),
            right: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final bool isSelected = index == currentIndex;

            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(10),
                child: AppAssets(
                  imageUrl: icons[index],
                  width: 28,
                  height: 28,
                  color: isSelected ? const Color(0xffD75D72) : Colors.grey,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
