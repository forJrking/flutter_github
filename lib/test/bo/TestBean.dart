
class TestBean {
    String body;
    int id;
    String title;
    int userId;

    TestBean({this.body, this.id, this.title, this.userId});

    factory TestBean.fromJson(Map<String, dynamic> json) {
        return TestBean(
            body: json['body'], 
            id: json['id'], 
            title: json['title'], 
            userId: json['userId'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['body'] = this.body;
        data['id'] = this.id;
        data['title'] = this.title;
        data['userId'] = this.userId;
        return data;
    }
}