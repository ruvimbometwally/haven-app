import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_bubble_model.dart';
export 'chat_bubble_model.dart';

class ChatBubbleWidget extends StatefulWidget {
  const ChatBubbleWidget({
    super.key,
    bool? isMe,
    bool? hasMedia,
    String? mediaDesc,
    String? content,
    String? time,
  })  : this.isMe = isMe ?? false,
        this.hasMedia = hasMedia ?? false,
        this.mediaDesc = mediaDesc ?? 'https://dimg.dreamflow.cloud/v1/image/',
        this.content = content ??
            'Thinking about our dinner on Friday. Should we try that new Italian place?',
        this.time = time ?? '11:02 AM';

  final bool isMe;
  final bool hasMedia;
  final String mediaDesc;
  final String content;
  final String time;

  @override
  State<ChatBubbleWidget> createState() => _ChatBubbleWidgetState();
}

class _ChatBubbleWidgetState extends State<ChatBubbleWidget> {
  late ChatBubbleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBubbleModel());
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 300.0,
          ),
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              valueOrDefault<bool>(
                widget!.isMe,
                false,
              )
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).secondaryBackground,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(valueOrDefault<double>(
                valueOrDefault<bool>(
                  widget!.isMe,
                  false,
                )
                    ? 20.0
                    : 20.0,
                20.0,
              )),
              topRight: Radius.circular(valueOrDefault<double>(
                valueOrDefault<bool>(
                  widget!.isMe,
                  false,
                )
                    ? 20.0
                    : 20.0,
                20.0,
              )),
              bottomLeft: Radius.circular(valueOrDefault<double>(
                valueOrDefault<bool>(
                  widget!.isMe,
                  false,
                )
                    ? 20.0
                    : 4.0,
                4.0,
              )),
              bottomRight: Radius.circular(valueOrDefault<double>(
                valueOrDefault<bool>(
                  widget!.isMe,
                  false,
                )
                    ? 4.0
                    : 20.0,
                20.0,
              )),
            ),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (valueOrDefault<bool>(
                widget!.hasMedia,
                false,
              ))
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Container(
                    width: 288.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 0),
                      fadeOutDuration: Duration(milliseconds: 0),
                      imageUrl: valueOrDefault<String>(
                        widget!.mediaDesc,
                        'https://dimg.dreamflow.cloud/v1/image/',
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment(0.0, 0.0),
                    ),
                  ),
                ),
              Text(
                valueOrDefault<String>(
                  widget!.content,
                  'Thinking about our dinner on Friday. Should we try that new Italian place?',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.outfit(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: valueOrDefault<Color>(
                        valueOrDefault<bool>(
                          widget!.isMe,
                          false,
                        )
                            ? FlutterFlowTheme.of(context).primaryBackground
                            : FlutterFlowTheme.of(context).onPrimaryContainer,
                        FlutterFlowTheme.of(context).onPrimaryContainer,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      lineHeight: 1.6,
                    ),
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              valueOrDefault<String>(
                widget!.time,
                '11:02 AM',
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
            if (valueOrDefault<bool>(
              widget!.isMe,
              false,
            ))
              Icon(
                Icons.done_all_rounded,
                color: FlutterFlowTheme.of(context).secondary,
                size: 14.0,
              ),
          ].divide(SizedBox(width: 4.0)),
        ),
      ].divide(SizedBox(height: 4.0)),
    );
  }
}
