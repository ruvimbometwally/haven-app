import '/components/nav_item/nav_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bottom_nav3_model.dart';
export 'bottom_nav3_model.dart';

class BottomNav3Widget extends StatefulWidget {
  const BottomNav3Widget({super.key});

  @override
  State<BottomNav3Widget> createState() => _BottomNav3WidgetState();
}

class _BottomNav3WidgetState extends State<BottomNav3Widget> {
  late BottomNav3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNav3Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            wrapWithModel(
              model: _model.navItemModel1,
              updateCallback: () => safeSetState(() {}),
              child: const NavItemWidget(
                label: 'Home',
                icon: Icon(
                  Icons.home_rounded,
                  size: 24.0,
                ),
                target: 'HomeDashboard',
                selected: true,
              ),
            ),
            wrapWithModel(
              model: _model.navItemModel2,
              updateCallback: () => safeSetState(() {}),
              child: const NavItemWidget(
                label: 'Chat',
                icon: Icon(
                  Icons.chat_bubble_outline_rounded,
                  size: 24.0,
                ),
                target: 'Conversations',
                selected: false,
              ),
            ),
            wrapWithModel(
              model: _model.navItemModel3,
              updateCallback: () => safeSetState(() {}),
              child: const NavItemWidget(
                label: 'Calendar',
                icon: Icon(
                  Icons.calendar_today_rounded,
                  size: 24.0,
                ),
                target: 'SharedCalendar',
                selected: false,
              ),
            ),
            wrapWithModel(
              model: _model.navItemModel4,
              updateCallback: () => safeSetState(() {}),
              child: const NavItemWidget(
                label: 'Memories',
                icon: Icon(
                  Icons.auto_stories_rounded,
                  size: 24.0,
                ),
                target: 'MemoriesScrapbook',
                selected: false,
              ),
            ),
            wrapWithModel(
              model: _model.navItemModel5,
              updateCallback: () => safeSetState(() {}),
              child: const NavItemWidget(
                label: 'Us',
                icon: Icon(
                  Icons.favorite_border_rounded,
                  size: 24.0,
                ),
                target: 'RelationshipProfileUs',
                selected: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
