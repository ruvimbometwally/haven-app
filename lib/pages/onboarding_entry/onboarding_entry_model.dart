import '/components/button/button_widget.dart';
import '/components/onboarding_page/onboarding_page_widget.dart';
import '/components/progress_dots/progress_dots_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'onboarding_entry_widget.dart' show OnboardingEntryWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingEntryModel extends FlutterFlowModel<OnboardingEntryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for OnboardingPage.
  late OnboardingPageModel onboardingPageModel;
  // Model for ProgressDots.
  late ProgressDotsModel progressDotsModel;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for Button.
  late ButtonModel buttonModel3;

  @override
  void initState(BuildContext context) {
    onboardingPageModel = createModel(context, () => OnboardingPageModel());
    progressDotsModel = createModel(context, () => ProgressDotsModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    buttonModel3 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    onboardingPageModel.dispose();
    progressDotsModel.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
    buttonModel3.dispose();
  }
}
