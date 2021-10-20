class Owner{
  String? login;
  int? id;
  String? avatarUrl;

  Owner({required this.login,required this.id,required this.avatarUrl});
  Owner.fromJson(Map<String, dynamic> json){
    login = json["login"] ?? "";
    id = json["id"] as int;
    avatarUrl = json["avatar_url"] ?? "";
  }
}