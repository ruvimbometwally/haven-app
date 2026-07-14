import '/components/button/button_widget.dart';
import '/components/settings_group/settings_group_widget.dart';
import '/components/settings_group2/settings_group2_widget.dart';
import '/components/settings_group3/settings_group3_widget.dart';
import '/components/settings_group4/settings_group4_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'settings_privacy_widget.dart' show SettingsPrivacyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsPrivacyModel extends FlutterFlowModel<SettingsPrivacyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SettingsGroup.
  late SettingsGroupModel settingsGroupModel;
  // Model for SettingsGroupSec.
  late SettingsGroup2Model settingsGroupSecModel;
  // Model for SettingsGroupNot.
  late SettingsGroup3Model settingsGroupNotModel;
  // Model for SettingsGroupAcc.
  late SettingsGroup4Model settingsGroupAccModel;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    settingsGroupModel = createModel(context, () => SettingsGroupModel());
    settingsGroupSecModel = createModel(context, () => SettingsGroup2Model());
    settingsGroupNotModel = createModel(context, () => SettingsGroup3Model());
    settingsGroupAccModel = createModel(context, () => SettingsGroup4Model());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    settingsGroupModel.dispose();
    settingsGroupSecModel.dispose();
    settingsGroupNotModel.dispose();
    settingsGroupAccModel.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
