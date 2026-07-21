import '/flutter_flow/flutter_flow_util.dart';

List<Map<String, dynamic>> getAnniversariesList(
    DateTime? relationshipStartDate, List<dynamic>? importantDates) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  List<Map<String, dynamic>> allDates = [];

  // Add relationship start date
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
    return [];
  }

  List<Map<String, dynamic>> results = [];

  for (var entry in allDates) {
    final originalDate = entry['date'] as DateTime;
    final label = entry['label'] as String;

    DateTime nextAnniv = DateTime(now.year, originalDate.month, originalDate.day);
    if (nextAnniv.isBefore(today)) {
      nextAnniv = DateTime(now.year + 1, originalDate.month, originalDate.day);
    }

    final diffDays = nextAnniv.difference(today).inDays;
    final years = nextAnniv.year - originalDate.year;

    // Determine the year number (e.g., if started in 2022, 2025 is the 3rd anniversary)
    int annivCount = years;
    
    // If it's the very first year (diff < 1 year since start), it's the "1st Anniversary" coming up
    if (annivCount <= 0) annivCount = 1;

    String suffix = 'th';
    if (annivCount % 10 == 1 && annivCount % 100 != 11) suffix = 'st';
    else if (annivCount % 10 == 2 && annivCount % 100 != 12) suffix = 'nd';
    else if (annivCount % 10 == 3 && annivCount % 100 != 13) suffix = 'rd';

    results.add({
      'label': '$annivCount$suffix $label Anniversary',
      'days': diffDays,
      'originalDate': originalDate,
    });
  }

  // Sort by days left
  results.sort((a, b) => (a['days'] as int).compareTo(b['days'] as int));

  return results;
}
