import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromptResponsesRecord extends FirestoreRecord {
  PromptResponsesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "couple_ref" field.
  DocumentReference? _coupleRef;
  DocumentReference? get coupleRef => _coupleRef;
  bool hasCoupleRef() => _coupleRef != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "prompt_text" field.
  String? _promptText;
  String get promptText => _promptText ?? '';
  bool hasPromptText() => _promptText != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _coupleRef = snapshotData['couple_ref'] as DocumentReference?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _promptText = snapshotData['prompt_text'] as String?;
    _answer = snapshotData['answer'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prompt_responses');

  static Stream<PromptResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromptResponsesRecord.fromSnapshot(s));

  static Future<PromptResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromptResponsesRecord.fromSnapshot(s));

  static PromptResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromptResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromptResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromptResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromptResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromptResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromptResponsesRecordData({
  DocumentReference? coupleRef,
  DocumentReference? userRef,
  String? promptText,
  String? answer,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'couple_ref': coupleRef,
      'user_ref': userRef,
      'prompt_text': promptText,
      'answer': answer,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromptResponsesRecordDocumentEquality
    implements Equality<PromptResponsesRecord> {
  const PromptResponsesRecordDocumentEquality();

  @override
  bool equals(PromptResponsesRecord? e1, PromptResponsesRecord? e2) {
    return e1?.coupleRef == e2?.coupleRef &&
        e1?.userRef == e2?.userRef &&
        e1?.promptText == e2?.promptText &&
        e1?.answer == e2?.answer &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(PromptResponsesRecord? e) => const ListEquality()
      .hash([e?.coupleRef, e?.userRef, e?.promptText, e?.answer, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is PromptResponsesRecord;
}
