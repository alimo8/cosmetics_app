import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:cosmetics/core/ui/custom_filled_button.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xff434C6D)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 24,
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
              // ===== Delivery Section =====
              const Text(
                'Delivery to',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff434C6D),
                ),
              ),
              const SizedBox(height: 16),

              const CustomContainer(
                image:
                    'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
                title: 'Home',
                subTitle: 'Mansoura, 14 Porsaid St',
                icon: 'arrowright2_icon.svg',
              ),

              const SizedBox(height: 40),

              // ===== Payment Section =====
              const Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff434C6D),
                ),
              ),
              const SizedBox(height: 16),

              const CustomContainer(
                image: 'masterCard_icon.svg',
                title: '**** **** **** 1234',
                icon: 'arrowright2_icon.svg',
                width: 40,
                height: 40,
              ),
              const SizedBox(height: 12),

              CustomContainer(
                image: 'voucher_icon.svg',
                title: 'Add voucher',
                widget: CustomFilledButton(
                  onPressed: () {},
                  text: 'Apply',
                  color: Color(0xffDA498C),
                ),
                width: 40,
                height: 40,
              ),

              const SizedBox(height: 40),

              // ===== Payment Summary =====
              const Text(
                '- REVIEW PAYMENT',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff6D6E8D),
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'PAYMENT SUMMARY',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff434C6D),
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 22),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Subtotal',
                    style: TextStyle(fontSize: 14, color: Color(0xff434C6D)),
                  ),
                  Text(
                    '16.100 EGP',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff434C6D),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Shipping Fees',
                    style: TextStyle(fontSize: 14, color: Color(0xff434C6D)),
                  ),
                  Text(
                    'TO BE CALCULATED',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff434C6D),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Divider(color: Color(0xffA5C9CA), thickness: 1),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'TOTAL + VAT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff434C6D),
                    ),
                  ),
                  Text(
                    '16.100 EGP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff434C6D),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 80),

              Center(
                child: CustomFilledButton(
                  onPressed: () {},
                  text: 'ORDER',
                  color: Color(0xffDA498C),
                  width: 233,
                  height: 58,
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
  });

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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: AppAssets(
              imageUrl: image ?? '',
              width: width ?? 80,
              height: height ?? 60,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: const TextStyle(
                    fontSize: 16,
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
                ? AppAssets(imageUrl: icon ?? '', width: 24, height: 24)
                : widget!,
          ),
        ],
      ),
    );
  }
}
