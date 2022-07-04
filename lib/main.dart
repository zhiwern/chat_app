import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/list_page.dart';
import 'pages/call_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int selectedIndex;
  final List<Widget> pages = const [ChatsPage(), CallPage()];

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              selectedIndex == 0 ? 'Conversations' : 'Calls',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: pages[selectedIndex],
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            selectedIndex: selectedIndex,
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.chat_outlined,
                  ),
                  label: 'Chat'),
              NavigationDestination(
                  icon: Icon(
                    Icons.call_outlined,
                  ),
                  label: 'Call')
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            isExtended: true,
            label: Row(
              children: const [
                Icon(Icons.edit),
                SizedBox(
                  width: 10,
                ),
                Text("New")
              ],
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
