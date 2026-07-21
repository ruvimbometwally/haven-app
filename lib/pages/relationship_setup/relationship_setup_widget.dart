import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'relationship_setup_model.dart';
export 'relationship_setup_model.dart';

class RelationshipSetupWidget extends StatefulWidget {
  const RelationshipSetupWidget({super.key});

  static String routeName = 'RelationshipSetup';
  static String routePath = '/relationshipSetup';

  @override
  State<RelationshipSetupWidget> createState() =>
      _RelationshipSetupWidgetState();
}

class _RelationshipSetupWidgetState extends State<RelationshipSetupWidget> {
  late RelationshipSetupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RelationshipSetupModel());
    _model.focusValues = [];
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _saveSetup() async {
    if (_model.relationshipStartDate == null ||
        _model.durationValue == null ||
        _model.focusValues!.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please answer all questions to continue')),
        );
      }
      return;
    }

    final userDoc = await UsersRecord.getDocumentOnce(currentUserReference!);
    if (userDoc.coupleRef == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Couple connection not found. Please try again.')),
        );
      }
      return;
    }

    await userDoc.coupleRef!.update({
      'relationship_start_date': _model.relationshipStartDate,
      'relationship_duration': _model.durationValue,
      'primary_goals': _model.focusValues,
      'anniversary_date': _model.anniversaryDate,
      'important_dates': _model.importantDates,
    });

    if (context.mounted) {
      context.goNamed(HomeDashboardWidget.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Set Up Your Space',
                  style: theme.headlineMedium.override(
                    font: GoogleFonts.plusJakartaSans(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Help us personalize your journey together.',
                  style: theme.bodyMedium.override(
                    font: GoogleFonts.outfit(),
                    color: theme.secondaryText,
                  ),
                ),
                const SizedBox(height: 32.0),

                // Question 0: Accurate Relationship Start Date
                Text(
                  'When did your journey begin?',
                  style: theme.titleSmall.override(
                    font: GoogleFonts.plusJakartaSans(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12.0),
                InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      setState(() => _model.relationshipStartDate = date);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: theme.secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: theme.alternate),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _model.relationshipStartDate == null
                              ? 'Select Start Date'
                              : dateTimeFormat('MMM d, yyyy',
                                  _model.relationshipStartDate),
                          style: TextStyle(
                            color: _model.relationshipStartDate == null
                                ? theme.secondaryText
                                : theme.primaryText,
                          ),
                        ),
                        Icon(Icons.favorite_rounded,
                            color: theme.primary, size: 20.0),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 32.0),
                
                // Question 1
                Text(
                  'How would you describe your current stage?',
                  style: theme.titleSmall.override(
                    font: GoogleFonts.plusJakartaSans(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: ['< 6 mos', '1-3 yrs', '3-5 yrs', '5+ yrs'].map((duration) {
                    final selected = _model.durationValue == duration;
                    return ChoiceChip(
                      label: Text(duration),
                      selected: selected,
                      onSelected: (val) {
                        setState(() => _model.durationValue = val ? duration : null);
                      },
                      selectedColor: theme.primary,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : theme.primaryText,
                      ),
                    );
                  }).toList(),
                ),
                
                const SizedBox(height: 32.0),
                
                // Question 2
                Text(
                  "What's your primary focus right now?",
                  style: theme.titleSmall.override(
                    font: GoogleFonts.plusJakartaSans(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Select all that apply',
                  style: theme.labelSmall,
                ),
                const SizedBox(height: 12.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    'Deeper communication',
                    'Date nights',
                    'Conflict resolution',
                    'Shared goals'
                  ].map((focus) {
                    final selected = _model.focusValues!.contains(focus);
                    return FilterChip(
                      label: Text(focus),
                      selected: selected,
                      onSelected: (val) {
                        setState(() {
                          if (val) {
                            _model.focusValues!.add(focus);
                          } else {
                            _model.focusValues!.remove(focus);
                          }
                        });
                      },
                      selectedColor: theme.secondary,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : theme.primaryText,
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 32.0),

                // Question 3
                Text(
                  'Important Anniversaries',
                  style: theme.titleSmall.override(
                    font: GoogleFonts.plusJakartaSans(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Add dates like marriage, wedding, or any special milestone.',
                  style: theme.labelSmall,
                ),
                const SizedBox(height: 12.0),
                ..._model.importantDates.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: theme.secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: theme.alternate),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['label'] as String,
                                    style: theme.bodyMedium.override(
                                      font: GoogleFonts.outfit(),
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                    dateTimeFormat(
                                        'MMM d, yyyy', item['date'] as DateTime),
                                    style: theme.bodySmall),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_outline_rounded,
                                color: Colors.red, size: 20.0),
                            onPressed: () {
                              setState(() {
                                _model.importantDates.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                InkWell(
                  onTap: () async {
                    String? label;
                    DateTime? selectedDate;
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Add Important Date'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Label (e.g. Wedding)'),
                              onChanged: (val) => label = val,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now().add(const Duration(days: 36500)),
                                );
                                if (date != null) {
                                  selectedDate = date;
                                }
                              },
                              child: const Text('Select Date'),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              if (label != null && selectedDate != null) {
                                setState(() {
                                  _model.importantDates.add({
                                    'label': label!,
                                    'date': selectedDate!,
                                  });
                                });
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: theme.primaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: theme.primary, width: 1.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_rounded, color: theme.primary, size: 20.0),
                        const SizedBox(width: 8.0),
                        Text('Add Anniversary',
                            style: TextStyle(color: theme.primary)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 48.0),
                
                wrapWithModel(
                  model: _model.buttonModel ??= createModel(context, () => ButtonModel()),
                  updateCallback: () => safeSetState(() {}),
                  child: InkWell(
                    onTap: () => _saveSetup(),
                    child: const ButtonWidget(
                      content: 'Complete Setup',
                      variant: 'primary',
                      size: 'large',
                      fullWidth: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
