import 'package:my_academy/app/features/exercices/model/exercice_model.dart';
import 'package:my_academy/app/features/explore/presenter/helpers/explore_exercice_enum.dart';

class ExploreState {
  final List<ExerciceModel> listExercicesWithCategory;
  final String? selectedCategory;
  final List<CategoryEnum> listCategory;
  ExploreState({
    required this.listExercicesWithCategory,
    required this.selectedCategory,
    required this.listCategory,
  });

  factory ExploreState.init() => ExploreState(
        listCategory: [
          CategoryEnum.biceps,
          CategoryEnum.costas,
          CategoryEnum.gluteos,
          CategoryEnum.ombros,
          CategoryEnum.panturrilhas,
          CategoryEnum.peito,
          CategoryEnum.pernas,
          CategoryEnum.triceps,
        ],
        selectedCategory: null,
        listExercicesWithCategory: [],
      );

  ExploreState copyWith({
    List<ExerciceModel>? listExercicesWithCategory,
    String? selectedCategory,
    List<CategoryEnum>? listCategory,
  }) {
    return ExploreState(
      listCategory: listCategory ?? this.listCategory,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      listExercicesWithCategory:
          listExercicesWithCategory ?? this.listExercicesWithCategory,
    );
  }
}
