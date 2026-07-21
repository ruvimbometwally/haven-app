import '/components/settings_tile/settings_tile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings_group2_model.dart';
export 'settings_group2_model.dart';

class SettingsGroup2Widget extends StatefulWidget {
  const SettingsGroup2Widget({
    super.key,
    String? title,
  }) : title = title ?? 'PRIVACY & SECURITY';

  final String title;

  @override
  State<SettingsGroup2Widget> createState() => _SettingsGroup2WidgetState();
}

class _SettingsGroup2WidgetState extends State<SettingsGroup2Widget> {
  late SettingsGroup2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsGroup2Model());
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
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
          child: Container(
            child: Text(
              valueOrDefault<String>(
                widget.title,
                'PRIVACY & SECURITY',
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
                        tapAction: 'goBack',
                        icon: Icon(
                          Icons.lock_person_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        label: 'App Passcode',
                        value: 'Enabled',
                        isLast: false,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsTileModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsTileWidget(
                        tapAction: 'goBack',
                        icon: Icon(
                          Icons.visibility_off_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        label: 'Hide Sensitive Memories',
                        value: '',
                        isLast: false,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsTileModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsTileWidget(
                        tapAction: 'goBack',
                        icon: Icon(
                          Icons.shield_moon_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        label: 'Data Encryption',
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
      ].divide(const SizedBox(height: 16.0)),
    );
  }
}
