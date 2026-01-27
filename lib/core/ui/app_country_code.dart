import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';
import 'package:cosmetics/core/ui/app_image.dart';

class AppCountryCode extends StatefulWidget {
  const AppCountryCode({super.key, this.onCountryCodeChanged});

  final ValueChanged<String>? onCountryCodeChanged;

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  String? myValue;
  List<CountriesModel>? list;
  bool isFailed = false;

  Future<void> getData() async {
    final response = await DioHelper.getRequest(endPoint: '/api/Countries');

    if (response.isSucces) {
      isFailed = false;
      list = (response.data as List)
          .map((e) => CountriesModel.fromJson(e as Map<String, dynamic>))
          .toList();

      myValue = list!
          .firstWhere(
            (element) => element.code == '+20',
            orElse: () => list!.first,
          )
          .code;
      widget.onCountryCodeChanged?.call(myValue!);
    } else {
      isFailed = true;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 6.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Theme.of(
              context,
            ).inputDecorationTheme.enabledBorder!.borderSide.color,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: isFailed
              ? IconButton(onPressed: getData, icon: Icon(Icons.replay))
              : list == null
              ? Center(child: CircularProgressIndicator())
              : DropdownButton<String>(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  value: myValue,
                  items: list!
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.code,
                          child: Text(
                            '${e.code} ',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    myValue = value!;
                    widget.onCountryCodeChanged?.call(myValue!);
                    setState(() {});
                  },
                  icon: AppImage(
                    imageUrl: "arrow_down.svg",
                    color: Color(0xff767676),
                    width: 12.w,
                    height: 16.h,
                    fit: BoxFit.fill,
                  ),
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ),
        ),
      ),
    );
  }
}

class CountriesModel {
  late final int id;
  late final String code;
  late final String name;

  CountriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? '';
    name = json['name'] ?? '';
  }
}
