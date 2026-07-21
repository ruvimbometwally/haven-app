import '/flutter_flow/flutter_flow_util.dart';

int anniversaryCountdown(DateTime? relationshipStartDate) {
  if (relationshipStartDate == null) {
    return 0;
  }

  final now = DateTime.now();
  // Get anniversary in current year
  DateTime nextAnniversary = DateTime(
    now.year,
    relationshipStartDate.month,
    relationshipStartDate.day,
  );

  // If already passed this year, set to next year
  if (nextAnniversary.isBefore(DateTime(now.year, now.month, now.day))) {
    nextAnniversary = DateTime(
      now.year + 1,
      relationshipStartDate.month,
      relationshipStartDate.day,
    );
  }

  return nextAnniversary.difference(DateTime(now.year, now.month, now.day)).inDays;
}
