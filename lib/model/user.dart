class User{
  String id,countrycode,phoneNumber,Name;
  int DateofBirth,profilePicNo;
  bool isblocked;

//<editor-fold desc="Data Methods">

  User({
    required this.id,
    required this.countrycode,
    required this.phoneNumber,
    required this.Name,
    required this.DateofBirth,
    required this.profilePicNo,
    required this.isblocked,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          countrycode == other.countrycode &&
          phoneNumber == other.phoneNumber &&
          Name == other.Name &&
          DateofBirth == other.DateofBirth &&
          profilePicNo == other.profilePicNo &&
          isblocked == other.isblocked);

  @override
  int get hashCode =>
      id.hashCode ^
      countrycode.hashCode ^
      phoneNumber.hashCode ^
      Name.hashCode ^
      DateofBirth.hashCode ^
      profilePicNo.hashCode ^
      isblocked.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' id: $id,' +
        ' countrycode: $countrycode,' +
        ' phoneNumber: $phoneNumber,' +
        ' Name: $Name,' +
        ' DateofBirth: $DateofBirth,' +
        ' profilePicNo: $profilePicNo,' +
        ' isblocked: $isblocked,' +
        '}';
  }

  User copyWith({
    String? id,
    String? countrycode,
    String? phoneNumber,
    String? Name,
    int? DateofBirth,
    int? profilePicNo,
    bool? isblocked,
  }) {
    return User(
      id: id ?? this.id,
      countrycode: countrycode ?? this.countrycode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      Name: Name ?? this.Name,
      DateofBirth: DateofBirth ?? this.DateofBirth,
      profilePicNo: profilePicNo ?? this.profilePicNo,
      isblocked: isblocked ?? this.isblocked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'countrycode': this.countrycode,
      'phoneNumber': this.phoneNumber,
      'Name': this.Name,
      'DateofBirth': this.DateofBirth,
      'profilePicNo': this.profilePicNo,
      'isblocked': this.isblocked,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      countrycode: map['countrycode'] as String,
      phoneNumber: map['phoneNumber'] as String,
      Name: map['Name'] as String,
      DateofBirth: map['DateofBirth'] as int,
      profilePicNo: map['profilePicNo'] as int,
      isblocked: map['isblocked'] as bool,
    );
  }

//</editor-fold>
}