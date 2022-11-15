class SubAdmins{
  String fullName,emal,password,profileImg,createdbyAdmin;
  bool shareStory,seeUsers,sendNotification,bockUser,deleteUserPost;
  int timeCreated;

//<editor-fold desc="Data Methods">

  SubAdmins({
    required this.fullName,
    required this.emal,
    required this.password,
    required this.profileImg,
    required this.createdbyAdmin,
    required this.shareStory,
    required this.seeUsers,
    required this.sendNotification,
    required this.bockUser,
    required this.deleteUserPost,
    required this.timeCreated,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubAdmins &&
          runtimeType == other.runtimeType &&
          fullName == other.fullName &&
          emal == other.emal &&
          password == other.password &&
          profileImg == other.profileImg &&
          createdbyAdmin == other.createdbyAdmin &&
          shareStory == other.shareStory &&
          seeUsers == other.seeUsers &&
          sendNotification == other.sendNotification &&
          bockUser == other.bockUser &&
          deleteUserPost == other.deleteUserPost &&
          timeCreated == other.timeCreated);

  @override
  int get hashCode =>
      fullName.hashCode ^
      emal.hashCode ^
      password.hashCode ^
      profileImg.hashCode ^
      createdbyAdmin.hashCode ^
      shareStory.hashCode ^
      seeUsers.hashCode ^
      sendNotification.hashCode ^
      bockUser.hashCode ^
      deleteUserPost.hashCode ^
      timeCreated.hashCode;

  @override
  String toString() {
    return 'SubAdmins{' +
        ' fullName: $fullName,' +
        ' emal: $emal,' +
        ' password: $password,' +
        ' profileImg: $profileImg,' +
        ' createdbyAdmin: $createdbyAdmin,' +
        ' shareStory: $shareStory,' +
        ' seeUsers: $seeUsers,' +
        ' sendNotification: $sendNotification,' +
        ' bockUser: $bockUser,' +
        ' deleteUserPost: $deleteUserPost,' +
        ' timeCreated: $timeCreated,' +
        '}';
  }

  SubAdmins copyWith({
    String? fullName,
    String? emal,
    String? password,
    String? profileImg,
    String? createdbyAdmin,
    bool? shareStory,
    bool? seeUsers,
    bool? sendNotification,
    bool? bockUser,
    bool? deleteUserPost,
    int? timeCreated,
  }) {
    return SubAdmins(
      fullName: fullName ?? this.fullName,
      emal: emal ?? this.emal,
      password: password ?? this.password,
      profileImg: profileImg ?? this.profileImg,
      createdbyAdmin: createdbyAdmin ?? this.createdbyAdmin,
      shareStory: shareStory ?? this.shareStory,
      seeUsers: seeUsers ?? this.seeUsers,
      sendNotification: sendNotification ?? this.sendNotification,
      bockUser: bockUser ?? this.bockUser,
      deleteUserPost: deleteUserPost ?? this.deleteUserPost,
      timeCreated: timeCreated ?? this.timeCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': this.fullName,
      'emal': this.emal,
      'password': this.password,
      'profileImg': this.profileImg,
      'createdbyAdmin': this.createdbyAdmin,
      'shareStory': this.shareStory,
      'seeUsers': this.seeUsers,
      'sendNotification': this.sendNotification,
      'bockUser': this.bockUser,
      'deleteUserPost': this.deleteUserPost,
      'timeCreated': this.timeCreated,
    };
  }

  factory SubAdmins.fromMap(Map<String, dynamic> map) {
    return SubAdmins(
      fullName: map['fullName'] as String,
      emal: map['emal'] as String,
      password: map['password'] as String,
      profileImg: map['profileImg'] as String,
      createdbyAdmin: map['createdbyAdmin'] as String,
      shareStory: map['shareStory'] as bool,
      seeUsers: map['seeUsers'] as bool,
      sendNotification: map['sendNotification'] as bool,
      bockUser: map['bockUser'] as bool,
      deleteUserPost: map['deleteUserPost'] as bool,
      timeCreated: map['timeCreated'] as int,
    );
  }

//</editor-fold>
}