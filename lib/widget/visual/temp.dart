import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/common/global.dart';
import 'package:tifront/util/screen_util.dart';
import 'package:tifront/widget/visual/models/wordcloud_data.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController =
  TextEditingController(); //管理输入字段

  final List<ChatMessage> _message = <ChatMessage>[];

  /*
  处理提交动作
   */
  void _handleSubmitted(String text) {
    _textEditingController.clear();
    setState(() {
      _message.insert(0, ChatMessage(text: text));
    });
  }

  ///构建聊天输入文本框
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
//                color: Colors.red,
                child: TextField(
                  controller: _textEditingController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration.collapsed(
                    hintText: "发送消息",
                  ),
                ),
              ),
            ),
            Container(
//              color: Colors.green,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  _handleSubmitted(_textEditingController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("谈天说地"),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              reverse: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      _message[index],
                      SizedBox(height: 20,)
                    ],
                  ),
                );
              },
              itemCount: _message.length,
            ),
          ),
          Divider(
            thickness: 3,
          ),
          Container(
            child: _buildTextComposer(),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
          ),
        ],
      ),
    );
  }
}