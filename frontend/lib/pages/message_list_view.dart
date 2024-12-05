import 'package:flutter/material.dart';
import 'package:frontend/models/sms.dart';
import 'package:frontend/pages/preview_message.dart';

class MessageListView extends StatelessWidget {
  final bool? showSpam;
  const MessageListView({
    super.key,
    this.showSpam,
    required this.smsResponses,
  });

  final List<SmsResponse> smsResponses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: smsResponses.length,
      itemBuilder: (context, index) {
        final sms = smsResponses[index];
        if (showSpam == true && !sms.isSpam) {
          return Container();
        }
        if (showSpam == false && sms.isSpam) {
          return Container();
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewMessage(
                        smsResponse: sms,
                      ),
                    ));
              },
              leading: Container(
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: sms.isSpam ? Colors.red : Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    sms.sender[0],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              subtitle: Text(
                sms.body,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              title: Text(sms.sender),
            ),
          ),
        );
      },
    );
  }
}
