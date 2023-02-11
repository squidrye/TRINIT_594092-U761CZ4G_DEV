import 'Campaign.dart';

abstract class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

class NormalUser extends User {
  final List<String> categories;
  List<Campaign>? donatedTo = [];
  NormalUser({
    required this.categories,
    this.donatedTo,
    required String name,
    required String email,
  }) : super(name: name, email: email);

  NormalUser fromMap(Map<String, dynamic> json) {
    return NormalUser(
      name: json["name"],
      email: json["email"],
      donatedTo: json["donatedTo"],
      categories: json["categories"],
    );
  }

  Map<String, dynamic> toMap(NormalUser user) {
    return {"name": user.name, "email": user.email, "donatedTo": user.donatedTo, "categories": user.categories};
  }
}

class NGO extends User {
  final String cause;
  final String vision;
  final String impact;
  List<Campaign>? startedCampaign = [];
  NGO({
    required this.cause,
    required this.vision,
    required this.impact,
    required String name,
    required String email,
  }) : super(name: name, email: email);

  NGO fromMap(Map<String, dynamic> json) {
    return NGO(
      name: json["name"],
      email: json["email"],
      cause: json["donatedTo"],
      impact: json["categories"],
      vision: json["categories"]
    );
  }

  Map<String, dynamic> toMap(NormalUser user) {
    return {"name": user.name, "email": user.email, "donatedTo": user.donatedTo, "categories": user.categories};
  }
}
