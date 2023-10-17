
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/home/screens/widget/build_mesage.dart';
import 'package:whatsapp/home/screens/widget/text_filed_to_send_maseege.dart';

import '../../../util/color.dart';
import '../../../util/widget/loading.dart';
import '../../data/model/message_model.dart';

class CustomListViewToShowAllMessaage extends StatelessWidget {
  const CustomListViewToShowAllMessaage({super.key, required this.idUser});
  final String idUser;

  @override
  Widget build(BuildContext context) {
    List<String> data = [FirebaseAuth.instance.currentUser!.uid, idUser];
    data.sort();
    String chatId = data.join("_");

    final Stream<QuerySnapshot> message = FirebaseFirestore.instance
        .collection(chatId)
        .orderBy('date')
        .snapshots();
        

    return
     StreamBuilder<QuerySnapshot>(
        stream: message,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List<MessageModl> allMessage = snapshot.data!.docs
                .map((e) => MessageModl.fromfirebase(e))
                .toList();

            return _buildListView(allMessage);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(color: textColor),
              ),
            );
          } else {
            return const Loading();
          }
        });
 
 
  }

  Column _buildListView(List<MessageModl> allMessage) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: allMessage.length,
            itemBuilder: (contex, index) => BuildMessage(
              messageModl: allMessage[index],
            ),
          ),
        ),
        BuildTextFiledToSendMessage(
          controller: TextEditingController(),
          idReciver:idUser ,
        ),
        const SizedBox(height: 6)
      ],
    );
  }
}
