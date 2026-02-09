import 'package:cosmetics/core/logic/cach_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'components/item.dart';
part 'components/header.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  Future<void> getData() async {
    final response = await DioHelper.getRequest(endPoint: '/api/Auth/profile');
    if (response.isSucces) {
      final model = UserModel.fromJson(response.data);
      await CacheHelper.saveUserData(model: model);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  _Item(title: 'Edit Info'),
                  _Item(title: 'Order History'),
                  _Item(title: 'Wallet'),
                  _Item(title: 'Settings'),
                  _Item(title: 'Voucher'),
                  _Item(title: 'Logout', destinationPage: LoginView()),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
