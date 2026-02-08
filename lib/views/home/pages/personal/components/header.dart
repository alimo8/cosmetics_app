part of '../view.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245.h,
      child: Stack(
        children: [
          Container(
            height: 160.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.bottomCenter,
                end: AlignmentDirectional.topCenter,
                stops: [0, 1],
                colors: [
                  Color(0xffECA4C5),
                  Color(0xff434C6D).withValues(alpha: .83),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 96.h,
                  width: 96.h,
                  child: AppImage(
                    imageUrl: CacheHelper.image,
                    isCircle: true,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  CacheHelper.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
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
