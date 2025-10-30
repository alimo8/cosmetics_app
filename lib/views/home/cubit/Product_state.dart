part of 'Product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductModel> product;

  ProductSuccess(this.product);
}

final class ProductErorr extends ProductState {
  final String errorMessage;

  ProductErorr(this.errorMessage);
}
