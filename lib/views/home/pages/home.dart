import 'package:carousel_slider/carousel_slider.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_search.dart';
import 'package:cosmetics/views/home/cubit/Product_cubit.dart';
import 'package:cosmetics/views/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getTopRated();
    context.read<ProductCubit>().getMostOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              const AppSearch(hintText: 'Search'),
              SizedBox(height: 13.h),

              /// 🔹 Offers Section
              _buildOffersSection(),

              SizedBox(height: 10.h),

              /// 🔹 Top Rated Products
              _buildSectionTitle('Top rated products'),
              _buildProductsGrid(),

              SizedBox(height: 10.h),

              /// 🔹 Most Ordered Products
              _buildSectionTitle('Most ordered Products'),
              _buildProductsGrid(),

              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }

  /// 🧩 Offers Section
  Widget _buildOffersSection() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const _LoadingIndicator();
        } else if (state is ProductErorr) {
          return _ErrorMessage(state.errorMessage);
        } else if (state is ProductSuccess) {
          final mostOrder = state.product;
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CarouselSlider(
                items: mostOrder
                    .map(
                      (item) => AppImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: item.image,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 300.h,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  viewportFraction: 1.0,
                  aspectRatio: 2.0,
                  initialPage: 0,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffE9DCD3).withValues(alpha: .7),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            '50% OFF DISCOUNT \nCUPON CODE : 125865',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const AppImage(imageUrl: 'offer.svg'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppImage(imageUrl: 'offer.svg'),
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
          );
        } else {
          return const _ErrorMessage('Something went wrong');
        }
      },
    );
  }

  /// 🧩 Section Title
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0xff434C6D),
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// 🧩 Products Grid
  Widget _buildProductsGrid() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const _LoadingIndicator();
        } else if (state is ProductErorr) {
          return _ErrorMessage(state.errorMessage);
        } else if (state is ProductSuccess) {
          final products = state.product;
          return Padding(
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
              itemBuilder: (context, index) => _Item(product: products[index]),
            ),
          );
        } else {
          return const _ErrorMessage('Something went wrong');
        }
      },
    );
  }
}

/// 🧩 Item Card
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
                child: AppImage(imageUrl: product.image, fit: BoxFit.contain),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
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

/// 🔹 Loading Widget
class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: Colors.black));
  }
}

/// 🔹 Error Widget
class _ErrorMessage extends StatelessWidget {
  final String message;
  const _ErrorMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Error: $message'));
  }
}
