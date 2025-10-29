import 'package:carousel_slider/carousel_slider.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_search.dart';
import 'package:cosmetics/views/home/cubit/most_ordered_cubit.dart';
import 'package:cosmetics/views/home/model/most_ordered_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  @override
  void initState() {
    context.read<MostOrderedCubit>().getMostOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MostOrderedCubit, MostOrderedState>(
        builder: (context, state) {
          if (state is MostOrderedLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (state is MostOrderedErorr) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state is MostOrderedSuccess) {
            final mostOrder = state.mostOrder;
            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  children: [
                    SizedBox(height: 15.h),
                    AppSearch(hintText: 'Search'),
                    SizedBox(height: 13.h),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CarouselSlider(
                          items: List.generate(
                            mostOrder.length,
                            (index) => AppImage(
                              width: double.infinity,
                              fit: BoxFit.cover,
                              imageUrl: mostOrder[index].image,
                            ),
                          ),
                          options: CarouselOptions(
                            height: 300.h,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(
                              milliseconds: 1000,
                            ),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: false, // Changed to false
                            viewportFraction: 1.0, // Changed to 1.0
                            aspectRatio: 2.0,
                            initialPage: 0,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xffE9DCD3,
                            ).withValues(alpha: .7),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  AppImage(imageUrl: 'offer.svg'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        itemCount: mostOrder.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 18,
                              childAspectRatio: 0.8,
                            ),
                        itemBuilder: (context, index) {
                          final product = mostOrder[index];
                          return _Item(product: product);
                        },
                      ),
                    ),

                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Most ordered Products',
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
                        itemCount: mostOrder.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 18,
                              childAspectRatio: 0.8,
                            ),
                        itemBuilder: (context, index) {
                          final product = mostOrder[index];
                          return _Item(product: product);
                        },
                      ),
                    ),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.product});
  final MostOrderedModel product;

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
