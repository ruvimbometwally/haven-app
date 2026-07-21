import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListItemsRecord extends FirestoreRecord {
  ListItemsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "isChecked" field.
  bool? _isChecked;
  bool get isChecked => _isChecked ?? false;
  bool hasIsChecked() => _isChecked != null;

  // "listId" field.
  String? _listId;
  String get listId => _listId ?? '';
  bool hasListId() => _listId != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _isChecked = snapshotData['isChecked'] as bool?;
    _listId = snapshotData['listId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('list_items');

  static Stream<ListItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListItemsRecord.fromSnapshot(s));

  static Future<ListItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListItemsRecord.fromSnapshot(s));

  static ListItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListItemsRecordData({
  String? content,
  bool? isChecked,
  String? listId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'isChecked': isChecked,
      'listId': listId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListItemsRecordDocumentEquality implements Equality<ListItemsRecord> {
  const ListItemsRecordDocumentEquality();

  @override
  bool equals(ListItemsRecord? e1, ListItemsRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.isChecked == e2?.isChecked &&
        e1?.listId == e2?.listId;
  }

  @override
  int hash(ListItemsRecord? e) =>
      const ListEquality().hash([e?.content, e?.isChecked, e?.listId]);

  @override
  bool isValidKey(Object? o) => o is ListItemsRecord;
}
