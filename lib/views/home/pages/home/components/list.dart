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
    list = ProductData.fromJson({'list': response.data}).list;
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

class ProductData {
  late final List<ProductModel> list;
  ProductData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => ProductModel.fromJson(e)).toList();
  }
}

class ProductModel {
  late final int id;
  late final String name;
  late final String description;
  late final double price;
  late final int stock;
  late final String imageUrl;
  late final int categoryId;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    description = json['description'] ?? '';
    price = json['price'] ?? 0;
    stock = json['stock'] ?? 0;
    imageUrl = json['imageUrl'] ?? '';
    categoryId = json['categoryId'] ?? 0;
  }
}
