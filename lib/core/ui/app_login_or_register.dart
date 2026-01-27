import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoginOrRegister extends StatefulWidget {
  final bool isLogin;

  const AppLoginOrRegister({super.key, this.isLogin = true});

  @override
  State<AppLoginOrRegister> createState() => _AppLoginOrRegisterState();
}

class _AppLoginOrRegisterState extends State<AppLoginOrRegister> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: widget.isLogin
                  ? "Don’t have an account?"
                  : "Already have an account ?",
              style: TextStyle(color: Colors.grey, fontSize: 18.sp),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                ),
                child: Text(
                  widget.isLogin ? "Sign up" : "Login",
                  style: TextStyle(
                    color: const Color(0xffD75D72),
                    fontSize: 18.sp,
                  ),
                ),
                onPressed: () {
                  if (widget.isLogin) {
                    goTo(RegisterView());
                    setState(() {});
                  } else {
                    goTo(LoginView(), canPop: false);
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
