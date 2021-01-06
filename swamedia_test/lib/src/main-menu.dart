import 'package:flutter/material.dart';
import 'package:swamedia_test/src/view/find-byId-view/post-find-by-id-view.dart';
import 'package:swamedia_test/src/view/normal-post-view/post-page-normal.dart';
import 'package:swamedia_test/src/view/post-view/post-page.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Menu")),
      body: ListView(
        children: <Widget>[
          InkWell(
            child: Card(
              child: ListTile(
                leading: FlutterLogo(size: 72.0),
                title: Text('Get With Infinite Scroll'),
                subtitle: Text('Get Post with Bloc infinite scroll.'),
                isThreeLine: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostsPage()),
                  );
                },
              ),
            ),
          ),
          InkWell(
            child: Card(
              child: ListTile(
                leading: FlutterLogo(size: 72.0),
                title: Text('Normal Get List Post'),
                subtitle: Text('Normal get list of post with Bloc.'),
                isThreeLine: true,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostPageNormal()),
              );
            },
          ),
          InkWell(
            child: Card(
              child: ListTile(
                leading: FlutterLogo(size: 72.0),
                title: Text('Find by Id'),
                subtitle: Text('Find by Id in list of Post.'),
                isThreeLine: true,
              ),
            ),
            onTap: () {
              print("change route");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostFindById()),
              );
            },
          ),
        ],
      ),
    );
  }
}
