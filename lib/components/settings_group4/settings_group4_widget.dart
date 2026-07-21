import '/components/settings_tile/settings_tile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings_group4_model.dart';
export 'settings_group4_model.dart';

class SettingsGroup4Widget extends StatefulWidget {
  const SettingsGroup4Widget({
    super.key,
    String? title,
  }) : title = title ?? 'ACCOUNT';

  final String title;

  @override
  State<SettingsGroup4Widget> createState() => _SettingsGroup4WidgetState();
}

class _SettingsGroup4WidgetState extends State<SettingsGroup4Widget> {
  late SettingsGroup4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsGroup4Model());
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
                'ACCOUNT',
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
                          Icons.person_outline_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        label: 'Profile Details',
                        value: '',
                        isLast: false,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsTileModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsTileWidget(
                        tapAction: 'goBack',
                        icon: Icon(
                          Icons.cloud_sync_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        label: 'Backup & Sync',
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
                          Icons.palette_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        label: 'App Theme',
                        value: 'Warm Ivory',
                        isLast: false,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsTileModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsTileWidget(
                        tapAction: 'goBack',
                        icon: Icon(
                          Icons.info_outline_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        label: 'About Us',
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
