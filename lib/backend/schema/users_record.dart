import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  bool hasAvatar() => _avatar != null;

  // "mood" field.
  String? _mood;
  String get mood => _mood ?? '';
  bool hasMood() => _mood != null;

  // "loveLanguages" field.
  List<String>? _loveLanguages;
  List<String> get loveLanguages => _loveLanguages ?? const [];
  bool hasLoveLanguages() => _loveLanguages != null;

  // "partnerId" field.
  String? _partnerId;
  String get partnerId => _partnerId ?? '';
  bool hasPartnerId() => _partnerId != null;

  // "invite_code" field.
  String? _inviteCode;
  String get inviteCode => _inviteCode ?? '';
  bool hasInviteCode() => _inviteCode != null;

  // "couple_ref" field.
  DocumentReference? _coupleRef;
  DocumentReference? get coupleRef => _coupleRef;
  bool hasCoupleRef() => _coupleRef != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _name = snapshotData['name'] as String?;
    _avatar = snapshotData['avatar'] as String?;
    _mood = snapshotData['mood'] as String?;
    _loveLanguages = getDataList(snapshotData['loveLanguages']);
    _partnerId = snapshotData['partnerId'] as String?;
    _inviteCode = snapshotData['invite_code'] as String?;
    _coupleRef = snapshotData['couple_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? name,
  String? avatar,
  String? mood,
  String? partnerId,
  String? inviteCode,
  DocumentReference? coupleRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'name': name,
      'avatar': avatar,
      'mood': mood,
      'partnerId': partnerId,
      'invite_code': inviteCode,
      'couple_ref': coupleRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.name == e2?.name &&
        e1?.avatar == e2?.avatar &&
        e1?.mood == e2?.mood &&
        listEquality.equals(e1?.loveLanguages, e2?.loveLanguages) &&
        e1?.partnerId == e2?.partnerId &&
        e1?.inviteCode == e2?.inviteCode &&
        e1?.coupleRef == e2?.coupleRef;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.name,
        e?.avatar,
        e?.mood,
        e?.loveLanguages,
        e?.partnerId,
        e?.inviteCode,
        e?.coupleRef
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
