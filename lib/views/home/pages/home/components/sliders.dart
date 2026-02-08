part of '../view.dart';

class _Sliders extends StatefulWidget {
  const _Sliders();

  @override
  State<_Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<_Sliders> {
  List<SlidersModel>? list;

  Future<void> getData() async {
    final response = await DioHelper.getRequest(endPoint: '/api/Sliders');
    list = SlidersData.fromJson({'list': response.data}).list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return list == null
        ? Center(child: CircularProgressIndicator())
        : CarouselSlider(
            items: List.generate(
              list!.length,
              (index) => ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20.r),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AppImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: list![index].imageUrl,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 18.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffE9DCD3).withValues(alpha: .7),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '${list![index].discountPercent}% OFF DISCOUNT \nCUPON CODE : ${list![index].couponCode}',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const AppImage(imageUrl: 'offer.svg'),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppImage(imageUrl: 'offer.svg'),
                              Text(
                                '${list![index].descriptionTitle1} \n${list![index].descriptionTitle2}',
                                style: TextStyle(
                                  fontSize: 18.sp,
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
              ),
            ),
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
          );
  }
}

// class SlidersModel {
//   late final String descriptionTitle1, descriptionTitle2, imageUrl, couponCode;
//   late final num discountPercent;
//   late final int id;
//   SlidersModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? 0;
//     couponCode = json['couponCode'] ?? "";
//     discountPercent = json['discountPercent'] ?? 0;
//     descriptionTitle1 = json['descriptionTitle1'] ?? '';
//     descriptionTitle2 = json['descriptionTitle2'] ?? '';
//     imageUrl = json['imageUrl'] ?? '';
//   }
// }

class SlidersData {
  late final List<SlidersModel> list;

  SlidersData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => SlidersModel.fromJson(e)).toList();
  }
}

class SlidersModel {
  late final int id;
  late final String couponCode;
  late final int discountPercent;
  late final String descriptionTitle1;
  late final String descriptionTitle2;
  late final String imageUrl;

  SlidersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    couponCode = json['couponCode'] ?? '';
    discountPercent = json['discountPercent'] ?? 0;
    descriptionTitle1 = json['descriptionTitle1'] ?? '';
    descriptionTitle2 = json['descriptionTitle2'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
  }
}
