import 'package:flutter/material.dart';
import 'package:flutterdome/demo3/movies_list_douban.dart';

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("电影列表"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text("andmaster@163.com"),
                accountName: Text("张文强"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://s2.itislooker.com/imgs/201901/18/11/15477820146379.jpg"),
                ),
                //美化控件
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://up.keaitupian.com/pic/59/27/72/59277219d6dc911389050e16e30d7738.jpg"))),
              ),
              ListTile(
                title: Text("用户反馈"),
                trailing: Icon(Icons.feedback),
              ),
              ListTile(
                title: Text("系统设置"),
                trailing: Icon(Icons.settings),
              ),
              ListTile(
                title: Text("我要发布"),
                trailing: Icon(Icons.send),
              ),
              Divider(),
              ListTile(
                title: Text("注销   "),
                trailing: Icon(Icons.logout),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.black),
          child: TabBar(
            labelStyle: TextStyle(fontSize: 10, height: 0.1),
            tabs: <Widget>[
              Tab(
                iconMargin: EdgeInsets.all(2),
                icon: Icon(Icons.movie_filter),
                text: "正在热映",
              ),
              Tab(
                iconMargin: EdgeInsets.all(2),
                icon: Icon(Icons.movie_creation),
                text: "即将上映",
              ),
              Tab(
                iconMargin: EdgeInsets.all(2),
                icon: Icon(Icons.local_movies),
                text: "Top250",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MoviesList(
              mt: "in_theaters",
            ),
            MoviesList(
              mt: "coming_soon",
            ),
            MoviesList(
              mt: "top250",
            ),
          ],
        ),
      ),
    );
  }
}
