import '/components/bottom_nav3/bottom_nav3_widget.dart';
import '/components/button/button_widget.dart';
import '/components/quick_action/quick_action_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_dashboard_widget.dart' show HomeDashboardWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeDashboardModel extends FlutterFlowModel<HomeDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Button.
  late ButtonModel buttonModel;
  // Model for QuickAction.
  late QuickActionModel quickActionModel1;
  // Model for QuickAction.
  late QuickActionModel quickActionModel2;
  // Model for QuickAction.
  late QuickActionModel quickActionModel3;
  // Model for QuickAction.
  late QuickActionModel quickActionModel4;
  // Model for BottomNav.
  late BottomNav3Model bottomNavModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
    quickActionModel1 = createModel(context, () => QuickActionModel());
    quickActionModel2 = createModel(context, () => QuickActionModel());
    quickActionModel3 = createModel(context, () => QuickActionModel());
    quickActionModel4 = createModel(context, () => QuickActionModel());
    bottomNavModel = createModel(context, () => BottomNav3Model());
  }

  @override
  void dispose() {
    buttonModel.dispose();
    quickActionModel1.dispose();
    quickActionModel2.dispose();
    quickActionModel3.dispose();
    quickActionModel4.dispose();
    bottomNavModel.dispose();
  }
}
