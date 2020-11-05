import 'package:chat_app_flutter/widgets/chat/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final chats =
        _firebase.collection('chats/Xn7VXTNGQlWWtQRLFEBU/messages').snapshots();
    return Scaffold(
      appBar: AppBar(title: Text('FlutterChat'), actions: [
        DropdownButton(
          underline: Container(),
          icon: Icon(
            Icons.more_vert,
            color: Theme.of(context).primaryIconTheme.color,
          ),
          items: [
            DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout')
          ],
          onChanged: (itemIdentifier) {
            if (itemIdentifier == 'logout') {
              FirebaseAuth.instance.signOut();
            }
          },
        ),
      ]),
      body: Container(
          child: Column(children: [
        Expanded(
          child: Messages(),
        )
      ])),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _firebase
              .collection('chats/Xn7VXTNGQlWWtQRLFEBU/messages')
              .add({'text': 'Thi is addes by button!'})),
    );
  }
}
