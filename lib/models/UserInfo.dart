
class UserInfo {
  String avatar_url;
  String bio;
  String blog;
  String company;
  String created_at;
  String email;
  int followers;
  int following;
  bool hireable;
  String location;
  String login;
  String name;
  int owned_private_repos;
  int public_repos;
  int total_private_repos;
  String type;
  String updated_at;

  UserInfo(
      {this.avatar_url, this.bio, this.blog, this.company, this.created_at, this.email, this.followers, this.following, this.hireable, this.location, this.login, this.name, this.owned_private_repos, this.public_repos, this.total_private_repos, this.type, this.updated_at});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      avatar_url: json['avatar_url'],
      bio: json['bio'],
      blog: json['blog'],
      company: json['company'],
      created_at: json['created_at'],
      email: json['email'],
      followers: json['followers'],
      following: json['following'],
      hireable: json['hireable'],
      location: json['location'],
      login: json['login'],
      name: json['name'],
      owned_private_repos: json['owned_private_repos'],
      public_repos: json['public_repos'],
      total_private_repos: json['total_private_repos'],
      type: json['type'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this.avatar_url;
    data['bio'] = this.bio;
    data['blog'] = this.blog;
    data['company'] = this.company;
    data['created_at'] = this.created_at;
    data['email'] = this.email;
    data['followers'] = this.followers;
    data['following'] = this.following;
    data['hireable'] = this.hireable;
    data['location'] = this.location;
    data['login'] = this.login;
    data['name'] = this.name;
    data['owned_private_repos'] = this.owned_private_repos;
    data['public_repos'] = this.public_repos;
    data['total_private_repos'] = this.total_private_repos;
    data['type'] = this.type;
    data['updated_at'] = this.updated_at;
    return data;
  }
}