import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:e_commerce/models/message_model.dart';
import 'package:e_commerce/views/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/strings.dart';

class ChatPage2 extends StatefulWidget {
  const ChatPage2({super.key});

  @override
  State<ChatPage2> createState() => _ChatPage2State();
}

class _ChatPage2State extends State<ChatPage2> {
  String myName = "ahmed";
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "chat",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (_, index) {
                return BubbleSpecialThree(
                  isSender: messages[index].senderName == myName ? true : false,
                  text: messages[index].text.toString(),
                  color: messages[index].senderName == myName
                      ? Colors.green
                      : Color(0xFF1B97F3),
                  tail: true,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                );
              }),
        ),
        Container(
          padding: EdgeInsets.all(15),
          height: 100.h,
          color: Colors.black,
          child: Row(
            children: [
              Expanded(
                child: AppTextFormField(
                    controller: textEditingController,
                    hintText: "Type a message ",
                    validator: (value) {}),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    messages.add(MessageModel(
                        text: textEditingController.text,
                        senderName: myName));
                    textEditingController.text = "";
                  });
                },
                icon: const Icon(Icons.send),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
