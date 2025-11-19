import 'package:cosmetics/views/home/model/product_model.dart';
import 'package:cosmetics/views/home/repo/most_ordered_repo.dart';
import 'package:cosmetics/views/home/repo/top_rated_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  final _mostOrderedRepo = MostOrderedRepo();
  final _topRatedRepo = TopRatedRepo();

  Future<void> getMostOrders() async {
    emit(ProductLoading());

    try {
      final response = await _mostOrderedRepo.getMost();
      emit(ProductSuccess(response));
    } catch (e) {
      emit(ProductErorr(e.toString()));
    }
  }

  Future<void> getTopRated() async {
    emit(ProductLoading());

    try {
      final response = await _topRatedRepo.getTop();
      emit(ProductSuccess(response));
    } catch (e) {
      emit(ProductErorr(e.toString()));
    }
  }
}
