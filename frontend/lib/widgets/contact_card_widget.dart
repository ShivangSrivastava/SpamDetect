import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:frontend/model/contact_card_widget_model.dart';

class ContactCardWidgetWidget extends StatefulWidget {
  const ContactCardWidgetWidget({super.key});

  @override
  State<ContactCardWidgetWidget> createState() =>
      _ContactCardWidgetWidgetState();
}

class _ContactCardWidgetWidgetState extends State<ContactCardWidgetWidget> {
  late ContactCardWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactCardWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: FlutterFlowTheme.of(context).primaryBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: const AlignmentDirectional(0, 0),
                child: Text(
                  'A',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Inter Tight',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello World',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  'Hello World',
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
