import '/components/button/button_model.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'partner_connection_widget.dart' show PartnerConnectionWidget;
import 'package:flutter/material.dart';

class PartnerConnectionModel extends FlutterFlowModel<PartnerConnectionWidget> {
  ///  Local state fields for this page.

  String? inputCode;

  String? error;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Button component.
  late ButtonModel buttonModel1;
  // Model for Button component.
  late ButtonModel buttonModel2;
  // Model for Button component.
  late ButtonModel buttonModel3;
  // Model for Button component.
  late ButtonModel buttonModel4;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    buttonModel3 = createModel(context, () => ButtonModel());
    buttonModel4 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    buttonModel1.dispose();
    buttonModel2.dispose();
    buttonModel3.dispose();
    buttonModel4.dispose();
  }
}
