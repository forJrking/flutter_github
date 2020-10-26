import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_demo/test/ui/DioList.dart';
import 'package:path_provider/path_provider.dart';

//测试文件 api
class FileViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FileViewPageState();
}

class _FileViewPageState extends State<FileViewPage> {
  int _num;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String args= ModalRoute.of(context).settings.arguments;
    _num = int.parse(args);
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text("文件内容:$_num"),
              RaisedButton(onPressed: _toWrite, child: Text('写入'))
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }

  Future<File> _writeFile(String string) async {
    var file = await getFile();
    return file.writeAsString(string);
  }

  _readFile() async {
    File file = await getFile();
    return await file.readAsString();
  }

  Future<File> getFile() async {
    var dir = await getTemporaryDirectory();
    var file = new File("${dir.path}/temp.txt");
    return file;
  }

  void _toWrite() async {
    setState(() {
      _num++;
    });
    print("${Platform.isAndroid}");
    await _writeFile("$_num")
        .then((value) => {
          Navigator.pop(context)
        });
  }
}
