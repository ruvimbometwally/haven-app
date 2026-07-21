import '../../backend/schema/couples_record.dart';
import '../../backend/schema/users_record.dart';
import '../create_account/create_account_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/button/button_widget.dart';
import '/components/onboarding_page/onboarding_page_widget.dart';
import '/components/progress_dots/progress_dots_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_entry_model.dart';
export 'onboarding_entry_model.dart';

class OnboardingEntryWidget extends StatefulWidget {
  const OnboardingEntryWidget({super.key});

  static String routeName = 'OnboardingEntry';
  static String routePath = '/onboardingEntry';

  @override
  State<OnboardingEntryWidget> createState() => _OnboardingEntryWidgetState();
}

class _OnboardingEntryWidgetState extends State<OnboardingEntryWidget> {
  late OnboardingEntryModel _model;
  bool _isCheckingAuth = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingEntryModel());

    // On page load, if user is already logged in, redirect based on connection status
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        final userDoc = await UsersRecord.getDocumentOnce(
            UsersRecord.collection.doc(currentUserUid));

        if (userDoc.partnerId.isEmpty) {
          context.goNamed(PartnerConnectionWidget.routeName);
          return;
        }

        if (userDoc.coupleRef == null) {
          // Partner hasn't connected back yet
          context.goNamed(PartnerConnectionWidget.routeName);
          return;
        }

        final coupleDoc =
            await CouplesRecord.getDocumentOnce(userDoc.coupleRef!);
        if (coupleDoc.relationshipDuration.isEmpty) {
          context.goNamed(RelationshipSetupWidget.routeName);
        } else {
          context.goNamed(HomeDashboardWidget.routeName);
        }
      } else {
        setState(() {
          _isCheckingAuth = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isCheckingAuth && loggedIn) {
      return Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: const Center(
          child: CircularProgressIndicator(),
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: 0.0,
              height: 0.0,
            ),
            Expanded(
              child: Stack(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                children: [
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        wrapWithModel(
                          model: _model.onboardingPageModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const OnboardingPageWidget(
                            imageDesc:
                                'https://dimg.dreamflow.cloud/v1/image/a%20cozy%20minimalist%20living%20room%20with%20warm%20sunlight%20and%20plants',
                            title:
                                'Welcome to your private relationship space.',
                            subtitle:
                                'A digital home designed exclusively for the two of you.',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment:
                                  MainAxisAlignment.start,
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                              children: [
                                wrapWithModel(
                                  model: _model.progressDotsModel,
                                  updateCallback: () =>
                                      safeSetState(() {}),
                                  child: const ProgressDotsWidget(
                                    activeIndex: 0,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Grow intentionally every day',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(
                                              context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight:
                                                  FontWeight.w500,
                                            ),
                                            color: FlutterFlowTheme.of(
                                                    context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor:
                                          Colors.transparent,
                                      onTap: () async {
                                        context.goNamed(
                                            CreateAccountWidget
                                                .routeName);
                                      },
                                      child: wrapWithModel(
                                        model: _model.buttonModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: const ButtonWidget(
                                          iconPresent: false,
                                          iconEndPresent: false,
                                          content: 'Create Account',
                                          variant: 'primary',
                                          size: 'large',
                                          fullWidth: false,
                                          loading: false,
                                          disabled: false,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor:
                                          Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            LoginWidget.routeName);
                                      },
                                      child: wrapWithModel(
                                        model: _model.buttonModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: const ButtonWidget(
                                          iconPresent: false,
                                          iconEndPresent: false,
                                          content: 'Login',
                                          variant: 'outline',
                                          size: 'large',
                                          fullWidth: false,
                                          loading: false,
                                          disabled: false,
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 16.0)),
                                ),
                              ].divide(const SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: 0.8,
                            child: Text(
                              'OurLuv',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FontWeight.w800,
                                      fontStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primary,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    fontStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                    lineHeight: 1.6,
                                  ),
                            ),
                          ),
                          Icon(
                            Icons.favorite_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 18.0,
                          ),
                        ].divide(const SizedBox(width: 4.0)),
                      ),
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
