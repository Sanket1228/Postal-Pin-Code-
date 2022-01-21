class PostalCode {
  late String message;
  late String status;
  late final List<PostOffice> postOffice;

  PostalCode(
      {required this.message, required this.status, required this.postOffice});

  PostalCode.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    status = json['Status'];
    if (json['PostOffice'] != null) {
      postOffice = <PostOffice>[];
      json['PostOffice'].forEach((v) {
        postOffice.add(new PostOffice.fromJson(v));
      });
    }
  }
}

class PostOffice {
  late String name;
  late String? description;
  late String branchType;
  late String deliveryStatus;
  late String circle;
  late String district;
  late String division;
  late String region;
  late String state;
  late String country;

  PostOffice(
      {required this.name,
      required this.description,
      required this.branchType,
      required this.deliveryStatus,
      required this.circle,
      required this.district,
      required this.division,
      required this.region,
      required this.state,
      required this.country});

  PostOffice.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    description = json['Description'];
    branchType = json['BranchType'];
    deliveryStatus = json['DeliveryStatus'];
    circle = json['Circle'];
    district = json['District'];
    division = json['Division'];
    region = json['Region'];
    state = json['State'];
    country = json['Country'];
  }
}
