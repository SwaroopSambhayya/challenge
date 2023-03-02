import 'dart:convert';

Coach coachFromJson(String str) {
  final jsonData = json.decode(str);
  return Coach.fromJson(jsonData);
}

String coachToJson(Coach data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Coach {
  String imageUrl;
  String name;
  String occupation;
  int challenge;

  Coach({
    required this.imageUrl,
    required this.name,
    required this.occupation,
    required this.challenge,
  });

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        imageUrl: json["imageUrl"],
        name: json["name"],
        occupation: json["occupation"],
        challenge: json["challenge"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "name": name,
        "occupation": occupation,
        "challenge": challenge,
      };
}
