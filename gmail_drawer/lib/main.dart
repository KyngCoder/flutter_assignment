import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Gmail Drawer"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 24, 0, 16),
                child: Text(
                  "Gmail",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
                width: double.infinity,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: ListTile(
                  leading: Icon(
                    Icons.mail_outline,
                    size: 28,
                  ),
                  title: Text(
                    "All Inboxes",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
                width: double.infinity,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8),
                child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    topRight: Radius.circular(40)
                    )
                ),
                  tileColor: Color.fromARGB(255, 170, 81, 53),
                  leading: Icon(
                    Icons.mail,
                    size: 28,
                  ),
                  title: Text(
                    "Inbox",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
                width: double.infinity,
              ),
                const Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                child: ListTile(
                  leading: Icon(
                    Icons.star_outline,
                    size: 28,
                  ),
                  title: Text(
                    "Starred",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

                const Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.clock,
                    size: 28,
                  ),
                  title: Text(
                    "Snoozed",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

                const Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                child: ListTile(
                  leading: Icon(
                    Icons.label_outline,
                    size: 28,
                  ),
                  title: Text(
                    "Important",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

                const Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                child: ListTile(
                  leading:Icon(FontAwesomeIcons.paperPlane),
                  title: Text(
                    "Sent",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

                const Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.file,
                    size: 28,
                  ),
                  title: Text(
                    "Drafts",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

                const Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                child: ListTile(
                  leading: Icon(
                    Icons.mail_outline,
                    size: 28,
                  ),
                  title: Text(
                    "All Mail",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

  const Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                child: ListTile(
                  leading: Icon(
                    Icons.error_outline,
                    size: 28,
                  ),
                  title: Text(
                    "Spam",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

                const Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                child: ListTile(
                  leading: Icon(
                    Icons.delete_sweep,
                    size: 28,
                  ),
                  title: Text(
                    "Thrash",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
               Container(
                height: 1,
                color: Colors.grey,
                width: double.infinity,
              ),

                const Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                child: ListTile(
                  leading: Icon(
                    Icons.add,
                    size: 28,
                  ),
                  title: Text(
                    "Create New",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey
              ),
               Container(
                height: 1,
                color: Colors.grey,
                width: double.infinity,
              ),

                const Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    size: 28,
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            



            ],
          ),
        ),
      ),
    );
  }
}
