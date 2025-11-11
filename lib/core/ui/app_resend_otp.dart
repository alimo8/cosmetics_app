import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppResendOtp extends StatefulWidget {
  const AppResendOtp({super.key});

  @override
  State<AppResendOtp> createState() => _AppResendOtpState();
}

class _AppResendOtpState extends State<AppResendOtp> {
  bool isSent = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Didn’t receive a code? '),
        TextButton(
          onPressed: isSent
              ? null
              : () {
                  isSent = true;
                  setState(() {});
                },
          child: Text('Resend'),
        ),
        Spacer(),
        if (isSent)
          CircularCountDownTimer(
            onComplete: () {
              isSent = false;
              setState(() {});
            },
            width: 50,
            height: 40,
            duration: 30,
            fillColor: Colors.transparent,
            ringColor: Colors.transparent,
            textFormat: CountdownTextFormat.MM_SS,
            textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            isReverse: true,
          ),
      ],
    );
  }
}
