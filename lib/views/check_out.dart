import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/google_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: Color(0xff101010).withValues(alpha: .1),
            child: AppImage(imageUrl: 'arrow_back.svg'),
          ),
        ),

        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xff434C6D),
          ),
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          color: const Color(0xff39D3DA).withValues(alpha: .11),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery to',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff434C6D),
                ),
              ),
              SizedBox(height: 16.h),
              const CustomContainer(
                map: GoogleMapWidget(width: 60, height: 60),
                title: 'Home',
                subTitle: 'Mansoura, 14 Porsaid St',
                icon: 'arrow_down.svg',
              ),
              SizedBox(height: 40.h),
              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff434C6D),
                ),
              ),
              SizedBox(height: 16.h),
              CustomContainer(
                image: 'masterCard.svg',
                title: '**** **** **** 1234',
                icon: 'arrow_down.svg',
                width: 40.w,
                height: 40.h,
              ),
              SizedBox(height: 12.h),
              CustomContainer(
                image: 'voucher.svg',
                title: 'Add voucher',
                widget: AppButton(
                  height: 10.h,
                  // width: 40.w,
                  onPressed: () {},
                  text: 'Apply',
                  color: Color(0xffDA498C),
                ),
                // width: 40.w,
                height: 40.h,
              ),

              SizedBox(height: 40.h),
              Text(
                '- REVIEW PAYMENT',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xff6D6E8D),
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'PAYMENT SUMMARY',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff434C6D),
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(fontSize: 14.sp, color: Color(0xff434C6D)),
                  ),
                  Text(
                    '16.100 EGP',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff434C6D),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Fees',
                    style: TextStyle(fontSize: 14.sp, color: Color(0xff434C6D)),
                  ),
                  Text(
                    'TO BE CALCULATED',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff434C6D),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              const Divider(color: Color(0xffA5C9CA), thickness: 1),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TOTAL + VAT',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff434C6D),
                    ),
                  ),
                  Text(
                    '16.100 EGP',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff434C6D),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80.h),
              Center(
                child: AppButton(
                  onPressed: () {},
                  text: 'ORDER',
                  color: Color(0xffDA498C),
                  width: 233.w,
                  height: 58.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.image,
    this.title,
    this.subTitle,
    this.icon,
    this.width,
    this.height,
    this.widget,
    this.map,
  });

  final Widget? map;
  final Widget? widget;
  final String? image;
  final String? title;
  final String? subTitle;
  final String? icon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey, width: 1.w),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: map == null
                ? AppImage(
                    imageUrl: image ?? '',
                    width: width ?? 80,
                    height: height ?? 60,
                  )
                : map!,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff434C6D),
                  ),
                ),
                if (subTitle != null && subTitle!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      subTitle!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xff8E8EA9),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: widget == null
                ? AppImage(imageUrl: icon ?? '', width: 24, height: 24)
                : widget!,
          ),
        ],
      ),
    );
  }
}
