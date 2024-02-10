// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  Message? message;
  int? statusCode;

  UserInfo({
    this.message,
    this.statusCode,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    message: json["message"] == null ? null : Message.fromJson(json["message"]),
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "message": message?.toJson(),
    "statusCode": statusCode,
  };
}

class Message {
  String? id;
  String? name;
  String? email;
  String? phonenumber;
  List<dynamic>? isRequested;
  int? usertype;
  dynamic pan;
  Institute? institute;

  Message({
    this.id,
    this.name,
    this.email,
    this.phonenumber,
    this.isRequested,
    this.usertype,
    this.pan,
    this.institute,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phonenumber: json["phonenumber"],
    isRequested: json["isRequested"] == null ? [] : List<dynamic>.from(json["isRequested"]!.map((x) => x)),
    usertype: json["usertype"],
    pan: json["pan"],
    institute: json["institute"] == null ? null : Institute.fromJson(json["institute"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phonenumber": phonenumber,
    "isRequested": isRequested == null ? [] : List<dynamic>.from(isRequested!.map((x) => x)),
    "usertype": usertype,
    "pan": pan,
    "institute": institute?.toJson(),
  };
}

class Institute {
  String? id;
  String? name;
  String? email;
  DateTime? registeredon;
  String? description;
  List<String>? descriptionArray;
  String? shortDescription;
  String? establishedyear;
  String? phonenumber;
  dynamic alternatephonenumber;
  int? score;
  dynamic landline;
  List<Location>? locations;
  Coordinates? coordinates;
  String? areaTags;
  int? totalfaculties;
  String? workinghours;
  dynamic gst;
  Bank? bank;
  Services? services;
  int? classmode;
  List<dynamic>? coursecategories;
  List<dynamic>? studentSchools;
  List<String>? classes;
  String? accountplan;
  int? requestApproval;
  Documents? updatedRequest;
  dynamic updatedRequestTimestamp;
  List<dynamic>? requestCallback;
  Documents? documents;
  int? approval;
  bool? verified;
  int? verifiedNum;
  dynamic avgTuitionFee;
  dynamic metatitle;
  String? slug;
  dynamic slugurl;
  dynamic streams;
  dynamic metadesc;
  int? studentsenrolled;
  int? commission;
  int? freeleadcount;
  int? leadsviewed;
  int? credits;
  int? views;
  dynamic toppers;
  dynamic testimonials;
  List<dynamic>? avatar;
  List<AppThumbnail>? images;
  List<dynamic>? videos;
  List<String>? amenities;
  List<dynamic>? institutecategory;
  List<dynamic>? examNames;
  dynamic paymentForVerified;
  List<dynamic>? requestCourses;
  List<dynamic>? juniorSubjects;
  List<dynamic>? higherSubjects;
  List<dynamic>? seniorSubjects;
  AppThumbnail? appThumbnail;
  List<String>? favStudents;
  int? ostelloReviewCount;
  int? rating;
  String? ostelloAverageRating;
  int? googleReviewCount;
  int? googleAverageRating;
  Map<String, int>? googleReviewsPerScore;
  String? googlePhoto;
  String? googleStreetView;
  dynamic googlePlaceId;
  DateTime? googleReviewLastFetched;
  int? lowestfee;
  dynamic tagline;
  ProjectedPoint? projectedPoint;

  Institute({
    this.id,
    this.name,
    this.email,
    this.registeredon,
    this.description,
    this.descriptionArray,
    this.shortDescription,
    this.establishedyear,
    this.phonenumber,
    this.alternatephonenumber,
    this.score,
    this.landline,
    this.locations,
    this.coordinates,
    this.areaTags,
    this.totalfaculties,
    this.workinghours,
    this.gst,
    this.bank,
    this.services,
    this.classmode,
    this.coursecategories,
    this.studentSchools,
    this.classes,
    this.accountplan,
    this.requestApproval,
    this.updatedRequest,
    this.updatedRequestTimestamp,
    this.requestCallback,
    this.documents,
    this.approval,
    this.verified,
    this.verifiedNum,
    this.avgTuitionFee,
    this.metatitle,
    this.slug,
    this.slugurl,
    this.streams,
    this.metadesc,
    this.studentsenrolled,
    this.commission,
    this.freeleadcount,
    this.leadsviewed,
    this.credits,
    this.views,
    this.toppers,
    this.testimonials,
    this.avatar,
    this.images,
    this.videos,
    this.amenities,
    this.institutecategory,
    this.examNames,
    this.paymentForVerified,
    this.requestCourses,
    this.juniorSubjects,
    this.higherSubjects,
    this.seniorSubjects,
    this.appThumbnail,
    this.favStudents,
    this.ostelloReviewCount,
    this.rating,
    this.ostelloAverageRating,
    this.googleReviewCount,
    this.googleAverageRating,
    this.googleReviewsPerScore,
    this.googlePhoto,
    this.googleStreetView,
    this.googlePlaceId,
    this.googleReviewLastFetched,
    this.lowestfee,
    this.tagline,
    this.projectedPoint,
  });

  factory Institute.fromJson(Map<String, dynamic> json) => Institute(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    registeredon: json["registeredon"] == null ? null : DateTime.parse(json["registeredon"]),
    description: json["description"],
    descriptionArray: json["descriptionArray"] == null ? [] : List<String>.from(json["descriptionArray"]!.map((x) => x)),
    shortDescription: json["short_description"],
    establishedyear: json["establishedyear"],
    phonenumber: json["phonenumber"],
    alternatephonenumber: json["alternatephonenumber"],
    score: json["score"],
    landline: json["landline"],
    locations: json["locations"] == null ? [] : List<Location>.from(json["locations"]!.map((x) => Location.fromJson(x))),
    coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
    areaTags: json["area_tags"],
    totalfaculties: json["totalfaculties"],
    workinghours: json["workinghours"],
    gst: json["gst"],
    bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
    services: json["services"] == null ? null : Services.fromJson(json["services"]),
    classmode: json["classmode"],
    coursecategories: json["coursecategories"] == null ? [] : List<dynamic>.from(json["coursecategories"]!.map((x) => x)),
    studentSchools: json["studentSchools"] == null ? [] : List<dynamic>.from(json["studentSchools"]!.map((x) => x)),
    classes: json["classes"] == null ? [] : List<String>.from(json["classes"]!.map((x) => x)),
    accountplan: json["accountplan"],
    requestApproval: json["requestApproval"],
    updatedRequest: json["updatedRequest"] == null ? null : Documents.fromJson(json["updatedRequest"]),
    updatedRequestTimestamp: json["updatedRequestTimestamp"],
    requestCallback: json["requestCallback"] == null ? [] : List<dynamic>.from(json["requestCallback"]!.map((x) => x)),
    documents: json["documents"] == null ? null : Documents.fromJson(json["documents"]),
    approval: json["approval"],
    verified: json["verified"],
    verifiedNum: json["verifiedNum"],
    avgTuitionFee: json["avgTuitionFee"],
    metatitle: json["metatitle"],
    slug: json["slug"],
    slugurl: json["slugurl"],
    streams: json["streams"],
    metadesc: json["metadesc"],
    studentsenrolled: json["studentsenrolled"],
    commission: json["commission"],
    freeleadcount: json["freeleadcount"],
    leadsviewed: json["leadsviewed"],
    credits: json["credits"],
    views: json["views"],
    toppers: json["toppers"],
    testimonials: json["testimonials"],
    avatar: json["avatar"] == null ? [] : List<dynamic>.from(json["avatar"]!.map((x) => x)),
    images: json["images"] == null ? [] : List<AppThumbnail>.from(json["images"]!.map((x) => AppThumbnail.fromJson(x))),
    videos: json["videos"] == null ? [] : List<dynamic>.from(json["videos"]!.map((x) => x)),
    amenities: json["amenities"] == null ? [] : List<String>.from(json["amenities"]!.map((x) => x)),
    institutecategory: json["institutecategory"] == null ? [] : List<dynamic>.from(json["institutecategory"]!.map((x) => x)),
    examNames: json["examNames"] == null ? [] : List<dynamic>.from(json["examNames"]!.map((x) => x)),
    paymentForVerified: json["paymentForVerified"],
    requestCourses: json["requestCourses"] == null ? [] : List<dynamic>.from(json["requestCourses"]!.map((x) => x)),
    juniorSubjects: json["juniorSubjects"] == null ? [] : List<dynamic>.from(json["juniorSubjects"]!.map((x) => x)),
    higherSubjects: json["higherSubjects"] == null ? [] : List<dynamic>.from(json["higherSubjects"]!.map((x) => x)),
    seniorSubjects: json["seniorSubjects"] == null ? [] : List<dynamic>.from(json["seniorSubjects"]!.map((x) => x)),
    appThumbnail: json["app_thumbnail"] == null ? null : AppThumbnail.fromJson(json["app_thumbnail"]),
    favStudents: json["favStudents"] == null ? [] : List<String>.from(json["favStudents"]!.map((x) => x)),
    ostelloReviewCount: json["ostelloReviewCount"],
    rating: json["rating"],
    ostelloAverageRating: json["ostelloAverageRating"],
    googleReviewCount: json["googleReviewCount"],
    googleAverageRating: json["googleAverageRating"],
    googleReviewsPerScore: Map.from(json["googleReviewsPerScore"]!).map((k, v) => MapEntry<String, int>(k, v)),
    googlePhoto: json["googlePhoto"],
    googleStreetView: json["googleStreetView"],
    googlePlaceId: json["googlePlaceId"],
    googleReviewLastFetched: json["googleReviewLastFetched"] == null ? null : DateTime.parse(json["googleReviewLastFetched"]),
    lowestfee: json["lowestfee"],
    tagline: json["tagline"],
    projectedPoint: json["projectedPoint"] == null ? null : ProjectedPoint.fromJson(json["projectedPoint"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "registeredon": registeredon?.toIso8601String(),
    "description": description,
    "descriptionArray": descriptionArray == null ? [] : List<dynamic>.from(descriptionArray!.map((x) => x)),
    "short_description": shortDescription,
    "establishedyear": establishedyear,
    "phonenumber": phonenumber,
    "alternatephonenumber": alternatephonenumber,
    "score": score,
    "landline": landline,
    "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x.toJson())),
    "coordinates": coordinates?.toJson(),
    "area_tags": areaTags,
    "totalfaculties": totalfaculties,
    "workinghours": workinghours,
    "gst": gst,
    "bank": bank?.toJson(),
    "services": services?.toJson(),
    "classmode": classmode,
    "coursecategories": coursecategories == null ? [] : List<dynamic>.from(coursecategories!.map((x) => x)),
    "studentSchools": studentSchools == null ? [] : List<dynamic>.from(studentSchools!.map((x) => x)),
    "classes": classes == null ? [] : List<dynamic>.from(classes!.map((x) => x)),
    "accountplan": accountplan,
    "requestApproval": requestApproval,
    "updatedRequest": updatedRequest?.toJson(),
    "updatedRequestTimestamp": updatedRequestTimestamp,
    "requestCallback": requestCallback == null ? [] : List<dynamic>.from(requestCallback!.map((x) => x)),
    "documents": documents?.toJson(),
    "approval": approval,
    "verified": verified,
    "verifiedNum": verifiedNum,
    "avgTuitionFee": avgTuitionFee,
    "metatitle": metatitle,
    "slug": slug,
    "slugurl": slugurl,
    "streams": streams,
    "metadesc": metadesc,
    "studentsenrolled": studentsenrolled,
    "commission": commission,
    "freeleadcount": freeleadcount,
    "leadsviewed": leadsviewed,
    "credits": credits,
    "views": views,
    "toppers": toppers,
    "testimonials": testimonials,
    "avatar": avatar == null ? [] : List<dynamic>.from(avatar!.map((x) => x)),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
    "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x)),
    "institutecategory": institutecategory == null ? [] : List<dynamic>.from(institutecategory!.map((x) => x)),
    "examNames": examNames == null ? [] : List<dynamic>.from(examNames!.map((x) => x)),
    "paymentForVerified": paymentForVerified,
    "requestCourses": requestCourses == null ? [] : List<dynamic>.from(requestCourses!.map((x) => x)),
    "juniorSubjects": juniorSubjects == null ? [] : List<dynamic>.from(juniorSubjects!.map((x) => x)),
    "higherSubjects": higherSubjects == null ? [] : List<dynamic>.from(higherSubjects!.map((x) => x)),
    "seniorSubjects": seniorSubjects == null ? [] : List<dynamic>.from(seniorSubjects!.map((x) => x)),
    "app_thumbnail": appThumbnail?.toJson(),
    "favStudents": favStudents == null ? [] : List<dynamic>.from(favStudents!.map((x) => x)),
    "ostelloReviewCount": ostelloReviewCount,
    "rating": rating,
    "ostelloAverageRating": ostelloAverageRating,
    "googleReviewCount": googleReviewCount,
    "googleAverageRating": googleAverageRating,
    "googleReviewsPerScore": Map.from(googleReviewsPerScore!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "googlePhoto": googlePhoto,
    "googleStreetView": googleStreetView,
    "googlePlaceId": googlePlaceId,
    "googleReviewLastFetched": "${googleReviewLastFetched!.year.toString().padLeft(4, '0')}-${googleReviewLastFetched!.month.toString().padLeft(2, '0')}-${googleReviewLastFetched!.day.toString().padLeft(2, '0')}",
    "lowestfee": lowestfee,
    "tagline": tagline,
    "projectedPoint": projectedPoint?.toJson(),
  };
}

class AppThumbnail {
  String? url;
  String? key;

  AppThumbnail({
    this.url,
    this.key,
  });

  factory AppThumbnail.fromJson(Map<String, dynamic> json) => AppThumbnail(
    url: json["url"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "key": key,
  };
}

class Bank {
  String? accHolderName;
  String? bankAccNo;
  String? bankName;
  String? branch;
  String? gstNo;
  String? ifscNo;

  Bank({
    this.accHolderName,
    this.bankAccNo,
    this.bankName,
    this.branch,
    this.gstNo,
    this.ifscNo,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
    accHolderName: json["accHolderName"],
    bankAccNo: json["bankAccNo"],
    bankName: json["bankName"],
    branch: json["branch"],
    gstNo: json["gstNo"],
    ifscNo: json["ifscNo"],
  );

  Map<String, dynamic> toJson() => {
    "accHolderName": accHolderName,
    "bankAccNo": bankAccNo,
    "bankName": bankName,
    "branch": branch,
    "gstNo": gstNo,
    "ifscNo": ifscNo,
  };
}

class Coordinates {
  double? longitude;
  double? latitude;

  Coordinates({
    this.longitude,
    this.latitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "latitude": latitude,
  };
}

class Documents {
  Documents();

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Location {
  String? line1;
  String? line2;
  int? pincode;
  String? area;
  String? city;
  String? state;
  String? country;

  Location({
    this.line1,
    this.line2,
    this.pincode,
    this.area,
    this.city,
    this.state,
    this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    line1: json["line1"],
    line2: json["line2"],
    pincode: json["pincode"],
    area: json["area"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "line1": line1,
    "line2": line2,
    "pincode": pincode,
    "area": area,
    "city": city,
    "state": state,
    "country": country,
  };
}

class ProjectedPoint {
  String? type;
  Crs? crs;
  List<double>? coordinates;

  ProjectedPoint({
    this.type,
    this.crs,
    this.coordinates,
  });

  factory ProjectedPoint.fromJson(Map<String, dynamic> json) => ProjectedPoint(
    type: json["type"],
    crs: json["crs"] == null ? null : Crs.fromJson(json["crs"]),
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "crs": crs?.toJson(),
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

class Crs {
  String? type;
  Properties? properties;

  Crs({
    this.type,
    this.properties,
  });

  factory Crs.fromJson(Map<String, dynamic> json) => Crs(
    type: json["type"],
    properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "properties": properties?.toJson(),
  };
}

class Properties {
  String? name;

  Properties({
    this.name,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Services {
  Th? juniorSecondarySchoolClass68Th;
  Th? higherSecondarySchoolClass910Th;
  Computer? computer;

  Services({
    this.juniorSecondarySchoolClass68Th,
    this.higherSecondarySchoolClass910Th,
    this.computer,
  });

  factory Services.fromJson(Map<String, dynamic> json) => Services(
    juniorSecondarySchoolClass68Th: json["Junior Secondary School (Class 6-8th)"] == null ? null : Th.fromJson(json["Junior Secondary School (Class 6-8th)"]),
    higherSecondarySchoolClass910Th: json["Higher Secondary School (Class 9-10th)"] == null ? null : Th.fromJson(json["Higher Secondary School (Class 9-10th)"]),
    computer: json["Computer"] == null ? null : Computer.fromJson(json["Computer"]),
  );

  Map<String, dynamic> toJson() => {
    "Junior Secondary School (Class 6-8th)": juniorSecondarySchoolClass68Th?.toJson(),
    "Higher Secondary School (Class 9-10th)": higherSecondarySchoolClass910Th?.toJson(),
    "Computer": computer?.toJson(),
  };
}

class Computer {
  String? domainName;
  List<String>? computer;

  Computer({
    this.domainName,
    this.computer,
  });

  factory Computer.fromJson(Map<String, dynamic> json) => Computer(
    domainName: json["domainName"],
    computer: json["computer"] == null ? [] : List<String>.from(json["computer"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "domainName": domainName,
    "computer": computer == null ? [] : List<dynamic>.from(computer!.map((x) => x)),
  };
}

class Th {
  String? domainName;
  List<String>? boards;
  List<String>? classes;
  List<String>? subjects;

  Th({
    this.domainName,
    this.boards,
    this.classes,
    this.subjects,
  });

  factory Th.fromJson(Map<String, dynamic> json) => Th(
    domainName: json["domainName"],
    boards: json["boards"] == null ? [] : List<String>.from(json["boards"]!.map((x) => x)),
    classes: json["classes"] == null ? [] : List<String>.from(json["classes"]!.map((x) => x)),
    subjects: json["subjects"] == null ? [] : List<String>.from(json["subjects"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "domainName": domainName,
    "boards": boards == null ? [] : List<dynamic>.from(boards!.map((x) => x)),
    "classes": classes == null ? [] : List<dynamic>.from(classes!.map((x) => x)),
    "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
  };
}
