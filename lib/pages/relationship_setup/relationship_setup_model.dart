import '/components/button/button_model.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'relationship_setup_widget.dart' show RelationshipSetupWidget;
import 'package:flutter/material.dart';

class RelationshipSetupModel extends FlutterFlowModel<RelationshipSetupWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Relationship Start Date.
  DateTime? relationshipStartDate;
  // State field(s) for ChoiceChips widget.
  String? durationValue;
  // State field(s) for MultiSelect widget.
  List<String>? focusValues;
  // State field(s) for Anniversary Date.
  DateTime? anniversaryDate;
  // State field(s) for Important Dates.
  List<Map<String, dynamic>> importantDates = [];
  // Model for Button component.
  ButtonModel? buttonModel;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buttonModel?.dispose();
  }
}
