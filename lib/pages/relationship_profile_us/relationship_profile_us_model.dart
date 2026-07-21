import '/components/accordion_item/accordion_item_widget.dart';
import '/components/bottom_nav6/bottom_nav6_widget.dart';
import '/components/button/button_widget.dart';
import '/components/goal_progress/goal_progress_widget.dart';
import '/components/info_tile/info_tile_widget.dart';
import '/components/profile_header/profile_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'relationship_profile_us_widget.dart' show RelationshipProfileUsWidget;
import 'package:flutter/material.dart';

class RelationshipProfileUsModel
    extends FlutterFlowModel<RelationshipProfileUsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ProfileHeader.
  late ProfileHeaderModel profileHeaderModel;
  // Model for InfoTile.
  late InfoTileModel infoTileModel1;
  // Model for InfoTile.
  late InfoTileModel infoTileModel2;
  // Model for InfoTile.
  late InfoTileModel infoTileModel3;
  // Model for GoalProgress.
  late GoalProgressModel goalProgressModel1;
  // Model for GoalProgress.
  late GoalProgressModel goalProgressModel2;
  // Model for AccordionItem.
  late AccordionItemModel accordionItemModel1;
  // Model for AccordionItem.
  late AccordionItemModel accordionItemModel2;
  // Model for AccordionItem.
  late AccordionItemModel accordionItemModel3;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for BottomNav.
  late BottomNav6Model bottomNavModel;

  @override
  void initState(BuildContext context) {
    profileHeaderModel = createModel(context, () => ProfileHeaderModel());
    infoTileModel1 = createModel(context, () => InfoTileModel());
    infoTileModel2 = createModel(context, () => InfoTileModel());
    infoTileModel3 = createModel(context, () => InfoTileModel());
    goalProgressModel1 = createModel(context, () => GoalProgressModel());
    goalProgressModel2 = createModel(context, () => GoalProgressModel());
    accordionItemModel1 = createModel(context, () => AccordionItemModel());
    accordionItemModel2 = createModel(context, () => AccordionItemModel());
    accordionItemModel3 = createModel(context, () => AccordionItemModel());
    buttonModel = createModel(context, () => ButtonModel());
    bottomNavModel = createModel(context, () => BottomNav6Model());
  }

  @override
  void dispose() {
    profileHeaderModel.dispose();
    infoTileModel1.dispose();
    infoTileModel2.dispose();
    infoTileModel3.dispose();
    goalProgressModel1.dispose();
    goalProgressModel2.dispose();
    accordionItemModel1.dispose();
    accordionItemModel2.dispose();
    accordionItemModel3.dispose();
    buttonModel.dispose();
    bottomNavModel.dispose();
  }
}
