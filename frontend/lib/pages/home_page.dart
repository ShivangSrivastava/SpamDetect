// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:frontend/models/sms.dart';
import 'package:frontend/pages/check_page.dart';
import 'package:frontend/pages/message_list_view.dart';
import 'package:frontend/service/api_services.dart';
import 'package:frontend/service/sms_service.dart';

class HomePage extends StatefulWidget {
  final VoidCallback changeTheme;
  final bool isDark;
  const HomePage({
    super.key,
    required this.changeTheme,
    required this.isDark,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ApiServices apiServices;
  late final SmsService smsService;

  String? _serverIp;
  List<SmsResponse> smsResponses = [];
  bool isLoading = true;

  int currentButtonNavBarIndex = 0;

  int total = 1;
  int done = 0;

  String? errorMessage;
  @override
  void initState() {
    super.initState();
    smsService = SmsService();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showIpInputDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sms Spam Filtering"),
        actions: [
          IconButton(
            icon: (widget.isDark) ? Icon(Icons.sunny) : Icon(Icons.nightlight),
            onPressed: () {
              widget.changeTheme();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                isLoading = true;
              });
              _fetchSmsResponses();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckPage(
                  ipAdress: _serverIp!,
                ),
              ));
        },
        child: Icon(Icons.segment_sharp),
      ),
      body: isLoading
          ? Center(
              child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(
                    value: done / total,
                  ),
                  Text(
                      "Loading... ${(100 * done / total).ceil()}% ($done/$total)")
                ],
              ),
            ))
          : errorMessage != null
              ? Center(
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : MessageListView(
                  smsResponses: smsResponses,
                  showSpam: (currentButtonNavBarIndex == 1)
                      ? false
                      : (currentButtonNavBarIndex == 2)
                          ? true
                          : null,
                ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentButtonNavBarIndex,
        onTap: (value) {
          setState(() {
            currentButtonNavBarIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: "All",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Unsure/Ham",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: "Spams",
          ),
        ],
      ),
    );
  }

  Future<void> _fetchSmsResponses() async {
    done = 0;
    try {
      List<SmsRequest> smsRequests = await smsService.getAllSms();
      List<SmsResponse> responses = [];
      total = smsRequests.length;
      for (var sms in smsRequests) {
        SmsResponse response = await apiServices.checkIsSpam(sms);
        responses.add(response);
        setState(() {
          done++;
        });
      }

      setState(() {
        smsResponses = responses;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  void _showIpInputDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents closing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Server IP'),
          content: TextField(
            controller: TextEditingController(text: "192.168."),
            onChanged: (value) {
              setState(() {
                _serverIp = value;
              });
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter the IP address",
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (_serverIp != null && _serverIp!.isNotEmpty) {
                  apiServices = ApiServices(ipAdress: _serverIp!);
                  _fetchSmsResponses();
                  Navigator.of(context).pop(); // Close the dialog
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
