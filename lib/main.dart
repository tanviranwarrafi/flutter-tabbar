import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tabbar_flutter/category.dart';
import 'package:tabbar_flutter/settings.dart';
import 'package:tabbar_flutter/web.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TabsPage(),
    );
  }
}

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar Flutter'),
        bottom: TabBar(controller: tabController, tabs: <Tab>[
          Tab(
            icon: Icon(Icons.category),
            text: 'Category',
          ),
          Tab(
            icon: Icon(Icons.settings),
            text: 'Settings',
          ),
          Tab(
            icon: Icon(Icons.web),
            text: 'Web',
          ),
        ]),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 16.0),
          TabBar(
            controller: tabController,
            tabs: <Tab>[
              Tab(
                icon: Icon(
                  Icons.category,
                  color: Colors.red,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.settings,
                  color: Colors.red,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.web,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: <Widget>[CategoryPage(), SettingsPage(), WebPage()],
            ),
          ),
        ],
      ),
    );
  }
}
