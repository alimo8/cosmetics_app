import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:cosmetics/core/ui/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List products = [
    {
      'name': 'Athe Red lipstick',
      'price': 350,
      'image':
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    },
    {
      'name': 'Athe Red lipstick',
      'price': 120,
      'image':
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    },
    {
      'name': 'Athe Red lipstick',
      'price': 90,
      'image':
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    },
    {
      'name': 'Athe Red lipstick',
      'price': 150,
      'image':
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    },
    {
      'name': 'Athe Red lipstick',
      'price': 75,
      'image':
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    },
    {
      'name': 'Athe Red lipstick',
      'price': 220,
      'image':
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              SearchInput(hintText: 'Search'),
              SizedBox(height: 13.h),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    AppAssets(
                      imageUrl:
                          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
                      // width: 100,
                      // height: 100,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffE9DCD3).withValues(alpha: .8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '50% OFF DISCOUNT \nCUPON CODE : 125865',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              AppAssets(imageUrl: 'offer_icon.svg'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppAssets(imageUrl: 'offer_icon.svg'),
                              Text(
                                'Hurry up! \nSkin care only !',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top rated products',
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // عمودين
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 18,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return _Item(product: product);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      elevation: 3,
      color: Color(0xffD9D9D9),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(4.r),
                child: AppAssets(
                  imageUrl: product['image'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '\$ ${product['price']} ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
