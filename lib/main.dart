import 'package:flutter/material.dart';
import './model/user.dart';

void main() => runApp(new ListViewApp());


class ListViewApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<User> items = new List();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      items.add(new User(
        1,
        2,
        'Jay',
        'Jay Dwivedi \n work in TCS',
      ));
      items.add(new User(
        1,
        3,
        'Rishab',
        'Rishabh Dave \n work in Accenture',));
      items.add(new User(
        2,
        4,
        'Rishi',
        'Rishi Dave \n work in TCS',));
      items.add(new User(
        2,
        5,
        'Rakesh',
        'Rakesh Dave \n work in Capgemini',));
      items.add(new User(
        3,
        6,
        'Rahul',
        'Rahul Dave \n work in Accenture',));
      items.add(new User(
        3,
        7,
        'Rohit',
        'Rohit Dave \n work in Cognigent',));
      items.add(new User(
        3,
        8,
        'prateek',
        'Prateek Dave \n work in Accenture',));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ListView Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ListView Demo'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: new Center(
          child: new ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                return new Column(
                  children: <Widget>[
                    new Divider(height: 5.0),
                    new ListTile(
                      title: new Text(
                        '${items[position].name}',
                        style: new TextStyle(
                          fontSize: 22.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      subtitle: new Text(
                        '${items[position].body}',
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      leading: new Column(
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 35.0,
                            child: new Text(
                              '${items[position].userId}',
                              style: new TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          new IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                items.removeAt(position);
                              });
                            },
                          ),
                        ],
                      ),
                      onTap: () => _onTapItem(context, items[position]),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  void _onTapItem(BuildContext context, User user) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(
        content: new Text(user.id.toString() + ' - ' + user.name)));
  }
}