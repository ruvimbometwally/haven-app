import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalsRecord extends FirestoreRecord {
  GoalsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "progress" field.
  double? _progress;
  double get progress => _progress ?? 0.0;
  bool hasProgress() => _progress != null;

  // "deadline" field.
  String? _deadline;
  String get deadline => _deadline ?? '';
  bool hasDeadline() => _deadline != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _progress = castToType<double>(snapshotData['progress']);
    _deadline = snapshotData['deadline'] as String?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('goals');

  static Stream<GoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoalsRecord.fromSnapshot(s));

  static Future<GoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoalsRecord.fromSnapshot(s));

  static GoalsRecord fromSnapshot(DocumentSnapshot snapshot) => GoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoalsRecordData({
  String? title,
  double? progress,
  String? deadline,
  bool? isCompleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'progress': progress,
      'deadline': deadline,
      'isCompleted': isCompleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalsRecordDocumentEquality implements Equality<GoalsRecord> {
  const GoalsRecordDocumentEquality();

  @override
  bool equals(GoalsRecord? e1, GoalsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.progress == e2?.progress &&
        e1?.deadline == e2?.deadline &&
        e1?.isCompleted == e2?.isCompleted;
  }

  @override
  int hash(GoalsRecord? e) => const ListEquality()
      .hash([e?.title, e?.progress, e?.deadline, e?.isCompleted]);

  @override
  bool isValidKey(Object? o) => o is GoalsRecord;
}
