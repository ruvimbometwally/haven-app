import '/backend/backend.dart';
import '/components/album_chip/album_chip_widget.dart';
import '/components/bottom_nav4/bottom_nav4_widget.dart';
import '/components/button/button_widget.dart';
import '/components/memory_polaroid/memory_polaroid_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'memories_scrapbook_model.dart';
export 'memories_scrapbook_model.dart';

class MemoriesScrapbookWidget extends StatefulWidget {
  const MemoriesScrapbookWidget({super.key});

  static String routeName = 'MemoriesScrapbook';
  static String routePath = '/memoriesScrapbook';

  @override
  State<MemoriesScrapbookWidget> createState() =>
      _MemoriesScrapbookWidgetState();
}

class _MemoriesScrapbookWidgetState extends State<MemoriesScrapbookWidget> {
  late MemoriesScrapbookModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemoriesScrapbookModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: const SideNavWidget(
          selectedPage: 'MemoriesScrapbook',
        ),
        bottomNavigationBar: wrapWithModel(
          model: _model.bottomNavModel,
          updateCallback: () => safeSetState(() {}),
          child: const BottomNav4Widget(),
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
                              'Our Scrapbook',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FontWeight.bold,
                                      fontStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .onPrimaryContainer,
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                    lineHeight: 1.6,
                                  ),
                            ),
                          ],
                        ),
                        Text(
                          'Every moment with you.',
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                font: GoogleFonts.outfit(
                                  fontWeight:
                                      FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                  fontStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryText,
                                letterSpacing: 0.0,
                                fontWeight:
                                    FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                fontStyle:
                                    FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                lineHeight: 1.5,
                              ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 9999.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context)
                          .secondaryBackground,
                      icon: const Icon(
                        Icons.search_rounded,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().activeMemoryFilter = 'All';
                                FFAppState().update(() {});
                              },
                              child: wrapWithModel(
                                model: _model.albumChipModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: AlbumChipWidget(
                                  active: FFAppState().activeMemoryFilter ==
                                      'All',
                                  label: 'All Memories',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().activeMemoryFilter =
                                    'Vacations';
                                FFAppState().update(() {});
                              },
                              child: wrapWithModel(
                                model: _model.albumChipModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: AlbumChipWidget(
                                  active: FFAppState().activeMemoryFilter ==
                                      'Vacations',
                                  label: 'Vacations',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().activeMemoryFilter =
                                    'Anniversaries';
                                FFAppState().update(() {});
                              },
                              child: wrapWithModel(
                                model: _model.albumChipModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: AlbumChipWidget(
                                  active: FFAppState().activeMemoryFilter ==
                                      'Anniversaries',
                                  label: 'Anniversaries',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().activeMemoryFilter =
                                    'Date Nights';
                                FFAppState().update(() {});
                              },
                              child: wrapWithModel(
                                model: _model.albumChipModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: AlbumChipWidget(
                                  active: FFAppState().activeMemoryFilter ==
                                      'Date Nights',
                                  label: 'Date Nights',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().activeMemoryFilter =
                                    'Home Life';
                                FFAppState().update(() {});
                              },
                              child: wrapWithModel(
                                model: _model.albumChipModel5,
                                updateCallback: () => safeSetState(() {}),
                                child: AlbumChipWidget(
                                  active: FFAppState().activeMemoryFilter ==
                                      'Home Life',
                                  label: 'Home Life',
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ),
                    ],
                  ),
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
                        child: StreamBuilder<List<MemoriesRecord>>(
                          stream: queryMemoriesRecord(),
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
                            List<MemoriesRecord>
                                columnPaddingMemoriesRecordList =
                                snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondary10,
                                    borderRadius:
                                        BorderRadius.circular(24.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary30,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.auto_awesome_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .secondary,
                                              size: 20.0,
                                            ),
                                            Text(
                                              'On This Day',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font: GoogleFonts
                                                        .plusJakartaSans(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                                  .fontStyle,
                                                    ),
                                                    color:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                    lineHeight: 1.4,
                                                  ),
                                            ),
                                          ].divide(
                                              const SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      16.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: CachedNetworkImage(
                                                  fadeInDuration:
                                                      const Duration(
                                                          milliseconds: 0),
                                                  fadeOutDuration:
                                                      const Duration(
                                                          milliseconds: 0),
                                                  imageUrl:
                                                      'https://dimg.dreamflow.cloud/v1/image/Sarah%20and%20Alex%20at%20the%20beach%20two%20years%20ago',
                                                  fit: BoxFit.cover,
                                                  alignment:
                                                      const Alignment(
                                                          0.0, 0.0),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize:
                                                    MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Text(
                                                    '2 Years Ago',
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .labelSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight: FlutterFlowTheme.of(context)
                                                                .labelSmall
                                                                .fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(context)
                                                                .labelSmall
                                                                .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                          letterSpacing:
                                                              0.0,
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
                                                  Text(
                                                    'Beach Vacation',
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight: FlutterFlowTheme.of(context)
                                                                .titleSmall
                                                                .fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(context)
                                                                .titleSmall
                                                                .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                          letterSpacing:
                                                              0.0,
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
                                                    'The day we decided to move in together.',
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight: FlutterFlowTheme.of(context)
                                                                .bodySmall
                                                                .fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(context)
                                                                .bodySmall
                                                                .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                          letterSpacing:
                                                              0.0,
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
                                                  wrapWithModel(
                                                    model: _model
                                                        .buttonModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        const ButtonWidget(
                                                      iconPresent: false,
                                                      iconEndPresent: false,
                                                      content:
                                                          'Relive Memory',
                                                      variant: 'ghost',
                                                      size: 'small',
                                                      fullWidth: false,
                                                      loading: false,
                                                      disabled: false,
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(
                                                    height: 4.0)),
                                              ),
                                            ),
                                          ].divide(const SizedBox(
                                              width: 16.0)),
                                        ),
                                      ].divide(const SizedBox(
                                          height: 16.0)),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Recent Timeline',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts
                                                .plusJakartaSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(
                                                    context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(
                                                    context)
                                                .titleLarge
                                                .fontWeight,
                                            fontStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleLarge
                                                .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                    Text(
                                      'View Calendar',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight:
                                                  FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(
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
                                if ((functions
                                            .filteredMemories(
                                                columnPaddingMemoriesRecordList
                                                    .toList(),
                                                FFAppState()
                                                    .activeMemoryFilter)
                                            .isEmpty) ==
                                    false)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // ff_lite_listview_data:${filtered_memories}
                                            StreamBuilder<
                                                List<MemoriesRecord>>(
                                              stream: queryMemoriesRecord(),
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
                                                List<MemoriesRecord>
                                                    listViewMemoriesRecordList =
                                                    snapshot.data!;

                                                return Builder(
                                                  builder: (context) {
                                                    final item =
                                                        listViewMemoriesRecordList
                                                            .toList();

                                                    return ListView.builder(
                                                      padding:
                                                          EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          item.length,
                                                      itemBuilder: (context,
                                                          itemIndex) {
                                                        final itemItem =
                                                            item[itemIndex];
                                                        return MemoryPolaroidWidget(
                                                          key: Key(
                                                              'Key439_${itemIndex}_of_${item.length}'),
                                                          imageDesc:
                                                              itemItem
                                                                  .title,
                                                          title: itemItem
                                                              .title,
                                                          caption: itemItem
                                                              .caption,
                                                          date: itemItem
                                                              .date,
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ].divide(const SizedBox(
                                              height: 16.0)),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (functions
                                                  .filteredMemories(
                                                      columnPaddingMemoriesRecordList
                                                          .toList(),
                                                      FFAppState()
                                                          .activeMemoryFilter)
                                                  .isEmpty)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(
                                                          24.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .photo_library_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryText,
                                                        size: 48.0,
                                                      ),
                                                      Text(
                                                        'No memories found',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .plusJakartaSans(
                                                                fontWeight:
                                                                    FlutterFlowTheme.of(context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                              lineHeight:
                                                                  1.4,
                                                            ),
                                                      ),
                                                      Text(
                                                        'Capture a new moment together',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FlutterFlowTheme.of(context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent3,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                              lineHeight:
                                                                  1.5,
                                                            ),
                                                      ),
                                                    ].divide(const SizedBox(
                                                        height: 16.0)),
                                                  ),
                                                ),
                                            ].divide(const SizedBox(
                                                height: 16.0)),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 16.0)),
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
