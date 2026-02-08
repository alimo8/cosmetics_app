part of '../view.dart';

class _Item extends StatelessWidget {
  const _Item({required this.title, this.destinationPage});
  final String title;
  final Widget? destinationPage;
  @override
  Widget build(BuildContext context) {
    final isLogout = title.toLowerCase() == 'logout';
    final image = '${title.toLowerCase().replaceAll(' ', '_')}.svg';
    return ListTile(
      onTap: destinationPage == null
          ? null
          : () async {
              if (isLogout) {
                final response = await DioHelper.postRequest(
                  endPoint: '/api/Auth/logout',
                );
                if (response.isSucces) {
                  CacheHelper.logout();
                  goTo(destinationPage!);
                } else {
                  showMsg(isError: true, 'Something Wrong');
                }
              } else {
                goTo(destinationPage!);
              }
            },
      leading: AppImage(imageUrl: image),
      title: Text(
        title,
        style: TextStyle(color: isLogout ? Colors.red : Color(0xff434C6D)),
      ),
      trailing: isLogout
          ? null
          : AppImage(imageUrl: 'arrow_right.svg', color: Color(0xff434C6D)),
    );
  }
}
