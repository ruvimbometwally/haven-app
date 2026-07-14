import '/backend/backend.dart';
import '/components/bottom_nav5/bottom_nav5_widget.dart';
import '/components/button/button_widget.dart';
import '/components/list_category/list_category_widget.dart';
import '/components/note_item/note_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'planning_lists_widget.dart' show PlanningListsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlanningListsModel extends FlutterFlowModel<PlanningListsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ListCategory.
  late ListCategoryModel listCategoryModel1;
  // Model for ListCategory.
  late ListCategoryModel listCategoryModel2;
  // Model for ListCategory.
  late ListCategoryModel listCategoryModel3;
  // Model for ListCategory.
  late ListCategoryModel listCategoryModel4;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for NoteItem.
  late NoteItemModel noteItemModel;
  // Model for BottomNav.
  late BottomNav5Model bottomNavModel;

  @override
  void initState(BuildContext context) {
    listCategoryModel1 = createModel(context, () => ListCategoryModel());
    listCategoryModel2 = createModel(context, () => ListCategoryModel());
    listCategoryModel3 = createModel(context, () => ListCategoryModel());
    listCategoryModel4 = createModel(context, () => ListCategoryModel());
    buttonModel = createModel(context, () => ButtonModel());
    noteItemModel = createModel(context, () => NoteItemModel());
    bottomNavModel = createModel(context, () => BottomNav5Model());
  }

  @override
  void dispose() {
    listCategoryModel1.dispose();
    listCategoryModel2.dispose();
    listCategoryModel3.dispose();
    listCategoryModel4.dispose();
    buttonModel.dispose();
    noteItemModel.dispose();
    bottomNavModel.dispose();
  }
}
