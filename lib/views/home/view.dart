import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/home/pages/cart/view.dart';
import 'package:cosmetics/views/home/pages/categories/view.dart';
import 'package:cosmetics/views/home/pages/home/view.dart';
import 'package:cosmetics/views/home/pages/personal/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final _list = [
    _Model(icon: 'home.svg', page: HomePage()),
    _Model(icon: 'categories.svg', page: const CategoriesPage()),
    _Model(icon: 'cart.svg', page: const CartPage()),
    _Model(icon: 'profile.svg', page: const ProfilPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list[currentIndex].page,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 13.h, vertical: 13.h),
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
                imageUrl: _list[index].icon,
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
  final String icon;
  final Widget page;

  _Model({required this.icon, required this.page});
}
