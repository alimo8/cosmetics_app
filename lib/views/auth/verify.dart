import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:cosmetics/core/ui/custom_filled_button.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ).copyWith(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssets(imageUrl: 'splash_image.svg', height: 67, width: 62),
            SizedBox(height: 40),
            Text(
              'Verify Code',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              textAlign: TextAlign.center,
              'We just sent a 4-digit verification code to +20 1022658997. Enter the code in the box below to continue.',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Edit the number',
                  style: TextStyle(
                    color: Color(0xffD75D72),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            PinCodeTextField(
              appContext: context,
              length: 4,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 55,
                fieldWidth: 50,
                activeColor: Colors.blue,
                selectedColor: Colors.pink,
                inactiveColor: Colors.grey,
              ),
              onChanged: (value) {
                // pinCode = value;
              },
            ),

            SizedBox(height: 50),

            CustomFilledButton(
              onPressed: () {
                // if (formKey.currentState!.validate()) {}
                // goTo(CreatePasswordView());
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      icon: AppAssets(
                        imageUrl: 'verfiy_logo.png',
                        height: 100,
                        width: 100,
                      ),
                      title: Text('Account Activated!'),
                      content: Text(
                        textAlign: TextAlign.center,
                        'Congratulations! Your account has been successfully activated',
                        style: TextStyle(color: Colors.grey),
                      ),
                      actions: [
                        Center(
                          child: CustomFilledButton(
                            height: 60,
                            width: 268,
                            text: 'Go to home',
                            onPressed: () {
                              goTo(HomeView());
                            },
                            color: Color(0xffD75D72),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              text: 'Done',
              color: Color(0xffD75D72),
              height: 60,
              width: 268,
            ),
            SizedBox(height: 43),
          ],
        ),
      ),
    );
  }
}
