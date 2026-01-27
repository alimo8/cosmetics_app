part of '../view.dart';

class _Item extends StatelessWidget {
  const _Item(this.model);
  final CategoriesModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 80.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: AppImage(
              imageUrl: model.imageUrl,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            model.title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff434C6D),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: AppImage(
            imageUrl: 'arrow_right.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
