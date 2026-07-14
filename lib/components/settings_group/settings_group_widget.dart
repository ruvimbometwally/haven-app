import '/components/settings_tile/settings_tile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_group_model.dart';
export 'settings_group_model.dart';

class SettingsGroupWidget extends StatefulWidget {
  const SettingsGroupWidget({
    super.key,
    String? title,
  }) : this.title = title ?? 'RELATIONSHIP';

  final String title;

  @override
  State<SettingsGroupWidget> createState() => _SettingsGroupWidgetState();
}

class _SettingsGroupWidgetState extends State<SettingsGroupWidget> {
  late SettingsGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsGroupModel());
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
                'RELATIONSHIP',
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
                    wrapWithModel(
                      model: _model.settingsTileModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsTileWidget(
                        tapAction: 'navigate(partner_connection)',
                        icon: Icon(
                          Icons.favorite_outline_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        label: 'Partner Connection',
                        value: 'Connected to Sarah',
                        isLast: false,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsTileModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsTileWidget(
                        tapAction: 'goBack',
                        icon: Icon(
                          Icons.event_repeat_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        label: 'Anniversary Date',
                        value: 'Oct 14, 2021',
                        isLast: false,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsTileModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsTileWidget(
                        tapAction: 'goBack',
                        icon: Icon(
                          Icons.auto_stories_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        label: 'Scrapbook Preferences',
                        value: '',
                        isLast: true,
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
