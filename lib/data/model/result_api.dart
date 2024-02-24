class ResultApi<T> {
  final bool isDone;
  final T resultForError;

  ResultApi({
    required this.isDone,
    required this.resultForError,
  });
}
