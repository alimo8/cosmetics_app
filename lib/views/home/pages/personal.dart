import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:flutter/material.dart';

class PersonalPages extends StatelessWidget {
  const PersonalPages.PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            ClipOval(
              child: AppAssets(
                imageUrl:
                    'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ali Mohamed',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff434C6D),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),

            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              children: [
                _Item(urlIcon: 'Carrier_icon.svg', title: 'Edit Info'),
                _Item(urlIcon: 'Vector_icon.svg', title: 'Order History'),
                _Item(urlIcon: 'wallet_icon.svg', title: 'Wallet'),
                _Item(urlIcon: 'setting_icon.svg', title: 'Settings'),
                _Item(urlIcon: 'Vector_icon.svg', title: 'Voucher '),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.urlIcon, required this.title});
  final String urlIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            AppAssets(imageUrl: urlIcon, width: 18, height: 18),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff434C6D),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: AppAssets(
                imageUrl: 'arrow-right_icon.svg',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
