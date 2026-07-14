import '/components/bottom_nav2/bottom_nav2_widget.dart';
import '/components/chat_bubble/chat_bubble_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/components/voice_note/voice_note_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'conversations_widget.dart' show ConversationsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConversationsModel extends FlutterFlowModel<ConversationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ChatBubble.
  late ChatBubbleModel chatBubbleModel1;
  // Model for ChatBubble.
  late ChatBubbleModel chatBubbleModel2;
  // Model for ChatBubble.
  late ChatBubbleModel chatBubbleModel3;
  // Model for VoiceNote.
  late VoiceNoteModel voiceNoteModel;
  // Model for ChatBubble.
  late ChatBubbleModel chatBubbleModel4;
  // Model for TextField.
  late TextFieldModel textFieldModel;
  // Model for BottomNav.
  late BottomNav2Model bottomNavModel;

  @override
  void initState(BuildContext context) {
    chatBubbleModel1 = createModel(context, () => ChatBubbleModel());
    chatBubbleModel2 = createModel(context, () => ChatBubbleModel());
    chatBubbleModel3 = createModel(context, () => ChatBubbleModel());
    voiceNoteModel = createModel(context, () => VoiceNoteModel());
    chatBubbleModel4 = createModel(context, () => ChatBubbleModel());
    textFieldModel = createModel(context, () => TextFieldModel());
    bottomNavModel = createModel(context, () => BottomNav2Model());
  }

  @override
  void dispose() {
    chatBubbleModel1.dispose();
    chatBubbleModel2.dispose();
    chatBubbleModel3.dispose();
    voiceNoteModel.dispose();
    chatBubbleModel4.dispose();
    textFieldModel.dispose();
    bottomNavModel.dispose();
  }
}
