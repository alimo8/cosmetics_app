import 'package:cosmetics/views/home/model/category_model.dart';
import 'package:cosmetics/views/home/repo/category_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final categoryRepo = CategoryRepo();

  Future<void> getCategory() async {
    emit(CategoryLoading());
    try {
      final response = await categoryRepo.getCategoryPage();
      emit(CategorySuccess(response));
    } catch (e) {
      emit(CategoryErorr(errorMessage: e.toString()));
    }
  }
}
