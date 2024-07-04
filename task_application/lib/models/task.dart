class Task {
  String title;
  String description;
  DateTime creationDate;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.creationDate,
    this.isCompleted = false,
  });
}
