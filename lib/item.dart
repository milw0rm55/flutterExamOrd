import 'package:flutter/material.dart';
import 'package:ordinarioflutter/repo.dart';

import 'package:url_launcher/url_launcher.dart';

class GithubItem extends StatelessWidget {
  final Repo repo;
  GithubItem(this.repo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {
            _launchURL(repo.htmlUrl);
          },
          highlightColor: Colors.lightBlueAccent,
          splashColor: Colors.red,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text((repo.title != null) ? repo.title : '-',
                      style: Theme.of(context).textTheme.subhead),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0)
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          )),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}