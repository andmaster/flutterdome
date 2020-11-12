import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MoviesList extends StatefulWidget {
  MoviesList({Key key, @required this.mt}) : super(key: key);

  final String mt;

  @override
  _MoviesListState createState() => _MoviesListState();
}

Dio dio = Dio();

class _MoviesListState extends State<MoviesList> {
  int page = 1; //默认显示第一页
  int pageSize = 10; //默认每页条数
  var mList = []; // 电影列表数据
  int total = 0; // 数据总数，实现分页效果

  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mList.length,
      itemBuilder: (BuildContext context, int index) {
        var mitem = mList[index];
        String imageUrl = mitem["images"]["small"];
        var headers = {
          "sec-fetch-user": "?1",
          "upgrade-insecure-requests": "1",
          "user-agent":
              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36",
          "cache-control": "max-age=0",
          "Accept":
              "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        };
        print("image url $index - $imageUrl");
        return Container(
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(top: BorderSide(color: Colors.black12))),
          height: 200,
          child: Row(
            children: <Widget>[
              FadeInImage(
                  placeholder: AssetImage("icon-1024.png", package: "icon"),
                  // image: AssetImage("p2624624109.webp", package: "webps"),
                  image: NetworkImage(
                      // imageUrl,
                      "https://andmaster.github.io/bio/images/webps/p2624624109.webp",
                      // "http://pic1.win4000.com/pic/e/b6/1eefb6b63f.jpg",
                      headers: headers),
                  width: 130,
                  height: 180,
                  fit: BoxFit.cover),
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("电影名称:${mitem["title"]}"),
                    Text("上映年份:${mitem["year"]}年"),
                    Text("电影类型:${mitem["genres"].join("  ")}"),
                    Text("豆瓣评分:${mitem["rating"]["average"]}分"),
                    Text("主要演员:${mitem["title"]}"),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  getMovieList() async {
    int offset = (page - 1) * pageSize;
    var response = await dio.get(
        "http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset&count=$pageSize");
    var data = response.data;
    //print(data);
    // 在setState中给私有属性赋值，否者页面不刷新
    setState(() {
      mList = data["subjects"];
      total = data["total"];
    });
  }
}
