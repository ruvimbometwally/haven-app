import '/components/agenda_card/agenda_card_widget.dart';
import '/components/bottom_nav7/bottom_nav7_widget.dart';
import '/components/day_cell/day_cell_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'shared_calendar_widget.dart' show SharedCalendarWidget;
import 'package:flutter/material.dart';

class SharedCalendarModel extends FlutterFlowModel<SharedCalendarWidget> {
  ///  Local state fields for this page.

  String? eventTitle;

  String? eventDate;

  String? eventCategory;

  String? error;

  ///  State fields for stateful widgets in this page.

  // Model for DayCell.
  late DayCellModel dayCellModel1;
  // Model for DayCell.
  late DayCellModel dayCellModel2;
  // Model for DayCell.
  late DayCellModel dayCellModel3;
  // Model for DayCell.
  late DayCellModel dayCellModel4;
  // Model for DayCell.
  late DayCellModel dayCellModel5;
  // Model for DayCell.
  late DayCellModel dayCellModel6;
  // Model for DayCell.
  late DayCellModel dayCellModel7;
  // Model for AgendaCard.
  late AgendaCardModel agendaCardModel2;
  // Model for AgendaCard.
  late AgendaCardModel agendaCardModel3;
  // Model for BottomNav.
  late BottomNav7Model bottomNavModel;

  @override
  void initState(BuildContext context) {
    dayCellModel1 = createModel(context, () => DayCellModel());
    dayCellModel2 = createModel(context, () => DayCellModel());
    dayCellModel3 = createModel(context, () => DayCellModel());
    dayCellModel4 = createModel(context, () => DayCellModel());
    dayCellModel5 = createModel(context, () => DayCellModel());
    dayCellModel6 = createModel(context, () => DayCellModel());
    dayCellModel7 = createModel(context, () => DayCellModel());
    agendaCardModel2 = createModel(context, () => AgendaCardModel());
    agendaCardModel3 = createModel(context, () => AgendaCardModel());
    bottomNavModel = createModel(context, () => BottomNav7Model());
  }

  @override
  void dispose() {
    dayCellModel1.dispose();
    dayCellModel2.dispose();
    dayCellModel3.dispose();
    dayCellModel4.dispose();
    dayCellModel5.dispose();
    dayCellModel6.dispose();
    dayCellModel7.dispose();
    agendaCardModel2.dispose();
    agendaCardModel3.dispose();
    bottomNavModel.dispose();
  }
}
