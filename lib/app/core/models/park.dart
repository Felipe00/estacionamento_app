class ParkingLot {
  String? createdAt;
  List<Incomes>? incomes;

  ParkingLot({this.createdAt, this.incomes});

  ParkingLot.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    incomes = List.empty();
    if (json['incomes'] != null) {
      json['incomes'].forEach((v) {
        incomes?.add( Incomes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    if (this.incomes != null) {
      data['incomes'] = this.incomes?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Incomes {
  String? createdAt;
  String? leaveAt;
  String? parkingSpace;
  String? carPlate;

  Incomes({this.createdAt, this.leaveAt, this.parkingSpace, this.carPlate});

  Incomes.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    leaveAt = json['leave_at'];
    parkingSpace = json['parking_space'];
    carPlate = json['car_plate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['leave_at'] = this.leaveAt;
    data['parking_space'] = this.parkingSpace;
    data['car_plate'] = this.carPlate;
    return data;
  }
}
