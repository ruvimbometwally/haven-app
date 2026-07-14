import '/components/switch_component/switch_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'settings_group3_widget.dart' show SettingsGroup3Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsGroup3Model extends FlutterFlowModel<SettingsGroup3Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for Switch.
  late SwitchComponentModel switchModel1;
  // Model for Switch.
  late SwitchComponentModel switchModel2;
  // Model for Switch.
  late SwitchComponentModel switchModel3;

  @override
  void initState(BuildContext context) {
    switchModel1 = createModel(context, () => SwitchComponentModel());
    switchModel2 = createModel(context, () => SwitchComponentModel());
    switchModel3 = createModel(context, () => SwitchComponentModel());
  }

  @override
  void dispose() {
    switchModel1.dispose();
    switchModel2.dispose();
    switchModel3.dispose();
  }
}
