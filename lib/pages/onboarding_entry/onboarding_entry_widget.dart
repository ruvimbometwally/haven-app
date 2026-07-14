import '/components/button/button_widget.dart';
import '/components/onboarding_page/onboarding_page_widget.dart';
import '/components/progress_dots/progress_dots_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingEntryModel());
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
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 0.0,
                height: 0.0,
              ),
              Container(
                child: Stack(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  children: [
                    SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: wrapWithModel(
                              model: _model.onboardingPageModel,
                              updateCallback: () => safeSetState(() {}),
                              child: OnboardingPageWidget(
                                imageDesc:
                                    'https://dimg.dreamflow.cloud/v1/image/a%20cozy%20minimalist%20living%20room%20with%20warm%20sunlight%20and%20plants',
                                title:
                                    'Welcome to your private relationship space.',
                                subtitle:
                                    'A digital home designed exclusively for the two of you.',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Container(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
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
                                          child: ProgressDotsWidget(
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
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.goNamed(
                                                    HomeDashboardWidget
                                                        .routeName);
                                              },
                                              child: wrapWithModel(
                                                model: _model.buttonModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ButtonWidget(
                                                  iconPresent: false,
                                                  iconEndPresent: false,
                                                  content:
                                                      'Grow intentionally every day',
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
                                                context.goNamed(
                                                    PartnerConnectionWidget
                                                        .routeName);
                                              },
                                              child: wrapWithModel(
                                                model: _model.buttonModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ButtonWidget(
                                                  iconPresent: false,
                                                  iconEndPresent: false,
                                                  content: 'Create Account',
                                                  variant: 'outline',
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
                                                context.goNamed(
                                                    PartnerConnectionWidget
                                                        .routeName);
                                              },
                                              child: wrapWithModel(
                                                model: _model.buttonModel3,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ButtonWidget(
                                                  iconPresent: false,
                                                  iconEndPresent: false,
                                                  content: 'Login',
                                                  variant: 'ghost',
                                                  size: 'large',
                                                  fullWidth: false,
                                                  loading: false,
                                                  disabled: false,
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ].divide(SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Opacity(
                                  opacity: 0.8,
                                  child: Text(
                                    'Us',
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
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
