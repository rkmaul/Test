import 'package:flutter/material.dart';
import 'package:swamedia_test/src/models/post-model.dart';
import 'package:swamedia_test/src/services/post-service.dart';

class PostFindById extends StatefulWidget {
  PostFindById({Key key}) : super(key: key);

  @override
  _PostFindByIdState createState() => _PostFindByIdState();
}

PostModel postModel;
int index;
PostService service = new PostService();

class _PostFindByIdState extends State<PostFindById> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Find By Id"),
      ),
      body: Center(
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        (postModel != null) ? postModel.id.toString() : " ",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text((postModel != null) ? postModel.title : " ",
                            style: TextStyle(fontSize: 10)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          (postModel != null) ? postModel.body : " ",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                child: TextField(
                  decoration:
                      InputDecoration(hintText: "Insert Post Id (1 - 100)"),
                  onChanged: (text) {
                    index = int.parse(text);
                  },
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  service.getPost(index).then((value) {
                    postModel = value;
                    setState(() {});
                  });
                },
                child: Container(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Text("Press here!"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
