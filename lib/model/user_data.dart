class UserData {
  String? id;
  String? name;
  String? email;
  String? senha;
  String? avatarUrl;
  String? cpf;

  UserData({this.id, this.name, this.email, this.senha, this.avatarUrl, this.cpf});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    senha = json['senha'];
    avatarUrl = json['avatarUrl'];
    cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['senha'] = senha;
    data['avatarUrl'] = avatarUrl;
    data['cpf'] = cpf;
    return data;
  }


  @override
  String toString() {
    return "name: $name\nEmail: $email, \nAvatarUrl: $avatarUrl, \nSenha: $senha, \nCPF: $cpf" ;
  }
}