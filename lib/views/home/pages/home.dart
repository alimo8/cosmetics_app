import 'package:cosmetics/core/ui/app_images.dart';
import 'package:cosmetics/core/ui/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<ProductModel> products = [
    ProductModel(
      name: 'Athe Red lipstick',
      price: 350,
      image:
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    ),
    ProductModel(
      name: 'Athe Red lipstick',
      price: 120,
      image:
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    ),
    ProductModel(
      name: 'Athe Red lipstick',
      price: 90,
      image:
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    ),
    ProductModel(
      name: 'Athe Red lipstick',
      price: 150,
      image:
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    ),
    ProductModel(
      name: 'Athe Red lipstick',
      price: 75,
      image:
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    ),
    ProductModel(
      name: 'Athe Red lipstick',
      price: 220,
      image:
          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
    ),
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
              AppSearch(hintText: 'Search'),
              SizedBox(height: 13.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    AppImages(
                      imageUrl:
                          'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffE9DCD3).withValues(alpha: .8),
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
                              AppImages(imageUrl: 'offer.svg'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppImages(imageUrl: 'offer.svg'),
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
                    color: const Color(0xff434C6D),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
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
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      elevation: 3,
      color: const Color(0xffD9D9D9),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: AppImages(imageUrl: product.image, fit: BoxFit.contain),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '\$ ${product.price}',
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

class ProductModel {
  final String name;
  final double price;
  final String image;

  ProductModel({required this.name, required this.price, required this.image});
}
