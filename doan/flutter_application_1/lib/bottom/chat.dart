import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

Future<void> main() async {
  const apiKey = "kaewdhm2t5ts";
  const userToken =
      "chgujj8v948enjpmbznzn22amxyje5cz4372bxyhmt24ny69x7jck8c9yqxk2r9p";
  final client = StreamChatClient(apiKey, logLevel: Level.INFO);

  await client.connectUser(
    User(id: 'xxsouji'),
    userToken,
  );

  final channel = client.channel(
    'messaging',
    id: 'coolkids',
  );
  channel.watch();

  runApp(Chat(client, channel));
}

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Text(
          'Chat',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
