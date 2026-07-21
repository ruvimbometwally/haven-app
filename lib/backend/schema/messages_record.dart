import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "senderId" field.
  String? _senderId;
  String get senderId => _senderId ?? '';
  bool hasSenderId() => _senderId != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  bool hasTimestamp() => _timestamp != null;

  // "mediaUrl" field.
  String? _mediaUrl;
  String get mediaUrl => _mediaUrl ?? '';
  bool hasMediaUrl() => _mediaUrl != null;

  // "isVoiceNote" field.
  bool? _isVoiceNote;
  bool get isVoiceNote => _isVoiceNote ?? false;
  bool hasIsVoiceNote() => _isVoiceNote != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _senderId = snapshotData['senderId'] as String?;
    _timestamp = snapshotData['timestamp'] as String?;
    _mediaUrl = snapshotData['mediaUrl'] as String?;
    _isVoiceNote = snapshotData['isVoiceNote'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  String? content,
  String? senderId,
  String? timestamp,
  String? mediaUrl,
  bool? isVoiceNote,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'senderId': senderId,
      'timestamp': timestamp,
      'mediaUrl': mediaUrl,
      'isVoiceNote': isVoiceNote,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.senderId == e2?.senderId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.mediaUrl == e2?.mediaUrl &&
        e1?.isVoiceNote == e2?.isVoiceNote;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash(
      [e?.content, e?.senderId, e?.timestamp, e?.mediaUrl, e?.isVoiceNote]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
