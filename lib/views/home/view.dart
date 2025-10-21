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

  final List screens = [
    HomePage(),
    const CategoriesPage(),
    const CartPage(),
    const PersonalPages(),
  ];

  final List icons = [
    'home_icon.svg',
    'categories_icon.svg',
    'cart_icon.svg',
    'profile_icon.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 13),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 4,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: 1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: List.generate(
            screens.length,
            (index) => BottomNavigationBarItem(
              icon: AppAssets(
                imageUrl: icons[index],
                color: currentIndex == index
                    ? Theme.of(context).primaryColor
                    : null,
              ),
              label: '',
            ),
          ),
        ),
      ),
    );
  }
}
