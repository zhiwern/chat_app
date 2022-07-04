import 'package:flutter/material.dart';
import 'chat_bubble.dart';

class TextPage extends StatefulWidget {
  const TextPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              child: const Icon(Icons.person),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ListView.separated(
              padding: const EdgeInsets.only(
                  bottom: 0, left: 10, right: 10, top: 10),
              reverse: true,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('Last seen'),
                    ),
                  );
                } else {
                  return Align(
                    alignment: index.isOdd
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: ChatBubble(
                      text: 'Message number $index',
                      index: index,
                    ),
                  );
                }
              },
              itemCount: 20,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 20);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: "Type something",
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 3),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send_rounded,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
