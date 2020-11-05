import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final chats =
        _firebase.collection('chats/Xn7VXTNGQlWWtQRLFEBU/messages').snapshots();
    return Scaffold(
      body: StreamBuilder(
          stream: chats,
          builder: (ctx, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());

            final chatDocs = streamSnapshot.data.docs;
            return ListView.builder(
                itemCount: chatDocs.length,
                itemBuilder: (ctx, index) => Container(
                      padding: EdgeInsets.all(8),
                      child: Text(chatDocs[index].data()['text']),
                    ));
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _firebase
              .collection('chats/Xn7VXTNGQlWWtQRLFEBU/messages')
              .add({'text': 'Thi is addes by button!'})),
    );
  }
}
