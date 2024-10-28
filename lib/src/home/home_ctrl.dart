// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:calorie_tracker/src/home/home_service.dart';
import 'package:calorie_tracker/src/home/search_res_dto.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum HomeState { initial, loading, success, error }

class SelectedFoods {
  final Foods food;
  final String id;
  final num quantity;

  SelectedFoods({
    required this.food,
    required this.id,
    required this.quantity,
  });

  num get totalCalories => ((food.foodNutrients
                  ?.where((e) => e.unitName == 'KCAL')
                  .firstOrNull
                  ?.value ??
              0) *
          quantity)
      .round();

  SelectedFoods copyWith({
    Foods? food,
    String? id,
    num? quantity,
  }) {
    return SelectedFoods(
      food: food ?? this.food,
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }
}

class HomeController extends ChangeNotifier {
  HomeController(this._homeService);
  final HomeService _homeService;

  List<Foods> foods = [];
  List<SelectedFoods> selectedFoods = [];

  num get totalCalories => selectedFoods.fold<num>(
      0, (previousValue, element) => previousValue + element.totalCalories);

  HomeState state = HomeState.initial;

  Future<(String?, String?)> getFood(String query) async {
    try {
      setLoading();

      final result = await _homeService.makeFetchData(query);

      foods = result.isNotEmpty ? result : foods;
      state = HomeState.success;

      return ('success', 'Data fetched successfully');
    } catch (e) {
      state = HomeState.error;

      return ('error', 'An error occurred while fetching data');
    } finally {
      notifyListeners();
    }
  }

  void setLoading() {
    state = HomeState.loading;
    notifyListeners();
  }

  void addFood(Foods food) {
    selectedFoods
        .add(SelectedFoods(food: food, quantity: 1, id: const Uuid().v4()));
    notifyListeners();
  }

  void removeFood(SelectedFoods food) {
    selectedFoods.removeWhere((element) => element.id == food.id);
    notifyListeners();
  }

  void updateQuantity(SelectedFoods food, num quantity) {
    if (quantity <= 0) {
      return;
    }
    final index = selectedFoods.indexWhere((element) => element.id == food.id);
    selectedFoods[index] = selectedFoods[index].copyWith(quantity: quantity);
    notifyListeners();
  }

  void clearSelectedFoods() {
    selectedFoods = [];
    notifyListeners();
  }
}

class DebounceClient {
  final int milliseconds;
  Timer? _timer;

  DebounceClient({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
