class Features {
  String? title;
  String? img;
  String? link;

  Features({
    this.title,
    this.img,
    this.link,
  });

  Features.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    img = json['img'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['img'] = this.img;
    data['link'] = this.link;
    return data;
  }
}
