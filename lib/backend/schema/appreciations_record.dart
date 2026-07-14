import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppreciationsRecord extends FirestoreRecord {
  AppreciationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "senderId" field.
  String? _senderId;
  String get senderId => _senderId ?? '';
  bool hasSenderId() => _senderId != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "toneColor" field.
  String? _toneColor;
  String get toneColor => _toneColor ?? '';
  bool hasToneColor() => _toneColor != null;

  void _initializeFields() {
    _senderId = snapshotData['senderId'] as String?;
    _message = snapshotData['message'] as String?;
    _category = snapshotData['category'] as String?;
    _toneColor = snapshotData['toneColor'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appreciations');

  static Stream<AppreciationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppreciationsRecord.fromSnapshot(s));

  static Future<AppreciationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppreciationsRecord.fromSnapshot(s));

  static AppreciationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppreciationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppreciationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppreciationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppreciationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppreciationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppreciationsRecordData({
  String? senderId,
  String? message,
  String? category,
  String? toneColor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'senderId': senderId,
      'message': message,
      'category': category,
      'toneColor': toneColor,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppreciationsRecordDocumentEquality
    implements Equality<AppreciationsRecord> {
  const AppreciationsRecordDocumentEquality();

  @override
  bool equals(AppreciationsRecord? e1, AppreciationsRecord? e2) {
    return e1?.senderId == e2?.senderId &&
        e1?.message == e2?.message &&
        e1?.category == e2?.category &&
        e1?.toneColor == e2?.toneColor;
  }

  @override
  int hash(AppreciationsRecord? e) => const ListEquality()
      .hash([e?.senderId, e?.message, e?.category, e?.toneColor]);

  @override
  bool isValidKey(Object? o) => o is AppreciationsRecord;
}
