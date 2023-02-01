part of 'cuisines_cubit.dart';

class CuisinesState {
  const CuisinesState({
    this.cuisines = const [],
  });

  final List<Cuisine> cuisines;

  CuisinesState copyWith({
    List<Cuisine>? cuisines,
  }) {
    return CuisinesState(
      cuisines: cuisines ?? this.cuisines,
    );
  }
}
