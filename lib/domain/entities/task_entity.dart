class TaskEntity {
  /// Nome da tarefa
  String name;

  /// Dificuldade da tarefa que deverá variar de 1 a 5
  int difficulty;

  /// Recurso visual da tarefa, caso haja
  String? imgSrc;

  /// Status da tarefa, caso [false] indica que está inacabado, caso [true] indica que foi finalizada
  bool isFinished;

  TaskEntity(
      {required this.name,
      required this.difficulty,
      this.imgSrc,
      required this.isFinished});

  List<Object?> get props => [name, difficulty, imgSrc, isFinished];
}
