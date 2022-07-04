import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (context, index) => ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Caller number $index",
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.call,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
