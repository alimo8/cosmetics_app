import 'package:cosmetics/core/ui/app_image.dart';
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
  final _list = [
    _Model(icons: 'home.svg', pages: HomePage()),
    _Model(icons: 'categories.svg', pages: const CategoriesPage()),
    _Model(icons: 'cart.svg', pages: const CartPage()),
    _Model(icons: 'profile.svg', pages: const PersonalPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list[currentIndex].pages,
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
            _list.length,
            (index) => BottomNavigationBarItem(
              icon: AppImage(
                imageUrl: _list[index].icons!,
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

class _Model {
  final String? icons;
  final Widget? pages;

  _Model({required this.icons, required this.pages});
}
