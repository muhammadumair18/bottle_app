class posts{
  String videoUrl,userID,description,thumbnail,documentName;
  int uploadTime;
  List likes;
  double latitude,longitude;

//<editor-fold desc="Data Methods">

  posts({
    required this.videoUrl,
    required this.userID,
    required this.description,
    required this.thumbnail,
    required this.documentName,
    required this.uploadTime,
    required this.likes,
    required this.latitude,
    required this.longitude,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is posts &&
          runtimeType == other.runtimeType &&
          videoUrl == other.videoUrl &&
          userID == other.userID &&
          description == other.description &&
          thumbnail == other.thumbnail &&
          documentName == other.documentName &&
          uploadTime == other.uploadTime &&
          likes == other.likes &&
          latitude == other.latitude &&
          longitude == other.longitude);

  @override
  int get hashCode =>
      videoUrl.hashCode ^
      userID.hashCode ^
      description.hashCode ^
      thumbnail.hashCode ^
      documentName.hashCode ^
      uploadTime.hashCode ^
      likes.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;

  @override
  String toString() {
    return 'posts{' +
        ' videoUrl: $videoUrl,' +
        ' userID: $userID,' +
        ' description: $description,' +
        ' thumbnail: $thumbnail,' +
        ' documentName: $documentName,' +
        ' uploadTime: $uploadTime,' +
        ' likes: $likes,' +
        ' latitude: $latitude,' +
        ' longitude: $longitude,' +
        '}';
  }

  posts copyWith({
    String? videoUrl,
    String? userID,
    String? description,
    String? thumbnail,
    String? documentName,
    int? uploadTime,
    List? likes,
    double? latitude,
    double? longitude,
  }) {
    return posts(
      videoUrl: videoUrl ?? this.videoUrl,
      userID: userID ?? this.userID,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      documentName: documentName ?? this.documentName,
      uploadTime: uploadTime ?? this.uploadTime,
      likes: likes ?? this.likes,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'videoUrl': this.videoUrl,
      'userID': this.userID,
      'description': this.description,
      'thumbnail': this.thumbnail,
      'documentName': this.documentName,
      'uploadTime': this.uploadTime,
      'likes': this.likes,
      'latitude': this.latitude,
      'longitude': this.longitude,
    };
  }

  factory posts.fromMap(Map<String, dynamic> map) {
    return posts(
      videoUrl: map['videoUrl'] as String,
      userID: map['userID'] as String,
      description: map['description'] as String,
      thumbnail: map['thumbnail'] as String,
      documentName: map['documentName'] as String,
      uploadTime: map['uploadTime'] as int,
      likes: map['likes'] as List,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

//</editor-fold>
}