import '/backend/backend.dart';
import '/components/appreciation_card/appreciation_card_widget.dart';
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/button/button_widget.dart';
import '/components/journal_entry/journal_entry_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'appreciation_journal_widget.dart' show AppreciationJournalWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppreciationJournalModel
    extends FlutterFlowModel<AppreciationJournalWidget> {
  ///  Local state fields for this page.

  String? draftMessage;

  String? selectedCategory = 'Gratitude';

  bool? isJournal = false;

  String? error;

  ///  State fields for stateful widgets in this page.

  // Model for TextField.
  late TextFieldModel textFieldModel;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
    buttonModel = createModel(context, () => ButtonModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    textFieldModel.dispose();
    buttonModel.dispose();
    bottomNavModel.dispose();
  }
}
