// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddStudentModel {
  String? parentName;
  String? uid;
  String? studentName;
  String? gender;
  String? admissionNumber;
  String? studentemail;
  String? parentPhoneNumber;
  String? classID;
  String? houseName;
  String? place;
  String? district;
  String? alPhoneNumber;
  String? profileImageId;
  String? profileImageUrl;
  String? createDate;
  String? bloodgroup;
  String? dateofBirth;
  String? docid;
  String? parentID;
  String? guardianID;
  String? userRole;
  AddStudentModel({
    this.parentName,
    this.uid,
    this.studentName,
    this.gender,
    this.admissionNumber,
    this.studentemail,
    this.parentPhoneNumber,
    this.classID,
    this.houseName,
    this.place,
    this.district,
    this.alPhoneNumber,
    this.profileImageId,
    this.profileImageUrl,
    this.createDate,
    this.bloodgroup,
    this.dateofBirth,
    this.docid,
    this.parentID,
    this.guardianID,
    this.userRole='student',
  });

  AddStudentModel copyWith({
    String? parentName,
    String? uid,
    String? studentName,
    String? gender,
    String? admissionNumber,
    String? studentemail,
    String? parentPhoneNumber,
    String? classID,
    String? houseName,
    String? place,
    String? district,
    String? alPhoneNumber,
    String? profileImageId,
    String? profileImageUrl,
    String? createDate,
    String? bloodgroup,
    String? dateofBirth,
    String? docid,
    String? parentID,
    String? guardianID,
    String? userRole,
  }) {
    return AddStudentModel(
      parentName: parentName ?? this.parentName,
      uid: uid ?? this.uid,
      studentName: studentName ?? this.studentName,
      gender: gender ?? this.gender,
      admissionNumber: admissionNumber ?? this.admissionNumber,
      studentemail: studentemail ?? this.studentemail,
      parentPhoneNumber: parentPhoneNumber ?? this.parentPhoneNumber,
      classID: classID ?? this.classID,
      houseName: houseName ?? this.houseName,
      place: place ?? this.place,
      district: district ?? this.district,
      alPhoneNumber: alPhoneNumber ?? this.alPhoneNumber,
      profileImageId: profileImageId ?? this.profileImageId,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createDate: createDate ?? this.createDate,
      bloodgroup: bloodgroup ?? this.bloodgroup,
      dateofBirth: dateofBirth ?? this.dateofBirth,
      docid: docid ?? this.docid,
      parentID: parentID ?? this.parentID,
      guardianID: guardianID ?? this.guardianID,
      userRole: userRole ?? this.userRole,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'parentName': parentName??'',
      'uid': uid??'',
      'studentName': studentName??'',
      'gender': gender??'',
      'admissionNumber': admissionNumber??'',
      'studentemail': studentemail??'',
      'parentPhoneNumber': parentPhoneNumber??'',
      'classID': classID??'',
      'houseName': houseName??'',
      'place': place??'',
      'district': district??'',
      'alPhoneNumber': alPhoneNumber??'',
      'profileImageId': profileImageId??'',
      'profileImageUrl': profileImageUrl??'',
      'createDate': createDate??'',
      'bloodgroup': bloodgroup??'',
      'dateofBirth': dateofBirth??'',
      'docid': docid??'',
      'parentID': parentID??'',
      'guardianID': guardianID??'',
      'userRole': userRole??'',
    };
  }

  factory AddStudentModel.fromMap(Map<String, dynamic> map) {
    return AddStudentModel(
      parentName: map['parentName'] != null ? map['parentName'] as String : '',
      uid: map['uid'] != null ? map['uid'] as String : '',
      studentName: map['studentName'] != null ? map['studentName'] as String : '',
      gender: map['gender'] != null ? map['gender'] as String : '',
      admissionNumber: map['admissionNumber'] != null ? map['admissionNumber'] as String : '',
      studentemail: map['studentemail'] != null ? map['studentemail'] as String : '',
      parentPhoneNumber: map['parentPhoneNumber'] != null ? map['parentPhoneNumber'] as String : '',
      classID: map['classID'] != null ? map['classID'] as String : '',
      houseName: map['houseName'] != null ? map['houseName'] as String : '',
      place: map['place'] != null ? map['place'] as String : '',
      district: map['district'] != null ? map['district'] as String : '',
      alPhoneNumber: map['alPhoneNumber'] != null ? map['alPhoneNumber'] as String : '',
      profileImageId: map['profileImageId'] != null ? map['profileImageId'] as String : '',
      profileImageUrl: map['profileImageUrl'] != null ? map['profileImageUrl'] as String : '',
      createDate: map['createDate'] != null ? map['createDate'] as String : '',
      bloodgroup: map['bloodgroup'] != null ? map['bloodgroup'] as String : '',
      dateofBirth: map['dateofBirth'] != null ? map['dateofBirth'] as String : '',
      docid: map['docid'] != null ? map['docid'] as String : '',
      parentID: map['parentID'] != null ? map['parentID'] as String : '',
      guardianID: map['guardianID'] != null ? map['guardianID'] as String : '',
      userRole: map['userRole'] != null ? map['userRole'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddStudentModel.fromJson(String source) =>
      AddStudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddStudentModel(parentName: $parentName, uid: $uid, studentName: $studentName, gender: $gender, admissionNumber: $admissionNumber, studentemail: $studentemail, parentPhoneNumber: $parentPhoneNumber, classID: $classID, houseName: $houseName, place: $place, district: $district, alPhoneNumber: $alPhoneNumber, profileImageId: $profileImageId, profileImageUrl: $profileImageUrl, createDate: $createDate, bloodgroup: $bloodgroup, dateofBirth: $dateofBirth, docid: $docid, parentID: $parentID, guardianID: $guardianID, userRole: $userRole)';
  }

  @override
  bool operator ==(covariant AddStudentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.parentName == parentName &&
      other.uid == uid &&
      other.studentName == studentName &&
      other.gender == gender &&
      other.admissionNumber == admissionNumber &&
      other.studentemail == studentemail &&
      other.parentPhoneNumber == parentPhoneNumber &&
      other.classID == classID &&
      other.houseName == houseName &&
      other.place == place &&
      other.district == district &&
      other.alPhoneNumber == alPhoneNumber &&
      other.profileImageId == profileImageId &&
      other.profileImageUrl == profileImageUrl &&
      other.createDate == createDate &&
      other.bloodgroup == bloodgroup &&
      other.dateofBirth == dateofBirth &&
      other.docid == docid &&
      other.parentID == parentID &&
      other.guardianID == guardianID &&
      other.userRole == userRole;
  }

  @override
  int get hashCode {
    return parentName.hashCode ^
      uid.hashCode ^
      studentName.hashCode ^
      gender.hashCode ^
      admissionNumber.hashCode ^
      studentemail.hashCode ^
      parentPhoneNumber.hashCode ^
      classID.hashCode ^
      houseName.hashCode ^
      place.hashCode ^
      district.hashCode ^
      alPhoneNumber.hashCode ^
      profileImageId.hashCode ^
      profileImageUrl.hashCode ^
      createDate.hashCode ^
      bloodgroup.hashCode ^
      dateofBirth.hashCode ^
      docid.hashCode ^
      parentID.hashCode ^
      guardianID.hashCode ^
      userRole.hashCode;
  }
}
