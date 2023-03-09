import 'package:meals_app/cuisines/cuisines.dart';

class CuisinesRepository {
  List<Cuisine>? _cuisines;

  Future<List<Cuisine>> getCuisines() async {
    if (_cuisines != null) return _cuisines!;
    return Future.delayed(const Duration(microseconds: 500))
        .then((value) => dummyCuisines);
  }
}
