part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  // ممكن تبقي غلط
  final List<CategoryModel> categories;

  CategorySuccess(this.categories);
}

final class CategoryErorr extends CategoryState {
  final String errorMessage;

  CategoryErorr({required this.errorMessage});
}
