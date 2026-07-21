import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouplesRecord extends FirestoreRecord {
  CouplesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "relationship_start_date" field.
  DateTime? _relationshipStartDate;
  DateTime? get relationshipStartDate => _relationshipStartDate;
  bool hasRelationshipStartDate() => _relationshipStartDate != null;

  // "relationship_duration" field.
  String? _relationshipDuration;
  String get relationshipDuration => _relationshipDuration ?? '';
  bool hasRelationshipDuration() => _relationshipDuration != null;

  // "anniversary_date" field.
  DateTime? _anniversaryDate;
  DateTime? get anniversaryDate => _anniversaryDate;
  bool hasAnniversaryDate() => _anniversaryDate != null;

  // "primary_goals" field.
  List<String>? _primaryGoals;
  List<String> get primaryGoals => _primaryGoals ?? const [];
  bool hasPrimaryGoals() => _primaryGoals != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user_refs" field.
  List<DocumentReference>? _userRefs;
  List<DocumentReference> get userRefs => _userRefs ?? const [];
  bool hasUserRefs() => _userRefs != null;

  void _initializeFields() {
    _relationshipStartDate =
        snapshotData['relationship_start_date'] is DateTime
            ? snapshotData['relationship_start_date'] as DateTime?
            : null;
    _relationshipDuration = snapshotData['relationship_duration'] as String?;
    _anniversaryDate = snapshotData['anniversary_date'] as DateTime?;
    _primaryGoals = getDataList(snapshotData['primary_goals']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRefs = getDataList(snapshotData['user_refs']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('couples');

  static Stream<CouplesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CouplesRecord.fromSnapshot(s));

  static Future<CouplesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CouplesRecord.fromSnapshot(s));

  static CouplesRecord fromSnapshot(DocumentSnapshot snapshot) => CouplesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CouplesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CouplesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CouplesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CouplesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCouplesRecordData({
  DateTime? relationshipStartDate,
  String? relationshipDuration,
  DateTime? anniversaryDate,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'relationship_start_date': relationshipStartDate,
      'relationship_duration': relationshipDuration,
      'anniversary_date': anniversaryDate,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CouplesRecordDocumentEquality implements Equality<CouplesRecord> {
  const CouplesRecordDocumentEquality();

  @override
  bool equals(CouplesRecord? e1, CouplesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.relationshipStartDate == e2?.relationshipStartDate &&
        e1?.relationshipDuration == e2?.relationshipDuration &&
        e1?.anniversaryDate == e2?.anniversaryDate &&
        listEquality.equals(e1?.primaryGoals, e2?.primaryGoals) &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.userRefs, e2?.userRefs);
  }

  @override
  int hash(CouplesRecord? e) => const ListEquality().hash([
        e?.relationshipStartDate,
        e?.relationshipDuration,
        e?.anniversaryDate,
        e?.primaryGoals,
        e?.createdAt,
        e?.userRefs
      ]);

  @override
  bool isValidKey(Object? o) => o is CouplesRecord;
}
