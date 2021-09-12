class ExamSummary {
  final String key;
  final String name;
  final String result;
  final String average;
  final String maximum;
  final List<ExamSubjectResult> subject;

  ExamSummary(this.key, this.name, this.result, this.average, this.maximum,
      this.subject);
}

class ExamSubjectResult {
  final String name;
  final String result;
  final String average;
  final String maximum;

  ExamSubjectResult(this.name, this.result, this.average, this.maximum);
}
