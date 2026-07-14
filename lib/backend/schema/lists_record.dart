import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListsRecord extends FirestoreRecord {
  ListsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "iconName" field.
  String? _iconName;
  String get iconName => _iconName ?? '';
  bool hasIconName() => _iconName != null;

  // "colorHex" field.
  String? _colorHex;
  String get colorHex => _colorHex ?? '';
  bool hasColorHex() => _colorHex != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _iconName = snapshotData['iconName'] as String?;
    _colorHex = snapshotData['colorHex'] as String?;
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lists');

  static Stream<ListsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListsRecord.fromSnapshot(s));

  static Future<ListsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListsRecord.fromSnapshot(s));

  static ListsRecord fromSnapshot(DocumentSnapshot snapshot) => ListsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListsRecordData({
  String? title,
  String? iconName,
  String? colorHex,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'iconName': iconName,
      'colorHex': colorHex,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListsRecordDocumentEquality implements Equality<ListsRecord> {
  const ListsRecordDocumentEquality();

  @override
  bool equals(ListsRecord? e1, ListsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.iconName == e2?.iconName &&
        e1?.colorHex == e2?.colorHex &&
        e1?.type == e2?.type;
  }

  @override
  int hash(ListsRecord? e) =>
      const ListEquality().hash([e?.title, e?.iconName, e?.colorHex, e?.type]);

  @override
  bool isValidKey(Object? o) => o is ListsRecord;
}
