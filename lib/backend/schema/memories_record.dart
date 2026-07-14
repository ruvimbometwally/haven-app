import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemoriesRecord extends FirestoreRecord {
  MemoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  bool hasCaption() => _caption != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "albumId" field.
  String? _albumId;
  String get albumId => _albumId ?? '';
  bool hasAlbumId() => _albumId != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _date = snapshotData['date'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _caption = snapshotData['caption'] as String?;
    _location = snapshotData['location'] as String?;
    _albumId = snapshotData['albumId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('memories');

  static Stream<MemoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MemoriesRecord.fromSnapshot(s));

  static Future<MemoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MemoriesRecord.fromSnapshot(s));

  static MemoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MemoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MemoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MemoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MemoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MemoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMemoriesRecordData({
  String? title,
  String? date,
  String? imageUrl,
  String? caption,
  String? location,
  String? albumId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'date': date,
      'imageUrl': imageUrl,
      'caption': caption,
      'location': location,
      'albumId': albumId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MemoriesRecordDocumentEquality implements Equality<MemoriesRecord> {
  const MemoriesRecordDocumentEquality();

  @override
  bool equals(MemoriesRecord? e1, MemoriesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.date == e2?.date &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.caption == e2?.caption &&
        e1?.location == e2?.location &&
        e1?.albumId == e2?.albumId;
  }

  @override
  int hash(MemoriesRecord? e) => const ListEquality().hash(
      [e?.title, e?.date, e?.imageUrl, e?.caption, e?.location, e?.albumId]);

  @override
  bool isValidKey(Object? o) => o is MemoriesRecord;
}
