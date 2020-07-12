
class User {
  int id;
  String email;
  String password;
  String name ;
  String surname ;
  String birthdate ;
  String picture ;
  int points;
  int gender ;
  String adress ;
  String city ;
  int postcode ;
  String category ;
  String type ;

  User(
      {this.id,
      this.email,
      this.password,
      this.name,
      this.surname,
      this.birthdate,
      this.picture,
      this.points,
      this.gender,
      this.adress,
      this.city,
      this.postcode,
      this.category,
      this.type});

  factory User.fromJson(Map<String, dynamic> json) => new User(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        name: json["name"] == null ? null : json["name"],
        surname: json["surname"] == null ? null : json["surname"],
        birthdate: json["birthdate"] == null ? null : json["birthdate"],
        picture: json["picture"] == null ? null : json["picture"],
        points: json["points"] == null ? null : json["points"],
        gender: json["gender"] == null ? null : json["gender"],
        adress: json["adress"] == null ? null : json["adress"],
        city: json["city"] == null ? null : json["city"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        category: json["category"] == null ? null : json["category"],
        type: json["type"] == null ? null : json["type"],
      );


  Map<String, dynamic> toLogin() => {
        "email": email == null ? null : email,
        "password": password == null ? null : password,
      };
}