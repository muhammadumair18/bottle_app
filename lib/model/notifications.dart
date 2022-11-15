class notification{
  String title,descritionn,imageUrl,uploadAdminId,docName;
  int uploadTime;

//<editor-fold desc="Data Methods">

  notification({
    required this.title,
    required this.descritionn,
    required this.imageUrl,
    required this.uploadAdminId,
    required this.docName,
    required this.uploadTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is notification &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          descritionn == other.descritionn &&
          imageUrl == other.imageUrl &&
          uploadAdminId == other.uploadAdminId &&
          docName == other.docName &&
          uploadTime == other.uploadTime);

  @override
  int get hashCode =>
      title.hashCode ^
      descritionn.hashCode ^
      imageUrl.hashCode ^
      uploadAdminId.hashCode ^
      docName.hashCode ^
      uploadTime.hashCode;

  @override
  String toString() {
    return 'notification{' +
        ' title: $title,' +
        ' descritionn: $descritionn,' +
        ' imageUrl: $imageUrl,' +
        ' uploadAdminId: $uploadAdminId,' +
        ' docName: $docName,' +
        ' uploadTime: $uploadTime,' +
        '}';
  }

  notification copyWith({
    String? title,
    String? descritionn,
    String? imageUrl,
    String? uploadAdminId,
    String? docName,
    int? uploadTime,
  }) {
    return notification(
      title: title ?? this.title,
      descritionn: descritionn ?? this.descritionn,
      imageUrl: imageUrl ?? this.imageUrl,
      uploadAdminId: uploadAdminId ?? this.uploadAdminId,
      docName: docName ?? this.docName,
      uploadTime: uploadTime ?? this.uploadTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'descritionn': this.descritionn,
      'imageUrl': this.imageUrl,
      'uploadAdminId': this.uploadAdminId,
      'docName': this.docName,
      'uploadTime': this.uploadTime,
    };
  }

  factory notification.fromMap(Map<String, dynamic> map) {
    return notification(
      title: map['title'] as String,
      descritionn: map['descritionn'] as String,
      imageUrl: map['imageUrl'] as String,
      uploadAdminId: map['uploadAdminId'] as String,
      docName: map['docName'] as String,
      uploadTime: map['uploadTime'] as int,
    );
  }

//</editor-fold>
}