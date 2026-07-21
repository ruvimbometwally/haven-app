import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'voice_note_model.dart';
export 'voice_note_model.dart';

class VoiceNoteWidget extends StatefulWidget {
  const VoiceNoteWidget({
    super.key,
    bool? isMe,
    String? duration,
    String? time,
  })  : isMe = isMe ?? false,
        duration = duration ?? '0:12',
        time = time ?? '11:07 AM';

  final bool isMe;
  final String duration;
  final String time;

  @override
  State<VoiceNoteWidget> createState() => _VoiceNoteWidgetState();
}

class _VoiceNoteWidgetState extends State<VoiceNoteWidget> {
  late VoiceNoteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoiceNoteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 220.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              valueOrDefault<bool>(
                widget.isMe,
                false,
              )
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).secondaryBackground,
            ),
            borderRadius: BorderRadius.circular(20.0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 32.0,
                        height: 32.0,
                        child: Stack(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          children: [
                            if (valueOrDefault<bool>(
                              valueOrDefault<bool>(
                                widget.isMe,
                                false,
                              )
                                  ? true
                                  : false,
                              false,
                            ))
                              Icon(
                                Icons.play_arrow_rounded,
                                color: valueOrDefault<Color>(
                                  valueOrDefault<bool>(
                                    widget.isMe,
                                    false,
                                  )
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                size: 32.0,
                              ),
                            if (valueOrDefault<bool>(
                              valueOrDefault<bool>(
                                widget.isMe,
                                false,
                              )
                                  ? false
                                  : true,
                              true,
                            ))
                              Icon(
                                Icons.play_circle_filled_rounded,
                                color: valueOrDefault<Color>(
                                  valueOrDefault<bool>(
                                    widget.isMe,
                                    false,
                                  )
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                size: 32.0,
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 24.0,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 3.0,
                                height: 12.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    valueOrDefault<bool>(
                                      widget.isMe,
                                      false,
                                    )
                                        ? FlutterFlowTheme.of(context)
                                            .background40
                                        : FlutterFlowTheme.of(context)
                                            .onPrimaryContainer20,
                                    FlutterFlowTheme.of(context)
                                        .onPrimaryContainer20,
                                  ),
                                  borderRadius: BorderRadius.circular(2.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              Container(
                                width: 3.0,
                                height: 18.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    valueOrDefault<bool>(
                                      widget.isMe,
                                      false,
                                    )
                                        ? FlutterFlowTheme.of(context)
                                            .background60
                                        : FlutterFlowTheme.of(context)
                                            .onPrimaryContainer30,
                                    FlutterFlowTheme.of(context)
                                        .onPrimaryContainer30,
                                  ),
                                  borderRadius: BorderRadius.circular(2.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              Container(
                                width: 3.0,
                                height: 14.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    valueOrDefault<bool>(
                                      widget.isMe,
                                      false,
                                    )
                                        ? FlutterFlowTheme.of(context)
                                            .primaryBackground
                                        : FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  borderRadius: BorderRadius.circular(2.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              Container(
                                width: 3.0,
                                height: 22.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    valueOrDefault<bool>(
                                      widget.isMe,
                                      false,
                                    )
                                        ? FlutterFlowTheme.of(context)
                                            .background40
                                        : FlutterFlowTheme.of(context)
                                            .onPrimaryContainer20,
                                    FlutterFlowTheme.of(context)
                                        .onPrimaryContainer20,
                                  ),
                                  borderRadius: BorderRadius.circular(2.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              Container(
                                width: 3.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    valueOrDefault<bool>(
                                      widget.isMe,
                                      false,
                                    )
                                        ? FlutterFlowTheme.of(context)
                                            .background40
                                        : FlutterFlowTheme.of(context)
                                            .onPrimaryContainer20,
                                    FlutterFlowTheme.of(context)
                                        .onPrimaryContainer20,
                                  ),
                                  borderRadius: BorderRadius.circular(2.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              Container(
                                width: 3.0,
                                height: 16.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    valueOrDefault<bool>(
                                      widget.isMe,
                                      false,
                                    )
                                        ? FlutterFlowTheme.of(context)
                                            .background40
                                        : FlutterFlowTheme.of(context)
                                            .onPrimaryContainer20,
                                    FlutterFlowTheme.of(context)
                                        .onPrimaryContainer20,
                                  ),
                                  borderRadius: BorderRadius.circular(2.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ].divide(const SizedBox(width: 2.0)),
                          ),
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.duration,
                          '0:12',
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.outfit(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              color: valueOrDefault<Color>(
                                valueOrDefault<bool>(
                                  widget.isMe,
                                  false,
                                )
                                    ? FlutterFlowTheme.of(context)
                                        .primaryBackground
                                    : FlutterFlowTheme.of(context)
                                        .onPrimaryContainer,
                                FlutterFlowTheme.of(context).onPrimaryContainer,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                              lineHeight: 1.2,
                            ),
                      ),
                    ].divide(const SizedBox(width: 16.0)),
                  ),
                  if (valueOrDefault<bool>(
                    valueOrDefault<bool>(
                      widget.isMe,
                      false,
                    )
                        ? false
                        : true,
                    true,
                  ))
                    Text(
                      valueOrDefault<String>(
                        widget.time,
                        '11:07 AM',
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.outfit(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                            lineHeight: 1.2,
                          ),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (valueOrDefault<bool>(
          widget.isMe,
          false,
        ))
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.time,
                  '11:07 AM',
                ),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.outfit(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      lineHeight: 1.2,
                    ),
              ),
              Icon(
                Icons.done_all_rounded,
                color: FlutterFlowTheme.of(context).secondary,
                size: 14.0,
              ),
            ].divide(const SizedBox(width: 4.0)),
          ),
      ].divide(const SizedBox(width: 4.0)),
    );
  }
}
