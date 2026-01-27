part of '../view.dart';

class _List extends StatefulWidget {
  const _List();

  @override
  State<_List> createState() => __ListState();
}

class __ListState extends State<_List> {
  List<ProductModel>? list;
  Future<void> productData() async {
    final response = await DioHelper.getRequest(endPoint: '/api/Products');
    list = (response.data as List)
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    productData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (list == null) {
      return Center(child: CircularProgressIndicator());
    }
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 18,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) => _Item(model: list![index]),
    );
  }
}

class ProductModel {
  late final String name, description;
  late String imageUrl;
  late final int id, stock;
  late final double price;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    stock = json['stock'] ?? 0;
    price = json['price'] ?? 0;
    name = json['name'] ?? '';
    description = json['description'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
    imageUrl = imageUrl.isEmpty
        ? 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png'
        : imageUrl;
  }
}
