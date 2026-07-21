import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'side_nav_model.dart';
export 'side_nav_model.dart';

class SideNavWidget extends StatefulWidget {
  const SideNavWidget({
    super.key,
    this.selectedPage = '',
  });

  final String selectedPage;

  @override
  State<SideNavWidget> createState() => _SideNavWidgetState();
}

class _SideNavWidgetState extends State<SideNavWidget> {
  late SideNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  Widget _buildNavItem({
    required String label,
    required IconData icon,
    required String routeName,
  }) {
    final bool isSelected = widget.selectedPage == routeName;
    final theme = FlutterFlowTheme.of(context);

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? theme.primary : theme.secondaryText,
        size: 24.0,
      ),
      title: Text(
        label,
        style: theme.bodyMedium.override(
          font: GoogleFonts.outfit(),
          color: isSelected ? theme.primary : theme.primaryText,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected
          ? Container(
              width: 4.0,
              height: 24.0,
              decoration: BoxDecoration(
                color: theme.primary,
                borderRadius: BorderRadius.circular(2.0),
              ),
            )
          : null,
      onTap: () {
        if (!isSelected) {
          context.goNamed(routeName);
        } else {
          Navigator.pop(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return Drawer(
      backgroundColor: theme.secondaryBackground,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.primary,
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_rounded,
                        color: theme.primary,
                        size: 32.0,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'OurLuv',
                      style: theme.headlineSmall.override(
                        font: GoogleFonts.plusJakartaSans(),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Your private space',
                      style: theme.bodySmall.override(
                        font: GoogleFonts.outfit(),
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildNavItem(
                  label: 'Dashboard',
                  icon: Icons.dashboard_rounded,
                  routeName: 'HomeDashboard',
                ),
                _buildNavItem(
                  label: 'Conversations',
                  icon: Icons.chat_bubble_rounded,
                  routeName: 'Conversations',
                ),
                _buildNavItem(
                  label: 'Shared Calendar',
                  icon: Icons.calendar_month_rounded,
                  routeName: 'SharedCalendar',
                ),
                _buildNavItem(
                  label: 'Memories',
                  icon: Icons.photo_library_rounded,
                  routeName: 'MemoriesScrapbook',
                ),
                _buildNavItem(
                  label: 'Appreciation Journal',
                  icon: Icons.favorite_rounded,
                  routeName: 'AppreciationJournal',
                ),
                _buildNavItem(
                  label: 'Planning Lists',
                  icon: Icons.checklist_rounded,
                  routeName: 'PlanningLists',
                ),
                _buildNavItem(
                  label: 'Relationship Profile',
                  icon: Icons.people_rounded,
                  routeName: 'RelationshipProfileUs',
                ),
                const Divider(),
                _buildNavItem(
                  label: 'Settings',
                  icon: Icons.settings_rounded,
                  routeName: 'SettingsPrivacy',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
