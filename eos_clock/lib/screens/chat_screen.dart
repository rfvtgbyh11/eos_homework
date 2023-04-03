import 'package:eos_clock/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat screen'),
        centerTitle: true,
        backgroundColor: Palette.appBarColor,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            )
          ),
        ]
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chats/WnKYxRZveU0xk25p9a0X/message').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      docs[index]['text'],
                      style: TextStyle(fontSize: 20.0),
                    )
                );
              }
          );
        },
      ),
    );}
}
