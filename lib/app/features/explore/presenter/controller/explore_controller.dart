// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_triple/flutter_triple.dart';

import 'package:my_academy/app/features/explore/presenter/state/explore_state.dart';
import 'package:my_academy/app/features/explore/repository/i_get_exercice_with_category.dart';

class ExploreController extends Store<ExploreState> {
  final IGetExerciceWithCategory iGetExerciceWithCategory;
  ExploreController({
    required this.iGetExerciceWithCategory,
  }) : super(ExploreState.init());

  String generateImageCategory(String category) {
    if (category == 'triceps') {
      return 'lib/assets/images/category_triceps.jpg';
    } else if (category == 'biceps') {
      return 'lib/assets/images/category_biceps.jpg';
    } else if (category == 'costas') {
      return 'lib/assets/images/category_costas.jpg';
    } else if (category == 'gluteos') {
      return 'lib/assets/images/category_gluteos.jpg';
    } else if (category == 'ombros') {
      return 'lib/assets/images/category_ombro.jpg';
    } else if (category == 'panturrilhas') {
      return 'lib/assets/images/category_panturrilha.jpeg';
    } else if (category == 'peito') {
      return 'lib/assets/images/category_peito.jpeg';
    } else {
      return 'lib/assets/images/category_perna.jpg';
    }
  }

  void selectedCategory(String category) {
    update(state.copyWith(selectedCategory: category));
  }

  Future<void> getListExercicesWithCategory(String category) async {
    final result = await iGetExerciceWithCategory.call(category);
    result.fold((l) => setError(l),
        (r) => update(state.copyWith(listExercicesWithCategory: r)));
  }
}
