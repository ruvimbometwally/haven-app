import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'day_cell_model.dart';
export 'day_cell_model.dart';

class DayCellWidget extends StatefulWidget {
  const DayCellWidget({
    super.key,
    bool? isSelected,
    String? day,
    bool? isToday,
    bool? hasEvent,
  })  : this.isSelected = isSelected ?? false,
        this.day = day ?? '14',
        this.isToday = isToday ?? false,
        this.hasEvent = hasEvent ?? false;

  final bool isSelected;
  final String day;
  final bool isToday;
  final bool hasEvent;

  @override
  State<DayCellWidget> createState() => _DayCellWidgetState();
}

class _DayCellWidgetState extends State<DayCellWidget> {
  late DayCellModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DayCellModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.0,
      height: 52.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          valueOrDefault<bool>(
            widget!.isSelected,
            false,
          )
              ? Color(0x00000000)
              : Colors.transparent,
          Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(24.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: valueOrDefault<Color>(
            valueOrDefault<bool>(
              widget!.isToday,
              false,
            )
                ? Color(0x00000000)
                : Colors.transparent,
            Colors.transparent,
          ),
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            valueOrDefault<String>(
              widget!.day,
              '14',
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  font: GoogleFonts.outfit(
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
                  color: valueOrDefault<Color>(
                    valueOrDefault<bool>(
                      widget!.isSelected,
                      false,
                    )
                        ? FlutterFlowTheme.of(context).onPrimary
                        : FlutterFlowTheme.of(context).primaryText,
                    FlutterFlowTheme.of(context).primaryText,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  lineHeight: 1.3,
                ),
          ),
          if (valueOrDefault<bool>(
            widget!.hasEvent,
            false,
          ))
            Container(
              width: 4.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  valueOrDefault<bool>(
                    widget!.hasEvent,
                    false,
                  )
                      ? Color(0x00000000)
                      : Colors.transparent,
                  Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(9999.0),
                shape: BoxShape.rectangle,
              ),
            ),
        ].divide(SizedBox(height: 4.0)),
      ),
    );
  }
}
