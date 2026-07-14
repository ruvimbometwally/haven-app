import '/backend/backend.dart';
import '/components/album_chip/album_chip_widget.dart';
import '/components/bottom_nav4/bottom_nav4_widget.dart';
import '/components/button/button_widget.dart';
import '/components/memory_polaroid/memory_polaroid_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'memories_scrapbook_widget.dart' show MemoriesScrapbookWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MemoriesScrapbookModel extends FlutterFlowModel<MemoriesScrapbookWidget> {
  ///  Local state fields for this page.

  String? title;

  String? date;

  String? caption;

  String? location;

  String? albumId = 'All';

  String? error;

  ///  State fields for stateful widgets in this page.

  // Model for AlbumChip.
  late AlbumChipModel albumChipModel1;
  // Model for AlbumChip.
  late AlbumChipModel albumChipModel2;
  // Model for AlbumChip.
  late AlbumChipModel albumChipModel3;
  // Model for AlbumChip.
  late AlbumChipModel albumChipModel4;
  // Model for AlbumChip.
  late AlbumChipModel albumChipModel5;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for BottomNav.
  late BottomNav4Model bottomNavModel;

  @override
  void initState(BuildContext context) {
    albumChipModel1 = createModel(context, () => AlbumChipModel());
    albumChipModel2 = createModel(context, () => AlbumChipModel());
    albumChipModel3 = createModel(context, () => AlbumChipModel());
    albumChipModel4 = createModel(context, () => AlbumChipModel());
    albumChipModel5 = createModel(context, () => AlbumChipModel());
    buttonModel = createModel(context, () => ButtonModel());
    bottomNavModel = createModel(context, () => BottomNav4Model());
  }

  @override
  void dispose() {
    albumChipModel1.dispose();
    albumChipModel2.dispose();
    albumChipModel3.dispose();
    albumChipModel4.dispose();
    albumChipModel5.dispose();
    buttonModel.dispose();
    bottomNavModel.dispose();
  }
}
