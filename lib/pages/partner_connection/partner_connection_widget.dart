import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/index.dart';
import 'partner_connection_model.dart';
export 'partner_connection_model.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class PartnerConnectionWidget extends StatefulWidget {
  const PartnerConnectionWidget({super.key});

  static String routeName = 'PartnerConnection';
  static String routePath = '/partnerConnection';

  @override
  State<PartnerConnectionWidget> createState() =>
      _PartnerConnectionWidgetState();
}

class _PartnerConnectionWidgetState extends State<PartnerConnectionWidget> {
  late PartnerConnectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartnerConnectionModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => _establishMutualConnection());
  }

  Future<void> _establishMutualConnection() async {
    if (currentUserDocument == null ||
        (currentUserDocument?.partnerId.isEmpty ?? true) ||
        currentUserDocument?.coupleRef != null) {
      return;
    }

    try {
      final partnerUid = currentUserDocument!.partnerId;
      final partnerRef = UsersRecord.collection.doc(partnerUid);
      final partnerDoc = await UsersRecord.getDocumentOnce(partnerRef);

      DocumentReference? coupleRef;

      // 1. If partner already has a couple_ref, use that
      if (partnerDoc.coupleRef != null) {
        coupleRef = partnerDoc.coupleRef;
      } else if (partnerDoc.partnerId == currentUserUid) {
        // 2. Partner points back to us but doesn't have couple_ref yet (rare race condition)
        // Check if a couple document already exists with our references
        final existingCouples = await queryCouplesRecordOnce(
          queryBuilder: (q) =>
              q.where('user_refs', arrayContains: currentUserReference),
        );

        for (var couple in existingCouples) {
          if (couple.userRefs.any((ref) => ref.id == partnerUid)) {
            coupleRef = couple.reference;
            break;
          }
        }

        if (coupleRef == null) {
          // 3. Both have connected! Create new couple doc as the first establishers.
          final newRef = CouplesRecord.collection.doc();
          await newRef.set(createCouplesRecordData(
            createdAt: getCurrentTimestamp,
          ));
          await newRef.update({
            'user_refs': [currentUserReference!, partnerRef],
          });
          coupleRef = newRef;
        }
      }

      if (coupleRef != null) {
        // Update our own document with the couple reference
        await currentUserReference!.update({'couple_ref': coupleRef});

        if (mounted) {
          // Re-trigger navigation check via OnboardingEntry
          context.goNamed(OnboardingEntryWidget.routeName);
        }
      }
    } catch (e) {
      debugPrint('Error establishing mutual connection: $e');
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String myInviteCode = currentUserDocument?.inviteCode ?? 'HAVEN-CODE';
    final bool isWaitingForPartner =
        (currentUserDocument?.partnerId.isNotEmpty ?? false) &&
            currentUserDocument?.coupleRef == null;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: 0.0,
              height: 0.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      children: [
                        Image.network(
                          'https://dimg.dreamflow.cloud/v1/image/A%20gentle%2C%20warm%20aesthetic%20image%20of%20intertwined%20hands%20representing%20partnership%20and%20connection',
                          width: double.infinity,
                          height: 300.0,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.infinity,
                          height: 300.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primaryBackground,
                                Colors.transparent
                              ],
                              stops: const [0.0, 1.0],
                              begin: const AlignmentDirectional(0.0, 1.0),
                              end: const AlignmentDirectional(0, -1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isWaitingForPartner)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 24.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary10,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondary,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.hourglass_empty_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Waiting for your partner to enter your code...',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.outfit(),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 12.0)),
                                ),
                                const SizedBox(height: 8.0),
                                InkWell(
                                  onTap: () async {
                                    await _establishMutualConnection();
                                    if (context.mounted) {
                                      context.goNamed(
                                          OnboardingEntryWidget.routeName);
                                    }
                                  },
                                  child: Text(
                                    'Refresh app if partner already entered code',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.outfit(),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Connect with your partner',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            'Share your unique code and enter your partner\'s code to get started.',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FontWeight.normal,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ].divide(const SizedBox(height: 12.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Your Partner Code',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.outfit(
                                            fontWeight: FontWeight.w500,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Clipboard.setData(
                                          ClipboardData(text: myInviteCode));
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Partner code copied to clipboard',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration: const Duration(seconds: 2),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                        );
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          myInviteCode,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 2.0,
                                              ),
                                        ),
                                        Icon(
                                          Icons.content_copy_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Share.share(
                                          'Connect with me on OurLuv! My unique partner code is: $myInviteCode');
                                    },
                                    child: wrapWithModel(
                                      model: _model.buttonModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const ButtonWidget(
                                        iconPresent: false,
                                        iconEndPresent: false,
                                        content: 'Share Code',
                                        variant: 'outline',
                                        size: 'small',
                                        fullWidth: false,
                                        loading: false,
                                        disabled: false,
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                          if (currentUserDocument?.partnerId.isEmpty ?? true)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 24.0),
                                  child: Text(
                                    'OR',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.outfit(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          letterSpacing: 1.0,
                                        ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(24.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          'Enter Partner\'s Code',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'e.g. OL-A1B2C3',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      font:
                                                          GoogleFonts.outfit(),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.outfit(),
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final code = _model
                                                .textController.text
                                                .trim();
                                            if (code.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Please enter a partner code')),
                                              );
                                              return;
                                            }

                                            if (code ==
                                                currentUserDocument
                                                    ?.inviteCode) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'You cannot connect with yourself')),
                                              );
                                              return;
                                            }

                                            // Search for user with this invite code
                                            final partnerDocs =
                                                await queryUsersRecordOnce(
                                              queryBuilder: (q) => q.where(
                                                  'invite_code',
                                                  isEqualTo: code),
                                              limit: 1,
                                            );

                                            if (partnerDocs.isEmpty) {
                                              if (context.mounted) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          'Invalid partner code. Please check and try again.')),
                                                );
                                              }
                                              return;
                                            }

                                            final partner = partnerDocs.first;

                                            if (partner.partnerId.isNotEmpty &&
                                                partner.partnerId !=
                                                    currentUserUid) {
                                              if (context.mounted) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          'This partner is already connected.')),
                                                );
                                              }
                                              return;
                                            }

                                            // Handshake logic: Update only the current user's document.
                                            await currentUserReference!.update({
                                              'partnerId': partner.uid,
                                              'connection_status': 'paired',
                                            });

                                            // Now try to establish the mutual connection/couple record
                                            await _establishMutualConnection();

                                            if (context.mounted) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Connection established on your side! Ask your partner to enter your code to complete the link.')),
                                              );
                                              context.goNamed(
                                                  OnboardingEntryWidget
                                                      .routeName);
                                            }
                                          },
                                          child: wrapWithModel(
                                            model: _model.buttonModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: const ButtonWidget(
                                              iconPresent: false,
                                              iconEndPresent: false,
                                              content: 'Submit',
                                              variant: 'primary',
                                              size: 'large',
                                              fullWidth: true,
                                              loading: false,
                                              disabled: false,
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ].divide(const SizedBox(height: 24.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent4,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.info_outline_rounded,
                                size: 20.0,
                              ),
                              Text(
                                'Once connected, all your activities, photos, and messages will be private to just the two of you.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.outfit(),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await authManager.signOut();
                              if (context.mounted) {
                                context
                                    .goNamed(OnboardingEntryWidget.routeName);
                              }
                            },
                            child: wrapWithModel(
                              model: _model.buttonModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: const ButtonWidget(
                                iconPresent: false,
                                iconEndPresent: false,
                                content: 'Logout',
                                variant: 'ghost',
                                size: 'medium',
                                fullWidth: true,
                                loading: false,
                                disabled: false,
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Account'),
                                  content: const Text(
                                      'Are you sure you want to delete your account? This action cannot be undone.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: const Text('Delete',
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              );

                              if (confirm == true && context.mounted) {
                                await authManager.deleteUser(context);
                                if (context.mounted) {
                                  context.goNamed(
                                      OnboardingEntryWidget.routeName);
                                }
                              }
                            },
                            child: wrapWithModel(
                              model: _model.buttonModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: const ButtonWidget(
                                iconPresent: false,
                                iconEndPresent: false,
                                content: 'Delete Account',
                                variant: 'destructive',
                                size: 'small',
                                fullWidth: false,
                                loading: false,
                                disabled: false,
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 12.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
