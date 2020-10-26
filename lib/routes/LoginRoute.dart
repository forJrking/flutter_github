import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/common/Global.dart';
import 'package:flutter_demo/models/UserInfo.dart';
import 'package:flutter_demo/net/Net.dart';
import 'package:flutter_demo/states/notifer.dart';
import 'package:flutter_demo/util/funs.dart';
import 'package:provider/provider.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false; //密码是否显示明文
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    _unameController.text = Global.profile.lastLogin;
    var text = _unameController.text;
    if (text != null && text.toString().trim().length <= 0) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("登录"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                      autofocus: _nameAutoFocus,
                      controller: _unameController,
                      decoration: InputDecoration(
                        labelText: '用户名',
                        hintText: '用户名或邮箱',
                        prefixIcon: Icon(Icons.person),
                      ),
                      // 校验用户名（不能为空）
                      validator: (v) {
                        return v.trim().isNotEmpty ? null : '用户名不能为空';
                      }),
                  TextFormField(
                    autofocus: !_nameAutoFocus,
                    controller: _pwdController,
                    decoration: InputDecoration(
                      labelText: '密码',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                            pwdShow ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            pwdShow = !pwdShow;
                          });
                        },
                      ),
                    ),
                    obscureText: pwdShow,
                    validator: (v) {
                      return v.trim().isNotEmpty ? null : '密码不能为空';
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text('登录'),
                      textColor: Colors.white,
                      onPressed: _login,
                    ),
                  )
                ],
              )),
        ));
  }

  void _login() async {
    if ((_formKey.currentState as FormState).validate()) {
      var login = _unameController.text;
      var pwd = _pwdController.text;
      showLoading(context, "登录中...");
      UserInfo userInfo;
      try {
        userInfo = await GitNet(context).login(login, pwd);
        Provider.of<UserModel>(context, listen: false).user = userInfo;
      } catch (e) {
        print(e);
        if (e.response?.statusCode == 401) {
          showToast("账户名或密码错误");
        } else {
          showToast(e.toString());
        }
      } finally {
        // 隐藏loading框
        Navigator.of(context).pop();
      }
      if (userInfo != null) {
        Navigator.of(context).pop();
      }
    }
  }
}
