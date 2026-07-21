import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_nav3/bottom_nav3_widget.dart';
import '/components/button/button_widget.dart';
import '/components/quick_action/quick_action_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_dashboard_model.dart';
export 'home_dashboard_model.dart';

class HomeDashboardWidget extends StatefulWidget {
  const HomeDashboardWidget({super.key});

  static String routeName = 'HomeDashboard';
  static String routePath = '/homeDashboard';

  @override
  State<HomeDashboardWidget> createState() => _HomeDashboardWidgetState();
}

class _HomeDashboardWidgetState extends State<HomeDashboardWidget> {
  late HomeDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _showAnswerDialog(
      String prompt, String partnerName, DocumentReference? coupleRef) async {
    if (coupleRef == null) return;

    final controller = TextEditingController();
    final response = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Today\'s Prompt'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(prompt, style: FlutterFlowTheme.of(context).bodyMedium),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Your answer...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Submit'),
          ),
        ],
      ),
    );

    if (response != null && response.trim().isNotEmpty) {
      await PromptResponsesRecord.collection.add(createPromptResponsesRecordData(
        coupleRef: coupleRef,
        userRef: currentUserReference,
        promptText: prompt,
        answer: response.trim(),
        createdAt: getCurrentTimestamp,
      ));
    }
  }

  Future<void> _showMoodPicker() async {
    final moods = [
      {'label': 'Happy', 'emoji': '😊'},
      {'label': 'Sad', 'emoji': '😔'},
      {'label': 'Excited', 'emoji': '🤩'},
      {'label': 'Tired', 'emoji': '😴'},
      {'label': 'Calm', 'emoji': '🧘'},
      {'label': 'Stressed', 'emoji': '😫'},
      {'label': 'Grateful', 'emoji': '🙏'},
      {'label': 'Playful', 'emoji': '😜'},
      {'label': 'Loved', 'emoji': '🥰'},
      {'label': 'Frisky', 'emoji': '😈'},
      {'label': 'Spiritual', 'emoji': '🕊️'},
      {'label': 'Romantic', 'emoji': '🌹'},
    ];

    final selectedMood = await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      builder: (context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.7,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'How are you feeling?',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                const SizedBox(height: 24),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: moods.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.pop(context, moods[index]),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(moods[index]['emoji']!,
                              style: const TextStyle(fontSize: 32)),
                          const SizedBox(height: 4),
                          Text(moods[index]['label']!,
                              style: FlutterFlowTheme.of(context).labelSmall),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (selectedMood != null) {
      await currentUserReference!
          .update({'mood': '${selectedMood['emoji']} ${selectedMood['label']}'});
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeDashboardModel());
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
          selectedPage: 'HomeDashboard',
        ),
        bottomNavigationBar: wrapWithModel(
          model: _model.bottomNavModel,
          updateCallback: () => safeSetState(() {}),
          child: const BottomNav3Widget(),
        ),
        body: SafeArea(
          top: false,
          child: AuthUserStreamWidget(
            builder: (context) {
              if (currentUserDocument == null) {
                return const Center(child: CircularProgressIndicator());
              }

              final coupleRef = currentUserDocument!.coupleRef;
              final partnerId = currentUserDocument!.partnerId;

              return StreamBuilder<CouplesRecord>(
                stream: coupleRef != null
                    ? CouplesRecord.getDocument(coupleRef)
                    : const Stream.empty(),
                builder: (context, coupleSnapshot) {
                  final coupleData = coupleSnapshot.data;

                  return StreamBuilder<UsersRecord>(
                    stream: partnerId.isNotEmpty
                        ? UsersRecord.getDocument(
                            UsersRecord.collection.doc(partnerId))
                        : const Stream.empty(),
                    builder: (context, partnerSnapshot) {
                      final partnerData = partnerSnapshot.data;
                      final partnerName = partnerData?.displayName ?? 'Partner';
                      final partnerMood = partnerData?.mood ?? 'Normal';

                      final dailyPrompt = functions.getDailyPrompt(
                        coupleData?.primaryGoals,
                        partnerName,
                        coupleData?.relationshipStartDate,
                      );

                      final now = DateTime.now();

                      return StreamBuilder<List<PromptResponsesRecord>>(
                        stream: coupleRef != null
                            ? queryPromptResponsesRecord(
                                queryBuilder: (q) => q.where('couple_ref',
                                    isEqualTo: coupleRef),
                              )
                            : const Stream.empty(),
                        builder: (context, responsesSnapshot) {
                          final allResponses = responsesSnapshot.data ?? [];
                          final responses = allResponses.where((r) {
                            if (r.createdAt == null) return false;
                            return r.createdAt!.year == now.year &&
                                r.createdAt!.month == now.month &&
                                r.createdAt!.day == now.day;
                          }).toList();
                          final myResponse = responses.firstWhereOrNull(
                              (r) => r.userRef?.id == currentUserUid);
                          final partnerResponse = responses.firstWhereOrNull(
                              (r) => r.userRef?.id == partnerId);

                          return SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                            SizedBox(
                              height: 420.0,
                              child: Stack(
                                alignment:
                                    const AlignmentDirectional(-1.0, -1.0),
                                children: [
                                  CachedNetworkImage(
                                    fadeInDuration:
                                        const Duration(milliseconds: 0),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 0),
                                    imageUrl: partnerData?.photoUrl != null &&
                                            partnerData!.photoUrl.isNotEmpty
                                        ? partnerData.photoUrl
                                        : 'https://firebasestorage.googleapis.com/v0/b/haven-ut6jze.firebasestorage.app/o/dashboard_placeholder.png?alt=media&token=49e0d9e2-f37f-4375-9d13-cd85293233c7',
                                    height: 420.0,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    alignment: const Alignment(0.0, 0.0),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: SafeArea(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white
                                                .withValues(alpha: 0.8),
                                            shape: BoxShape.circle,
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.menu_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            onPressed: () {
                                              scaffoldKey.currentState!
                                                  .openDrawer();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 1.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .fullContrast60,
                                            Colors.transparent
                                          ],
                                          stops: const [0.0, 0.4],
                                          begin: const AlignmentDirectional(
                                              0.0, 1.0),
                                          end:
                                              const AlignmentDirectional(0, -1.0),
                                        ),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Together for ${functions.relationshipDurationLabel(coupleData?.relationshipStartDate)}',
                                                      style: FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme.of(
                                                                    context)
                                                                .onPrimary,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                            lineHeight: 1.4,
                                                          ),
                                                    ),
                                                    Text(
                                                      '${currentUserDisplayName.split(' ').first} & ${partnerName.split(' ').first}',
                                                      style: FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme.of(
                                                                    context)
                                                                .onPrimary,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                            lineHeight: 1.2,
                                                          ),
                                                    ),
                                                  ].divide(const SizedBox(
                                                      height: 4.0)),
                                                ),
                                                if (coupleData
                                                        ?.relationshipDuration !=
                                                    null)
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: () {
                                                        final d = coupleData!
                                                            .relationshipDuration;
                                                        if (d == '< 6 mos') {
                                                          return const Color(
                                                              0xFF39D2C0);
                                                        }
                                                        if (d == '1-3 yrs') {
                                                          return const Color(
                                                              0xFF4B39EF);
                                                        }
                                                        if (d == '3-5 yrs') {
                                                          return const Color(
                                                              0xFFEE8B60);
                                                        }
                                                        return const Color(
                                                            0xFFFFD700);
                                                      }(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12.0,
                                                        vertical: 6.0),
                                                    child: Text(
                                                      coupleData!
                                                          .relationshipDuration,
                                                      style: FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .outfit(),
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ].divide(const SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(24.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.auto_awesome_rounded,
                                                size: 20.0,
                                              ),
                                              Text(
                                                'Today\'s Prompt',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                      lineHeight: 1.3,
                                                    ),
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                          Text(
                                            dailyPrompt.replaceAll(
                                                'your partner', partnerName),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                          if (myResponse != null)
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Text(
                                                    'You: ${myResponse.answer}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                if (partnerResponse != null)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4.0),
                                                    child: Text(
                                                      '$partnerName: ${partnerResponse.answer}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .outfit(),
                                                            color:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                          ),
                                                    ),
                                                  )
                                                else
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4.0),
                                                    child: Text(
                                                      'Waiting for $partnerName to answer...',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .outfit(),
                                                            color:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          if (myResponse == null)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await _showAnswerDialog(
                                                    dailyPrompt,
                                                    partnerName,
                                                    coupleRef);
                                              },
                                              child: wrapWithModel(
                                                model: _model.buttonModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: const ButtonWidget(
                                                  iconPresent: false,
                                                  iconEndPresent: false,
                                                  content: 'Answer Together',
                                                  variant: 'outline',
                                                  size: 'small',
                                                  fullWidth: false,
                                                  loading: false,
                                                  disabled: false,
                                                ),
                                              ),
                                            ),
                                        ].divide(const SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Upcoming Anniversaries',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                      ...functions
                                          .getAnniversariesList(
                                              coupleData?.relationshipStartDate,
                                              coupleData?.importantDates)
                                          .map((anniv) => Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      24.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              anniv['days']
                                                                  .toString(),
                                                              style: FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                    color:
                                                                        FlutterFlowTheme.of(
                                                                                context)
                                                                            .primary,
                                                                  ),
                                                            ),
                                                            const Text(
                                                              'DAYS',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      8.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              anniv['label']
                                                                  as String,
                                                              style: FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Started on ${dateTimeFormat('MMM d, yyyy', anniv['originalDate'] as DateTime)}',
                                                              style: FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(const SizedBox(
                                                        width: 16.0)),
                                                  ),
                                                ),
                                              )),
                                    ].divide(const SizedBox(height: 12.0)),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(24.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
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
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Daily Moods',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          ),
                                          const SizedBox(height: 16),
                                          InkWell(
                                            onTap: () async {
                                              await _showMoodPicker();
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    currentUserDisplayName
                                                            .isNotEmpty
                                                        ? currentUserDisplayName[
                                                                0]
                                                            .toUpperCase()
                                                        : 'M',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('You',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall),
                                                      Text(
                                                        'Feeling ${currentUserDocument?.mood ?? 'Normal'}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.edit_note_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12.0),
                                            child: Divider(
                                              height: 1,
                                              thickness: 1,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 40.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0.0, 0.0),
                                                child: Text(
                                                  partnerName.isNotEmpty
                                                      ? partnerName[0]
                                                          .toUpperCase()
                                                      : 'P',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(partnerName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall),
                                                    Text(
                                                      'Feeling $partnerMood',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .outfit(),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Quick Actions',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            wrapWithModel(
                                              model: _model.quickActionModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: QuickActionWidget(
                                                onTap: () async {
                                                  context.pushNamed(
                                                      AppreciationJournalWidget
                                                          .routeName);
                                                },
                                                action:
                                                    'navigate(appreciation_journal)',
                                                tone: const Color(0x00000000),
                                                icon: Icon(
                                                  Icons.favorite_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                label: 'Send Appreciation',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.quickActionModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: QuickActionWidget(
                                                onTap: () async {
                                                  context.pushNamed(
                                                      MemoriesScrapbookWidget
                                                          .routeName);
                                                },
                                                action:
                                                    'navigate(memories_scrapbook)',
                                                tone: const Color(0x00000000),
                                                icon: Icon(
                                                  Icons.photo_library_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                label: 'Add Memory',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.quickActionModel3,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: QuickActionWidget(
                                                onTap: () async {
                                                  context.pushNamed(
                                                      SharedCalendarWidget
                                                          .routeName);
                                                },
                                                action:
                                                    'navigate(shared_calendar)',
                                                tone:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.restaurant_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                label: 'Plan Date',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.quickActionModel4,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: QuickActionWidget(
                                                onTap: () async {
                                                  context.pushNamed(
                                                      PlanningListsWidget
                                                          .routeName);
                                                },
                                                action:
                                                    'navigate(planning_lists)',
                                                tone: const Color(0x00000000),
                                                icon: Icon(
                                                  Icons.event_available_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                label: 'Weekly Check-in',
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 16.0)),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 16.0)),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.goNamed(
                                          SharedCalendarWidget.routeName);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'UPCOMING',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
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
                                                  Icon(Icons.calendar_today,
                                                      size: 20,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary),
                                                ].divide(const SizedBox(
                                                    height: 2.0)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Check Shared Calendar',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                          lineHeight: 1.6,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Plan your next quality time',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    height: 2.0)),
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ].divide(const SizedBox(width: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Our Primary Goals',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
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
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (coupleData?.primaryGoals !=
                                                      null &&
                                                  coupleData!
                                                      .primaryGoals.isNotEmpty)
                                                ...coupleData.primaryGoals
                                                    .map((goal) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 8.0),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .check_circle_rounded,
                                                                  size: 18,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary),
                                                              const SizedBox(
                                                                  width: 8.0),
                                                              Text(goal,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium),
                                                            ],
                                                          ),
                                                        ))
                                              else
                                                Text(
                                                  'No goals set yet.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                            ].divide(
                                                const SizedBox(height: 16.0)),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 16.0)),
                                  ),
                                ].divide(const SizedBox(height: 24.0)),
                              ),
                            ),
                            const SizedBox(height: 120.0),
                          ],
                        ),
                      );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
