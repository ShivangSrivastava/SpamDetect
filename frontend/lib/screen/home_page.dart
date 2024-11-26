// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:frontend/core/app_theme.dart';
import 'package:frontend/model/home_page_model.dart';
import 'package:frontend/screen/test_page.dart';
import 'package:frontend/widgets/message_card_widget.dart';

class HomePageWidget extends StatefulWidget {
  final bool isDark;
  final VoidCallback changeTheme;
  const HomePageWidget({
    Key? key,
    required this.isDark,
    required this.changeTheme,
  }) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TestPageWidget(),
                ));
          },
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          elevation: 8,
          child: const Icon(
            Icons.message,
            color: Colors.white,
            size: 24,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(28, 0, 0, 0),
              child: Text(
                'Sms Spam Detection',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(widget.isDark ? Icons.nightlight : Icons.sunny),
              onPressed: () {
                widget.changeTheme();
              },
            )
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                Align(
                  alignment: const Alignment(0, 0),
                  child: TabBar(
                    labelColor:
                        FlutterFlowTheme.of(context).dialogBackgroundColor,
                    unselectedLabelColor: const Color(0x8CE0E3E7),
                    labelStyle: FlutterFlowTheme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                          fontFamily: 'Inter Tight',
                          letterSpacing: 0.0,
                        ),
                    unselectedLabelStyle: FlutterFlowTheme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                          fontFamily: 'Inter Tight',
                          letterSpacing: 0.0,
                        ),
                    dividerColor: FlutterFlowTheme.of(context).primaryColor,
                    indicatorColor: FlutterFlowTheme.of(context).primaryColor,
                    tabs: const [
                      Tab(
                        text: 'Inbox',
                      ),
                      Tab(
                        text: 'Unsure',
                      ),
                      Tab(
                        text: 'Spam',
                      ),
                    ],
                    controller: _model.tabBarController,
                    onTap: (i) async {
                      [() async {}, () async {}, () async {}][i]();
                    },
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _model.tabBarController,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, -1),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 1,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .dialogBackgroundColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: const [
                              MessageCard(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .dialogBackgroundColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 1,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .dialogBackgroundColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                      ),
                    ],
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
