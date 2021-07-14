import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DemoChatting'),
        actions: [
          DropdownButton(icon: Icon(Icons.more_vert), items: [
            DropdownMenuItem(child: Container(
              child: Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 8,),
                  Text('Logout')
                ],
              ),
            ),
            value: 'logout',)
          ],
            onChanged: (itemIdentifier){
            if (itemIdentifier == 'logout')
              {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('chats/mfVi5ZCbXRCllD7siQpN/messages').snapshots(),
        builder: (ctx, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        final documents = snapshot.data!.docs;
          return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (ctx, index) => Container(
                padding: EdgeInsets.all(8),
                child: Text(documents[index]['text']),
              ));
        },),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance.collection('chats/mfVi5ZCbXRCllD7siQpN/messages').add({
            'text': 'this was added by me'
          });
        })
          );
  }
}
