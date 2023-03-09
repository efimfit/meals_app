import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meals_app/cuisines/cuisines.dart';

part 'cuisines_state.dart';

class CuisinesCubit extends Cubit<CuisinesState> {
  CuisinesCubit({
    required CuisinesRepository cuisinesRepository,
  })  : _cuisinesRepository = cuisinesRepository,
        super(const CuisinesState());

  final CuisinesRepository _cuisinesRepository;

  Future<void> fetchCuisines() async {
    final currentCuisines = await _cuisinesRepository.getCuisines();
    emit(state.copyWith(cuisines: currentCuisines));
  }
}
