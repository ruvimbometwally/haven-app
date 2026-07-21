import '/flutter_flow/flutter_flow_util.dart';

String relationshipDurationLabel(DateTime? relationshipStartDate) {
  if (relationshipStartDate == null) {
    return 'Connected';
  }
  final now = DateTime.now();
  final years = now.year - relationshipStartDate.year;
  final months = now.month - relationshipStartDate.month;

  int totalMonths = years * 12 + months;
  if (now.day < relationshipStartDate.day) {
    totalMonths--;
  }

  if (totalMonths < 0) return 'Just started';

  final displayYears = totalMonths ~/ 12;
  final displayMonths = totalMonths % 12;

  if (displayYears == 0) {
    return '$displayMonths ${displayMonths == 1 ? 'Month' : 'Months'}';
  }

  if (displayMonths == 0) {
    return '$displayYears ${displayYears == 1 ? 'Year' : 'Years'}';
  }

  return '$displayYears ${displayYears == 1 ? 'Year' : 'Years'} • $displayMonths ${displayMonths == 1 ? 'Month' : 'Months'}';
}
