import '/components/bottom_nav2/bottom_nav2_widget.dart';
import '/components/chat_bubble/chat_bubble_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/components/voice_note/voice_note_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'conversations_model.dart';
export 'conversations_model.dart';

class ConversationsWidget extends StatefulWidget {
  const ConversationsWidget({super.key});

  static String routeName = 'Conversations';
  static String routePath = '/conversations';

  @override
  State<ConversationsWidget> createState() => _ConversationsWidgetState();
}

class _ConversationsWidgetState extends State<ConversationsWidget> {
  late ConversationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConversationsModel());
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
          selectedPage: 'Conversations',
        ),
        bottomNavigationBar: wrapWithModel(
          model: _model.bottomNavModel,
          updateCallback: () => safeSetState(() {}),
          child: const BottomNav2Widget(),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 16.0, 24.0, 16.0),
                    child: SafeArea(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                                CrossAxisAlignment.center,
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
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(9999.0),
                                child: Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(9999.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: CachedNetworkImage(
                                    fadeInDuration:
                                        const Duration(milliseconds: 0),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 0),
                                    imageUrl:
                                        'https://firebasestorage.googleapis.com/v0/b/haven-ut6jze.firebasestorage.app/o/conversation_page.jpeg?alt=media&token=caf41bcb-9a95-4994-ba8c-61dac012e3cd',
                                    fit: BoxFit.cover,
                                    alignment: const Alignment(0.0, 0.0),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sarah',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts
                                              .plusJakartaSans(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(
                                                  context)
                                              .onPrimaryContainer,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(
                                                  context)
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(
                                                  9999.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                      Text(
                                        'Typing...',
                                        style: FlutterFlowTheme.of(
                                                context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight:
                                                    FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .fontStyle,
                                              lineHeight: 1.2,
                                            ),
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ].divide(const SizedBox(width: 16.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                                CrossAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.search_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .onPrimaryContainer60,
                                  size: 24.0,
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
                                  Icons.push_pin_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .onPrimaryContainer60,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context)
                          .secondaryBackground,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ],
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            alignment:
                                const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius:
                                    BorderRadius.circular(9999.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 6.0, 16.0, 6.0),
                                child: Text(
                                  'Today',
                                  style: FlutterFlowTheme.of(
                                          context)
                                      .labelSmall
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight:
                                              FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme
                                                .of(context)
                                            .onPrimaryContainer60,
                                        letterSpacing: 0.0,
                                        fontWeight:
                                            FontWeight.bold,
                                        fontStyle:
                                            FlutterFlowTheme.of(
                                                    context)
                                                .labelSmall
                                                .fontStyle,
                                        lineHeight: 1.2,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.chatBubbleModel1,
                            updateCallback: () =>
                                safeSetState(() {}),
                            child: const ChatBubbleWidget(
                              isMe: false,
                              hasMedia: false,
                              mediaDesc:
                                  'https://dimg.dreamflow.cloud/v1/image/',
                              content:
                                  'Thinking about our dinner on Friday. Should we try that new Italian place?',
                              time: '11:02 AM',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.chatBubbleModel2,
                            updateCallback: () =>
                                safeSetState(() {}),
                            child: const ChatBubbleWidget(
                              isMe: true,
                              hasMedia: false,
                              mediaDesc:
                                  'https://dimg.dreamflow.cloud/v1/image/',
                              content:
                                  'I\'d love to! I just saw some photos of their patio and it looks beautiful.',
                              time: '11:05 AM',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.chatBubbleModel3,
                            updateCallback: () =>
                                safeSetState(() {}),
                            child: const ChatBubbleWidget(
                              isMe: false,
                              hasMedia: true,
                              mediaDesc:
                                  'https://dimg.dreamflow.cloud/v1/image/Elegant%20Italian%20restaurant%20patio%20with%20warm%20string%20lights%20and%20sunset%20view',
                              content:
                                  'Look at this view from the balcony they have!',
                              time: '11:06 AM',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.voiceNoteModel,
                            updateCallback: () =>
                                safeSetState(() {}),
                            child: const VoiceNoteWidget(
                              isMe: false,
                              duration: '0:12',
                              time: '11:07 AM',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.chatBubbleModel4,
                            updateCallback: () =>
                                safeSetState(() {}),
                            child: const ChatBubbleWidget(
                              isMe: true,
                              hasMedia: false,
                              mediaDesc:
                                  'https://dimg.dreamflow.cloud/v1/image/',
                              content:
                                  'That looks perfect. I\'ll book a table for 7 PM. ❤️',
                              time: '11:10 AM',
                            ),
                          ),
                        ].divide(const SizedBox(height: 24.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context)
                          .secondaryBackground,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 16.0, 24.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 44.0,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.add_circle_outline_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .primary,
                                size: 28.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius:
                                      BorderRadius.circular(24.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: wrapWithModel(
                                          model:
                                              _model.textFieldModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: TextFieldWidget(
                                            label: '',
                                            labelPresent: false,
                                            helper: '',
                                            helperPresent: false,
                                            leadingIconPresent:
                                                false,
                                            trailingIconPresent:
                                                false,
                                            hint:
                                                'Write a message...',
                                            value: FFAppState()
                                                .chatDraft,
                                            onChange: '',
                                            onSubmit: '',
                                            variant: 'ghost',
                                            error: false,
                                          ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        fillColor:
                                            Colors.transparent,
                                        icon: Icon(
                                          Icons
                                              .sentiment_satisfied_alt_rounded,
                                          color: FlutterFlowTheme
                                                  .of(context)
                                              .onPrimaryContainer40,
                                          size: 22.0,
                                        ),
                                        onPressed: () {
                                          print(
                                              'IconButton pressed ...');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 12.0,
                                    color:
                                        FlutterFlowTheme.of(context)
                                            .primary,
                                    offset: const Offset(
                                      0.0,
                                      4.0,
                                    ),
                                    spreadRadius: 0.0,
                                  )
                                ],
                                borderRadius:
                                    BorderRadius.circular(9999.0),
                                shape: BoxShape.rectangle,
                              ),
                              alignment:
                                  const AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.mic_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 24.0,
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
