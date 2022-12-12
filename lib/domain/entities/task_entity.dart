class TaskEntity {
  String name;
  int difficulty;
  String? imgSrc;

  TaskEntity({required this.name, required this.difficulty, this.imgSrc});

  List<Object?> get props => [name, difficulty, imgSrc];
}
