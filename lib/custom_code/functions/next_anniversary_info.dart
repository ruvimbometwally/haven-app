import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';

Map<String, dynamic> nextAnniversaryInfo(
    DateTime? relationshipStartDate, List<dynamic>? importantDates) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  List<Map<String, dynamic>> allDates = [];

  // Add relationship start date as an anniversary
  if (relationshipStartDate != null) {
    allDates.add({
      'label': 'Relationship',
      'date': relationshipStartDate,
    });
  }

  // Add important dates
  if (importantDates != null) {
    for (var d in importantDates) {
      if (d is Map<String, dynamic>) {
        allDates.add(d);
      }
    }
  }

  if (allDates.isEmpty) {
    return {
      'label': 'Anniversary',
      'days': 0,
    };
  }

  Map<String, dynamic>? closest;
  int minDays = 366;

  for (var entry in allDates) {
    final date = entry['date'] as DateTime;
    final label = entry['label'] as String;

    DateTime nextAnniv = DateTime(now.year, date.month, date.day);
    if (nextAnniv.isBefore(today)) {
      nextAnniv = DateTime(now.year + 1, date.month, date.day);
    }

    final diff = nextAnniv.difference(today).inDays;
    if (diff < minDays) {
      minDays = diff;
      closest = {
        'label': label,
        'days': diff,
      };
    }
  }

  return closest ?? {'label': 'Anniversary', 'days': 0};
}
