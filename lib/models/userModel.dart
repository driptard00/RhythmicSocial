// To parse this JSON data, do
//
//     final user = userfromMap(jsonString);

import 'dart:convert';

User userfromMap(String str) => User.fromMap(json.decode(str));

String usertoMap(User data) => json.encode(data.toMap());

class User {
    User({
     this.id,
     this.fullName,
     this.email,
     this.dob,
     this.gender,
     this.phoneNumber,
     this.isActive,
     this.followers,
     this.following,
     this.posts,
     this.createdAt,
     this.updatedAt,
     this.v,
     this.avatar,
     this.bio,
     this.musicGenre,
     this.purpose,
     this.userType,
     this.username,
    });

    String? id;
    String? fullName;
    String? email;
    DateTime? dob;
    String? gender;
    int? phoneNumber;
    bool? isActive;
    List<dynamic>? followers;
    List<dynamic>? following;
    int? posts;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? avatar;
    String? bio;
    String? musicGenre;
    String? purpose;
    String? userType;
    String? username;

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        fullName: json["full_name"],
        email: json["email"],
        dob: DateTime.parse(json["dob"]),
        gender: json["Gender"],
        phoneNumber: json["phone_number"],
        isActive: json["isActive"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        posts: json["posts"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        avatar: json["avatar"],
        bio: json["bio"],
        musicGenre: json["music_genre"],
        purpose: json["purpose"],
        userType: json["user_type"],
        username: json["username"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "full_name": fullName,
        "email": email,
        "dob": dob!.toIso8601String(),
        "Gender": gender,
        "phone_number": phoneNumber,
        "isActive": isActive,
        "followers": List<dynamic>.from(followers!.map((x) => x)),
        "following": List<dynamic>.from(following!.map((x) => x)),
        "posts": posts,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "avatar": avatar,
        "bio": bio,
        "music_genre": musicGenre,
        "purpose": purpose,
        "user_type": userType,
        "username": username,
    };
}
