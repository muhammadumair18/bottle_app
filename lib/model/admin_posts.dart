class AdminPosts{
  int uploadTime;
  String description,adminID,state,city,documentName,thumbnail,videoUrl;

//<editor-fold desc="Data Methods">

  AdminPosts({
    required this.uploadTime,
    required this.description,
    required this.adminID,
    required this.state,
    required this.city,
    required this.documentName,
    required this.thumbnail,
    required this.videoUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdminPosts &&
          runtimeType == other.runtimeType &&
          uploadTime == other.uploadTime &&
          description == other.description &&
          adminID == other.adminID &&
          state == other.state &&
          city == other.city &&
          documentName == other.documentName &&
          thumbnail == other.thumbnail &&
          videoUrl == other.videoUrl);

  @override
  int get hashCode =>
      uploadTime.hashCode ^
      description.hashCode ^
      adminID.hashCode ^
      state.hashCode ^
      city.hashCode ^
      documentName.hashCode ^
      thumbnail.hashCode ^
      videoUrl.hashCode;

  @override
  String toString() {
    return 'AdminPosts{' +
        ' uploadTime: $uploadTime,' +
        ' description: $description,' +
        ' adminID: $adminID,' +
        ' state: $state,' +
        ' city: $city,' +
        ' documentName: $documentName,' +
        ' thumbnail: $thumbnail,' +
        ' videoUrl: $videoUrl,' +
        '}';
  }

  AdminPosts copyWith({
    int? uploadTime,
    String? description,
    String? adminID,
    String? state,
    String? city,
    String? documentName,
    String? thumbnail,
    String? videoUrl,
  }) {
    return AdminPosts(
      uploadTime: uploadTime ?? this.uploadTime,
      description: description ?? this.description,
      adminID: adminID ?? this.adminID,
      state: state ?? this.state,
      city: city ?? this.city,
      documentName: documentName ?? this.documentName,
      thumbnail: thumbnail ?? this.thumbnail,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uploadTime': this.uploadTime,
      'description': this.description,
      'adminID': this.adminID,
      'state': this.state,
      'city': this.city,
      'documentName': this.documentName,
      'thumbnail': this.thumbnail,
      'videoUrl': this.videoUrl,
    };
  }

  factory AdminPosts.fromMap(Map<String, dynamic> map) {
    return AdminPosts(
      uploadTime: map['uploadTime'] as int,
      description: map['description'] as String,
      adminID: map['adminID'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      documentName: map['documentName'] as String,
      thumbnail: map['thumbnail'] as String,
      videoUrl: map['videoUrl'] as String,
    );
  }

//</editor-fold>
}