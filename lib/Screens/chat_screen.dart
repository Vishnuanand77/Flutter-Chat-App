import 'package:chatapp/Widgets/Chat/messages.dart';
import 'package:chatapp/Widgets/Chat/newMessage.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
//   @override
//  void initState() {
//     super.initState();
//     final fbm = FirebaseMessaging();
//     fbm.requestNotificationPermissions();
//     fbm.configure(onMessage: (msg) {
//       print(msg);
//       return;
//     }, onLaunch: (msg) {
//       print(msg);
//       return;
//     }, onResume: (msg) {
//       print(msg);
//       return;
//     });
//     fbm.subscribeToTopic('chat');
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Flutter Chat',
          style: TextStyle(
            fontFamily: 'billabong',
            fontSize: 30,
          ),
        ),
        actions: [
          DropdownButton(
            underline: Container(),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Firestore.instance
      //         .collection('chats/TxKIxCdx6mtAFhm6etP0/messages')
      //         .add({'text': 'This was added by a FAB click!'});
      //   },
      // ),
    );
  }
}
