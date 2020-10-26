import 'package:flutter_demo/models/UserInfo.dart';

/// id : 1296269
/// name : "Hello-World"
/// full_name : "octocat/Hello-World"
/// owner : "$user"
/// parent : "$repo"
/// private : false
/// description : "This your first repo!"
/// fork : false
/// language : "JavaScript"
/// forks_count : 9
/// stargazers_count : 80
/// size : 108
/// default_branch : "master"
/// open_issues_count : 2
/// pushed_at : "2011-01-26T19:06:43Z"
/// created_at : "2011-01-26T19:01:12Z"
/// updated_at : "2011-01-26T19:14:43Z"
/// subscribers_count : 42
/// license : {"key":"mit","name":"MIT License","spdx_id":"MIT","url":"https://api.github.com/licenses/mit","node_id":"MDc6TGljZW5zZW1pdA=="}

class Repo {
  int _id;
  String _name;
  String _fullName;
  String _html_url;
  UserInfo _owner;
  bool _private;
  String _description;
  bool _fork;
  String _language;
  int _forksCount;
  int _stargazersCount;
  int _size;
  String _defaultBranch;
  int _openIssuesCount;
  String _pushedAt;
  String _createdAt;
  String _updatedAt;
  int _subscribersCount;
  License _license;

  int get id => _id;

  String get name => _name;

  String get fullName => _fullName;
  String get html_url => _html_url;

  UserInfo get owner => _owner;

  bool get private => _private;

  String get description => _description;

  bool get fork => _fork;

  String get language => _language;

  int get forksCount => _forksCount;

  int get stargazersCount => _stargazersCount;

  int get size => _size;

  String get defaultBranch => _defaultBranch;

  int get openIssuesCount => _openIssuesCount;

  String get pushedAt => _pushedAt;

  String get createdAt => _createdAt;

  String get updatedAt => _updatedAt;

  int get subscribersCount => _subscribersCount;

  License get license => _license;

  Repo(
      {int id,
      String name,
      String fullName,
      UserInfo owner,
      String parent,
      bool private,
      String description,
      bool fork,
      String language,
      int forksCount,
      int stargazersCount,
      int size,
      String defaultBranch,
      int openIssuesCount,
      String pushedAt,
      String createdAt,
      String updatedAt,
      int subscribersCount,
      License license}) {
    _id = id;
    _name = name;
    _fullName = fullName;
    _owner = owner;
    _private = private;
    _description = description;
    _fork = fork;
    _language = language;
    _forksCount = forksCount;
    _stargazersCount = stargazersCount;
    _size = size;
    _defaultBranch = defaultBranch;
    _openIssuesCount = openIssuesCount;
    _pushedAt = pushedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _subscribersCount = subscribersCount;
    _license = license;
  }

  Repo.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _fullName = json["fullName"];
    _html_url = json["html_url"];
    _owner = json["owner"]!= null ? UserInfo.fromJson(json["owner"]) : null;
    _private = json["private"];
    _description = json["description"];
    _fork = json["fork"];
    _language = json["language"];
    _forksCount = json["forks_count"];
    _stargazersCount = json["stargazers_count"];
    _size = json["size"];
    _defaultBranch = json["defaultBranch"];
    _openIssuesCount = json["open_issues_count"];
    _pushedAt = json["pushed_at"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _subscribersCount = json["subscribers_count"];
    _license =
        json["license"] != null ? License.fromJson(json["license"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["fullName"] = _fullName;
    map["html_url"] = _html_url;
    if (_owner != null) {
      map["owner"]  = _owner.toJson();
    }
    map["private"] = _private;
    map["description"] = _description;
    map["fork"] = _fork;
    map["language"] = _language;
    map["forks_count"] = _forksCount;
    map["stargazers_count"] = _stargazersCount;
    map["size"] = _size;
    map["defaultBranch"] = _defaultBranch;
    map["open_issues_count"] = _openIssuesCount;
    map["pushed_at"] = _pushedAt;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["subscribers_count"] = _subscribersCount;
    if (_license != null) {
      map["license"] = _license.toJson();
    }
    return map;
  }
}

/// key : "mit"
/// name : "MIT License"
/// spdx_id : "MIT"
/// url : "https://api.github.com/licenses/mit"
/// node_id : "MDc6TGljZW5zZW1pdA=="

class License {
  String _key;
  String _name;
  String _spdxId;
  String _url;
  String _nodeId;

  String get key => _key;

  String get name => _name;

  String get spdxId => _spdxId;

  String get url => _url;

  String get nodeId => _nodeId;

  License({String key, String name, String spdxId, String url, String nodeId}) {
    _key = key;
    _name = name;
    _spdxId = spdxId;
    _url = url;
    _nodeId = nodeId;
  }

  License.fromJson(dynamic json) {
    _key = json["key"];
    _name = json["name"];
    _spdxId = json["spdxId"];
    _url = json["url"];
    _nodeId = json["nodeId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["key"] = _key;
    map["name"] = _name;
    map["spdxId"] = _spdxId;
    map["url"] = _url;
    map["nodeId"] = _nodeId;
    return map;
  }
}
