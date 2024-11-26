import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:frontend/model/contact_card_widget_model.dart';
import 'package:frontend/screen/home_page.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for contact_card_widget component.
  late ContactCardWidgetModel contactCardWidgetModel;

  @override
  void initState(BuildContext context) {
    contactCardWidgetModel =
        createModel(context, () => ContactCardWidgetModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    contactCardWidgetModel.dispose();
  }
}
