import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  int? userId;
  String? username;
  String? email;
  String? profilePic;
  String? bio;
  String? homepage;
  List<String>? hobbies;
  String? fullName;
  String? location;
  DateTime? birthDate;
  int? followersCount;
  int? followingCount;
  int? postsCount;
  DateTime? joinedDate;
  bool? verifiedStatus;
  List<String>? languages;
  String? education;
  String? work;
  String? relationshipStatus;
  String? gender;
  String? pronouns;
  List<String>? interests;
  String? coverPhoto;
  PrivacySettings? privacySettings;
  DateTime? lastActive;
  String? statusMessage;
  ContactInfo? contactInfo;
  List<CustomField>? customFields;

  ProfileResponse({
    this.userId,
    this.username,
    this.email,
    this.profilePic,
    this.bio,
    this.homepage,
    this.hobbies,
    this.fullName,
    this.location,
    this.birthDate,
    this.followersCount,
    this.followingCount,
    this.postsCount,
    this.joinedDate,
    this.verifiedStatus,
    this.languages,
    this.education,
    this.work,
    this.relationshipStatus,
    this.gender,
    this.pronouns,
    this.interests,
    this.coverPhoto,
    this.privacySettings,
    this.lastActive,
    this.statusMessage,
    this.contactInfo,
    this.customFields,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        userId: json["userId"],
        username: json["username"],
        email: json["email"],
        profilePic: json["profilePic"],
        bio: json["bio"],
        homepage: json["homepage"],
        hobbies: json["hobbies"] == null
            ? []
            : List<String>.from(json["hobbies"]!.map((x) => x)),
        fullName: json["fullName"],
        location: json["location"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        followersCount: json["followersCount"],
        followingCount: json["followingCount"],
        postsCount: json["postsCount"],
        joinedDate: json["joinedDate"] == null
            ? null
            : DateTime.parse(json["joinedDate"]),
        verifiedStatus: json["verifiedStatus"],
        languages: json["languages"] == null
            ? []
            : List<String>.from(json["languages"]!.map((x) => x)),
        education: json["education"],
        work: json["work"],
        relationshipStatus: json["relationshipStatus"],
        gender: json["gender"],
        pronouns: json["pronouns"],
        interests: json["interests"] == null
            ? []
            : List<String>.from(json["interests"]!.map((x) => x)),
        coverPhoto: json["coverPhoto"],
        privacySettings: json["privacySettings"] == null
            ? null
            : PrivacySettings.fromJson(json["privacySettings"]),
        lastActive: json["lastActive"] == null
            ? null
            : DateTime.parse(json["lastActive"]),
        statusMessage: json["statusMessage"],
        contactInfo: json["contactInfo"] == null
            ? null
            : ContactInfo.fromJson(json["contactInfo"]),
        customFields: json["customFields"] == null
            ? []
            : List<CustomField>.from(
                json["customFields"]!.map((x) => CustomField.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "email": email,
        "profilePic": profilePic,
        "bio": bio,
        "homepage": homepage,
        "hobbies":
            hobbies == null ? [] : List<dynamic>.from(hobbies!.map((x) => x)),
        "fullName": fullName,
        "location": location,
        "birthDate":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "followersCount": followersCount,
        "followingCount": followingCount,
        "postsCount": postsCount,
        "joinedDate":
            "${joinedDate!.year.toString().padLeft(4, '0')}-${joinedDate!.month.toString().padLeft(2, '0')}-${joinedDate!.day.toString().padLeft(2, '0')}",
        "verifiedStatus": verifiedStatus,
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x)),
        "education": education,
        "work": work,
        "relationshipStatus": relationshipStatus,
        "gender": gender,
        "pronouns": pronouns,
        "interests": interests == null
            ? []
            : List<dynamic>.from(interests!.map((x) => x)),
        "coverPhoto": coverPhoto,
        "privacySettings": privacySettings?.toJson(),
        "lastActive":
            "${lastActive!.year.toString().padLeft(4, '0')}-${lastActive!.month.toString().padLeft(2, '0')}-${lastActive!.day.toString().padLeft(2, '0')}",
        "statusMessage": statusMessage,
        "contactInfo": contactInfo?.toJson(),
        "customFields": customFields == null
            ? []
            : List<dynamic>.from(customFields!.map((x) => x.toJson())),
      };
}

class ContactInfo {
  String? phone;
  String? secondaryEmail;

  ContactInfo({
    this.phone,
    this.secondaryEmail,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
        phone: json["phone"],
        secondaryEmail: json["secondaryEmail"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "secondaryEmail": secondaryEmail,
      };
}

class CustomField {
  String? fieldName;
  String? fieldValue;

  CustomField({
    this.fieldName,
    this.fieldValue,
  });

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        fieldName: json["fieldName"],
        fieldValue: json["fieldValue"],
      );

  Map<String, dynamic> toJson() => {
        "fieldName": fieldName,
        "fieldValue": fieldValue,
      };
}

class PrivacySettings {
  bool? showEmail;
  bool? showBirthDate;

  PrivacySettings({
    this.showEmail,
    this.showBirthDate,
  });

  factory PrivacySettings.fromJson(Map<String, dynamic> json) =>
      PrivacySettings(
        showEmail: json["showEmail"],
        showBirthDate: json["showBirthDate"],
      );

  Map<String, dynamic> toJson() => {
        "showEmail": showEmail,
        "showBirthDate": showBirthDate,
      };
}
