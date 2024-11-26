import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:frontend/core/app_theme.dart';
import 'package:frontend/model/test_page_model.dart';

class TestPageWidget extends StatefulWidget {
  const TestPageWidget({super.key});

  @override
  State<TestPageWidget> createState() => _TestPageWidgetState();
}

class _TestPageWidgetState extends State<TestPageWidget> {
  late TestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
         
          title: Text(
            'Test Sms',
            style:
                FlutterFlowTheme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 0.0,
                    ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle: FlutterFlowTheme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                        hintText: 'Write message here...',
                        hintStyle: FlutterFlowTheme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffff5963),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffff5963),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).dialogBackgroundColor,
                      ),
                      style: FlutterFlowTheme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                      maxLines: 6,
                      cursorColor: FlutterFlowTheme.of(context).dividerColor,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ),
              Text(
                'SPAM',
                style:
                    FlutterFlowTheme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: 'Inter Tight',
                          color: const Color(0xffff5963),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w900,
                        ),
              ),
              FFButtonWidget(
                onPressed: () {
                  if (kDebugMode) {
                    print('Button pressed ...');
                  }
                },
                text: 'Check',
                options: FFButtonOptions(
                  height: 40,
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
