import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JournalEntriesRecord extends FirestoreRecord {
  JournalEntriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "moodIcon" field.
  String? _moodIcon;
  String get moodIcon => _moodIcon ?? '';
  bool hasMoodIcon() => _moodIcon != null;

  // "authorId" field.
  String? _authorId;
  String get authorId => _authorId ?? '';
  bool hasAuthorId() => _authorId != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _date = snapshotData['date'] as String?;
    _content = snapshotData['content'] as String?;
    _moodIcon = snapshotData['moodIcon'] as String?;
    _authorId = snapshotData['authorId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('journal_entries');

  static Stream<JournalEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JournalEntriesRecord.fromSnapshot(s));

  static Future<JournalEntriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JournalEntriesRecord.fromSnapshot(s));

  static JournalEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JournalEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JournalEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JournalEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JournalEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JournalEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJournalEntriesRecordData({
  String? title,
  String? date,
  String? content,
  String? moodIcon,
  String? authorId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'date': date,
      'content': content,
      'moodIcon': moodIcon,
      'authorId': authorId,
    }.withoutNulls,
  );

  return firestoreData;
}

class JournalEntriesRecordDocumentEquality
    implements Equality<JournalEntriesRecord> {
  const JournalEntriesRecordDocumentEquality();

  @override
  bool equals(JournalEntriesRecord? e1, JournalEntriesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.date == e2?.date &&
        e1?.content == e2?.content &&
        e1?.moodIcon == e2?.moodIcon &&
        e1?.authorId == e2?.authorId;
  }

  @override
  int hash(JournalEntriesRecord? e) => const ListEquality()
      .hash([e?.title, e?.date, e?.content, e?.moodIcon, e?.authorId]);

  @override
  bool isValidKey(Object? o) => o is JournalEntriesRecord;
}
