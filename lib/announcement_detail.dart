import 'package:flutter/material.dart';
import 'package:hero_widget_example/announcement_model.dart';

class AnnouncementDetailPage extends StatefulWidget {
  final AnnouncementModel announcementModel;

  const AnnouncementDetailPage({Key key, @required this.announcementModel}) : super(key: key);

  @override
  _AnnouncementDetailPageState createState() => _AnnouncementDetailPageState();
}

class _AnnouncementDetailPageState extends State<AnnouncementDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar, body: _buildMainContent);
  }

  AppBar get _buildAppBar => AppBar(title: Text("Detail"));

  SingleChildScrollView get _buildMainContent {
    return SingleChildScrollView(
        child: Stack(
      children: <Widget>[
        Column(children: <Widget>[_buildImageContent, _buildDescriptionContent]),
        Positioned(
          right: 10.0,
          top: 220,
          child: new FloatingActionButton(
            heroTag: "hero_tag",
            child: new Icon(Icons.play_circle_filled),
            onPressed: () {
              print('FAB tapped!');
            },
            backgroundColor: Colors.blueAccent,
          ),
        )
      ],
    ));
  }

  Hero get _buildImageContent {
    return Hero(
      tag: "${widget.announcementModel.photoUrl}",
      child: Container(
        width: double.infinity,
        height: 250,
        child: Image.network(
          widget.announcementModel.photoUrl,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Padding get _buildDescriptionContent {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(widget.announcementModel.desc * 10),
    );
  }
}
