import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/models/repo.dart';
import 'package:flutter_demo/util/funs.dart';

class RepoItem extends StatefulWidget {
  // 将`repo.id`作为RepoItem的默认key
  RepoItem(this.repo) : super(key: ValueKey(repo.id));

  final Repo repo;

  @override
  _RepoItemState createState() => _RepoItemState();
}

class _RepoItemState extends State<RepoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Material(
        color: Colors.white,
        shape: BorderDirectional(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  gmAvatar(widget.repo.owner?.avatar_url,
                      width: 24, height: 24),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        widget.repo?.owner?.updated_at ?? "",
                        textScaleFactor: .9,
                      ),
                    ),
                  ),
                  Text(widget.repo?.language ?? "未知"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.repo.fork
                        ? widget.repo?.fullName
                        : widget.repo?.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontStyle: widget.repo.fork
                            ? FontStyle.italic
                            : FontStyle.normal),
                  ),
                  Text(
                    widget.repo.description ?? "仓库没有添加描述",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.15,
                      color: Colors.blueGrey[700],
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            _buildBottom(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return IconTheme(
        data: IconThemeData(color: Colors.grey[700], size: 15),
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.grey[700], fontSize: 12),
          child: Builder(
            builder: (context) {
              var width = 9; //间距
              var children = <Widget>[
                Icon(Icons.star),
                Text(
                    " ${widget.repo.stargazersCount.toString().padRight(width)}"),
                Icon(Icons.info_rounded),
                Text(
                    " ${widget.repo.openIssuesCount.toString().padRight(width)}"),
                Icon(Icons.whatshot_outlined),
                Text(" ${widget.repo.forksCount.toString().padRight(width)}")
              ];

              if (widget.repo.fork) {
                children.add(Text(" forked".padRight(width)));
              }
              //私有仓库
              if (widget.repo.private) {
                children.add(Icon(Icons.lock_rounded));
                children.add(Text(" private".padRight(width)));
              }
              return Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 8, right: 12),
                  child: Row(
                    children: children,
                  ));
            },
          ),
        ));
  }
}
