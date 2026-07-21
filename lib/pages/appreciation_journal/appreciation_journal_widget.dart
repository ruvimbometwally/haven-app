import '/backend/backend.dart';
import '/components/appreciation_card/appreciation_card_widget.dart';
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/button/button_widget.dart';
import '/components/journal_entry/journal_entry_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appreciation_journal_model.dart';
export 'appreciation_journal_model.dart';

class AppreciationJournalWidget extends StatefulWidget {
  const AppreciationJournalWidget({super.key});

  static String routeName = 'AppreciationJournal';
  static String routePath = '/appreciationJournal';

  @override
  State<AppreciationJournalWidget> createState() =>
      _AppreciationJournalWidgetState();
}

class _AppreciationJournalWidgetState extends State<AppreciationJournalWidget> {
  late AppreciationJournalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppreciationJournalModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AppreciationsRecord>>(
      stream: queryAppreciationsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: const SideNavWidget(
              selectedPage: 'AppreciationJournal',
            ),
            bottomNavigationBar: wrapWithModel(
              model: _model.bottomNavModel,
              updateCallback: () => safeSetState(() {}),
              child: const BottomNavWidget(),
            ),
            body: SafeArea(
              top: false,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                      .primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                              const SizedBox(width: 8.0),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Appreciation & Journal',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts
                                              .plusJakartaSans(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          color: FlutterFlowTheme.of(
                                                  context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'Small notes of love and shared reflections.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.outfit(
                                            fontWeight:
                                                FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(
                                                  context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          lineHeight: 1.6,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ],
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            fillColor: Colors.transparent,
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 24.0, 24.0),
                      child: StreamBuilder<List<JournalEntriesRecord>>(
                        stream: queryJournalEntriesRecord(),
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
                          List<JournalEntriesRecord>
                              columnPaddingJournalEntriesRecordList =
                              snapshot.data!;

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Send Appreciation',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts
                                                  .plusJakartaSans(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                      Text(
                                        'View All',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .fontWeight,
                                                fontStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .fontStyle,
                                              ),
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .fontWeight,
                                              fontStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .fontStyle,
                                              lineHeight: 1.3,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.selectedCategory =
                                                'Gratitude';
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 140.0,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisSize:
                                                    MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.card_giftcard_rounded,
                                                    size: 32.0,
                                                  ),
                                                  Text(
                                                    'Digital Card',
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .labelLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              FlutterFlowTheme.of(context)
                                                                  .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                          lineHeight: 1.3,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(
                                                    height: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.selectedCategory =
                                                'Affirmation';
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 140.0,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisSize:
                                                    MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .self_improvement_rounded,
                                                    size: 32.0,
                                                  ),
                                                  Text(
                                                    'Daily Affirmation',
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .labelLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              FlutterFlowTheme.of(context)
                                                                  .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                          lineHeight: 1.3,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(
                                                    height: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.selectedCategory =
                                                'Handwritten';
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 140.0,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisSize:
                                                    MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.help,
                                                    size: 32.0,
                                                  ),
                                                  Text(
                                                    'Handwritten',
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .labelLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              FlutterFlowTheme.of(context)
                                                                  .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                          lineHeight: 1.3,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(
                                                    height: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  wrapWithModel(
                                    model: _model.textFieldModel,
                                    updateCallback: () =>
                                        safeSetState(() {}),
                                    child: TextFieldWidget(
                                      label: 'Your Message',
                                      labelPresent: true,
                                      helper: '',
                                      helperPresent: false,
                                      leadingIconPresent: false,
                                      trailingIconPresent: false,
                                      hint: 'Write something sweet...',
                                      value: _model.draftMessage,
                                      onChange: '',
                                      onSubmit: '',
                                      variant: 'outlined',
                                      error: false,
                                    ),
                                  ),
                                  if (_model.error != null &&
                                      _model.error != '')
                                    Text(
                                      _model.error!,
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
                                            color: FlutterFlowTheme.of(
                                                    context)
                                                .error,
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(
                                                    context)
                                                .labelSmall
                                                .fontWeight,
                                            fontStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelSmall
                                                .fontStyle,
                                            lineHeight: 1.2,
                                          ),
                                    ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Received Recently',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          font: GoogleFonts.outfit(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
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
                                          style: FlutterFlowTheme.of(context)
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
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .fontWeight,
                                                fontStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .fontStyle,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                        Text(
                                          'Items you add will appear here.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                font: GoogleFonts.outfit(
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
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .fontWeight,
                                                fontStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .fontStyle,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ].divide(const SizedBox(height: 16.0)),
                                    ),
                                  ),

                                  // ff_lite_listview_data:${appreciations.all}
                                  StreamBuilder<List<AppreciationsRecord>>(
                                    stream: queryAppreciationsRecord(),
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
                                      List<AppreciationsRecord>
                                          listViewAppreciationsRecordList =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final item =
                                              listViewAppreciationsRecordList
                                                  .toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: item.length,
                                            itemBuilder:
                                                (context, itemIndex) {
                                              final itemItem =
                                                  item[itemIndex];
                                              return AppreciationCardWidget(
                                                key: Key(
                                                    'Key76_${itemIndex}_of_${item.length}'),
                                                tone: colorFromCssString(
                                                  itemItem.toneColor,
                                                ),
                                                category: itemItem.category,
                                                message: itemItem.message,
                                                sender: 'Partner',
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Our Journal',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts
                                                  .plusJakartaSans(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isJournal = true;
                                          safeSetState(() {});
                                        },
                                        child: wrapWithModel(
                                          model: _model.buttonModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ButtonWidget(
                                            icon: Icon(
                                              Icons.edit_note_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .primaryText,
                                              size: 24.0,
                                            ),
                                            iconPresent: true,
                                            iconEndPresent: false,
                                            content: 'New Entry',
                                            variant: 'ghost',
                                            size: 'small',
                                            fullWidth: false,
                                            loading: false,
                                            disabled: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: StreamBuilder<
                                        List<JournalEntriesRecord>>(
                                      stream: queryJournalEntriesRecord(),
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
                                        List<JournalEntriesRecord>
                                            columnJournalEntriesRecordList =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: List.generate(
                                              columnJournalEntriesRecordList
                                                  .length, (columnIndex) {
                                            return const Icon(
                                              Icons.inbox_rounded,
                                              size: 24.0,
                                            );
                                          }).divide(const SizedBox(
                                              height: 16.0)),
                                        );
                                      },
                                    ),
                                  ),

                                  // ff_lite_listview_data:${journal_entries.all}
                                  StreamBuilder<List<JournalEntriesRecord>>(
                                    stream: queryJournalEntriesRecord(),
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
                                      List<JournalEntriesRecord>
                                          listViewJournalEntriesRecordList =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final item =
                                              listViewJournalEntriesRecordList
                                                  .toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: item.length,
                                            itemBuilder:
                                                (context, itemIndex) {
                                              final itemItem =
                                                  item[itemIndex];
                                              return JournalEntryWidget(
                                                key: Key(
                                                    'Key109_${itemIndex}_of_${item.length}'),
                                                date: itemItem.date,
                                                moodIcon: Icon(
                                                  Icons.help,
                                                  color:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  size: 18.0,
                                                ),
                                                title: itemItem.title,
                                                excerpt: itemItem.content,
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            ].divide(const SizedBox(height: 24.0)),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80.0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
