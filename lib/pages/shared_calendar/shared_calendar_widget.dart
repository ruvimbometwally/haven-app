import '/backend/backend.dart';
import '/components/agenda_card/agenda_card_widget.dart';
import '/components/bottom_nav7/bottom_nav7_widget.dart';
import '/components/day_cell/day_cell_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'shared_calendar_model.dart';
export 'shared_calendar_model.dart';

class SharedCalendarWidget extends StatefulWidget {
  const SharedCalendarWidget({super.key});

  static String routeName = 'SharedCalendar';
  static String routePath = '/sharedCalendar';

  @override
  State<SharedCalendarWidget> createState() => _SharedCalendarWidgetState();
}

class _SharedCalendarWidgetState extends State<SharedCalendarWidget> {
  late SharedCalendarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SharedCalendarModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: const SideNavWidget(
          selectedPage: 'SharedCalendar',
        ),
        bottomNavigationBar: wrapWithModel(
          model: _model.bottomNavModel,
          updateCallback: () => safeSetState(() {}),
          child: const BottomNav7Widget(),
        ),
        body: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    24.0, 24.0, 24.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.menu_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .onPrimaryContainer,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                scaffoldKey.currentState!.openDrawer();
                              },
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              'Shared Calendar',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle:
                                          FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .onPrimaryContainer,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                    lineHeight: 1.3,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'October 2024',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight:
                                          FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .fontWeight,
                                      fontStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight:
                                        FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                    fontStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                    lineHeight: 1.4,
                                  ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryText,
                              size: 20.0,
                            ),
                          ].divide(const SizedBox(width: 4.0)),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: Colors.transparent,
                          icon: Icon(
                            Icons.search_rounded,
                            color: FlutterFlowTheme.of(context)
                                .onPrimaryContainer,
                            size: 22.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: Colors.transparent,
                          icon: Icon(
                            Icons.settings_rounded,
                            color: FlutterFlowTheme.of(context)
                                .onPrimaryContainer,
                            size: 22.0,
                          ),
                          onPressed: () async {
                            context.goNamed(
                                SettingsPrivacyWidget.routeName);
                          },
                        ),
                      ].divide(const SizedBox(width: 8.0)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    24.0, 0.0, 24.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (var day in ['M', 'T', 'W', 'T', 'F', 'S', 'S'])
                          SizedBox(
                            width: 44.0,
                            child: Text(
                              day,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight:
                                          FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .fontWeight,
                                      fontStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.dayCellModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: const DayCellWidget(
                            isSelected: false,
                            day: '14',
                            isToday: false,
                            hasEvent: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.dayCellModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: const DayCellWidget(
                            isSelected: false,
                            day: '15',
                            isToday: false,
                            hasEvent: true,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.dayCellModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: const DayCellWidget(
                            isSelected: false,
                            day: '16',
                            isToday: true,
                            hasEvent: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.dayCellModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: const DayCellWidget(
                            isSelected: true,
                            day: '17',
                            isToday: false,
                            hasEvent: true,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.dayCellModel5,
                          updateCallback: () => safeSetState(() {}),
                          child: const DayCellWidget(
                            isSelected: false,
                            day: '18',
                            isToday: false,
                            hasEvent: true,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.dayCellModel6,
                          updateCallback: () => safeSetState(() {}),
                          child: const DayCellWidget(
                            isSelected: false,
                            day: '19',
                            isToday: false,
                            hasEvent: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.dayCellModel7,
                          updateCallback: () => safeSetState(() {}),
                          child: const DayCellWidget(
                            isSelected: false,
                            day: '20',
                            isToday: false,
                            hasEvent: false,
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: StreamBuilder<List<EventsRecord>>(
                          stream: queryEventsRecord(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            List<EventsRecord>
                                columnPaddingEventsRecordList =
                                snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Upcoming Events',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            color:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                            lineHeight: 1.3,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.inbox_rounded,
                                            size: 24.0,
                                          ),
                                          Text(
                                            'Nothing here yet',
                                            textAlign: TextAlign.center,
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts
                                                          .plusJakartaSans(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                      lineHeight: 1.4,
                                                    ),
                                          ),
                                          Text(
                                            'Items you add will appear here.',
                                            textAlign: TextAlign.center,
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts
                                                          .outfit(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                      lineHeight: 1.5,
                                                    ),
                                          ),
                                        ].divide(const SizedBox(
                                            height: 16.0)),
                                      ),
                                    ),

                                    // ff_lite_listview_data:${events.all}
                                    StreamBuilder<List<EventsRecord>>(
                                      stream: queryEventsRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return const Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        }
                                        List<EventsRecord>
                                            listViewEventsRecordList =
                                            snapshot.data!;

                                        return Builder(
                                          builder: (context) {
                                            final item =
                                                listViewEventsRecordList
                                                    .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection:
                                                  Axis.vertical,
                                              itemCount: item.length,
                                              itemBuilder:
                                                  (context, itemIndex) {
                                                final itemItem =
                                                    item[itemIndex];
                                                return AgendaCardWidget(
                                                  key: Key(
                                                      'Key973_${itemIndex}_of_${item.length}'),
                                                  tone: const Color(
                                                      0x00000000),
                                                  icon: Icon(
                                                    Icons.favorite_rounded,
                                                    color:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  title: itemItem.title,
                                                  time: itemItem.startTime,
                                                  category:
                                                      itemItem.category,
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ].divide(const SizedBox(height: 16.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Next Week',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            color:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                            lineHeight: 1.3,
                                          ),
                                    ),
                                    wrapWithModel(
                                      model: _model.agendaCardModel2,
                                      updateCallback: () =>
                                          safeSetState(() {}),
                                      child: AgendaCardWidget(
                                        tone: FlutterFlowTheme.of(context)
                                            .secondary,
                                        icon: Icon(
                                          Icons.medical_services_rounded,
                                          color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          size: 24.0,
                                        ),
                                        title: 'Alex\'s Dentist Appt',
                                        time: '10:00 AM',
                                        category: 'Appointments',
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.agendaCardModel3,
                                      updateCallback: () =>
                                          safeSetState(() {}),
                                      child: AgendaCardWidget(
                                        tone: const Color(0x00000000),
                                        icon: Icon(
                                          Icons.cake_rounded,
                                          color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          size: 24.0,
                                        ),
                                        title: 'Sarah\'s Birthday',
                                        time: 'All Day',
                                        category: 'Birthdays',
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 16.0)),
                                ),
                              ].divide(const SizedBox(height: 24.0)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
