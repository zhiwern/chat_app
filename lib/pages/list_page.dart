import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'text_page.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 5),
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 20,
            itemBuilder: (context, index) {
              return OpenContainer(
                transitionDuration: const Duration(milliseconds: 500),
                closedBuilder: (context, opener) {
                  return UserListTile(index: index);
                },
                openBuilder: (context, opener) {
                  return TextPage(title: "Person $index");
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class UserListTile extends StatelessWidget {
  const UserListTile({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Tile number $index'),
      subtitle: Text('Subtitle number $index'),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        child: const Icon(Icons.person),
      ),
      trailing: Text('${DateTime.now().hour}:${DateTime.now().minute}'),
    );
  }
}
