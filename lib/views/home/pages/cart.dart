import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/check_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        actions: [
          GestureDetector(
            onTap: () {
              goTo(CheckOutView());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppImage(imageUrl: 'bink_cart.svg'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'You have 4 products in your cart',
              style: TextStyle(fontSize: 12, color: Color(0xff434c6d)),
            ),
            SizedBox(height: 34.h),
            Expanded(
              child: ListView.separated(
                cacheExtent: 500,
                itemCount: 10,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                  thickness: 0.8,
                  height: 40,
                ),
                itemBuilder: (context, index) {
                  return const _Item();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  const _Item();

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(18),
                child: AppImage(
                  imageUrl:
                      'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
                  width: 110.w,
                  height: 110.h,
                ),
              ),
              Positioned(
                right: 62,
                bottom: 55,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Note Cosmetics',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff434C6D),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Ultra rich mascara for lashes',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3b4569),
                ),
              ),
              SizedBox(height: 22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '350 ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff434C6D),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            size: 18,
                            color: quantity > 1
                                ? const Color(0xff434C6D)
                                : Colors.grey.shade400,
                          ),
                          onPressed: quantity > 1
                              ? () {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              : null,
                        ),
                        Text(
                          '$quantity',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 18.sp,
                            color: Color(0xffD75D72),
                          ),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
