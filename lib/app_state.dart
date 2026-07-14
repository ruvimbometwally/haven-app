import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _currentMood = 'Peaceful';
  String get currentMood => _currentMood;
  set currentMood(String value) {
    _currentMood = value;
  }

  String _relationshipStartDate = '2021-10-14';
  String get relationshipStartDate => _relationshipStartDate;
  set relationshipStartDate(String value) {
    _relationshipStartDate = value;
  }

  String _anniversaryDate = '2024-10-14';
  String get anniversaryDate => _anniversaryDate;
  set anniversaryDate(String value) {
    _anniversaryDate = value;
  }

  String _activeMemoryFilter = 'All';
  String get activeMemoryFilter => _activeMemoryFilter;
  set activeMemoryFilter(String value) {
    _activeMemoryFilter = value;
  }

  String _chatDraft = '';
  String get chatDraft => _chatDraft;
  set chatDraft(String value) {
    _chatDraft = value;
  }
}
