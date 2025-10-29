import 'package:cosmetics/views/home/model/most_ordered_model.dart';
import 'package:cosmetics/views/home/repo/most_ordered_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'most_ordered_state.dart';

class MostOrderedCubit extends Cubit<MostOrderedState> {
  MostOrderedCubit() : super(MostOrderedInitial());
  final mostOrderedRepo = MostOrderedRepo();

  Future<void> getMostOrders() async {
    emit(MostOrderedLoading());

    try {
      final response = await mostOrderedRepo.getMost();
      emit(MostOrderedSuccess(response));
    } catch (e) {
      emit(MostOrderedErorr(e.toString()));
    }
  }
}
