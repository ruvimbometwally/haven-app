import '/components/switch_component/switch_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_group3_model.dart';
export 'settings_group3_model.dart';

class SettingsGroup3Widget extends StatefulWidget {
  const SettingsGroup3Widget({
    super.key,
    String? title,
  }) : this.title = title ?? 'NOTIFICATIONS';

  final String title;

  @override
  State<SettingsGroup3Widget> createState() => _SettingsGroup3WidgetState();
}

class _SettingsGroup3WidgetState extends State<SettingsGroup3Widget> {
  late SettingsGroup3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsGroup3Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
          child: Container(
            child: Text(
              valueOrDefault<String>(
                widget!.title,
                'NOTIFICATIONS',
              ),
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.outfit(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    lineHeight: 1.3,
                  ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(24.0),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Container(
                          child: wrapWithModel(
                            model: _model.switchModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: SwitchComponentWidget(
                              label: 'Daily Relationship Prompts',
                              labelPresent: true,
                              variant: 'Android',
                              active: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 16.0,
                      thickness: 1.0,
                      indent: 20.0,
                      endIndent: 0.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Container(
                          child: wrapWithModel(
                            model: _model.switchModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: SwitchComponentWidget(
                              label: 'Partner Mood Updates',
                              labelPresent: true,
                              variant: 'Android',
                              active: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 16.0,
                      thickness: 1.0,
                      indent: 20.0,
                      endIndent: 0.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Container(
                          child: wrapWithModel(
                            model: _model.switchModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: SwitchComponentWidget(
                              label: 'Shared Calendar Alerts',
                              labelPresent: true,
                              variant: 'Android',
                              active: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ].divide(SizedBox(height: 16.0)),
    );
  }
}
