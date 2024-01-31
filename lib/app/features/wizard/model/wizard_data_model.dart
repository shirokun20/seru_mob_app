import 'package:seru_mob_app/app/features/wizard/model/wilayah_response_model.dart';

class WizardArgumentModel {
  String? bio;
  String? firstName;
  String? lastName;
  String? pathFotoKtp;
  String? pathFotoBebas;
  String? pathFotoSelfie;
  //
  WilayahResponseModel? province;
  WilayahResponseModel? regencie;
  WilayahResponseModel? district;
  WilayahResponseModel? village;
  //
  WizardArgumentModel({
    this.bio,
    this.lastName,
    this.firstName,
    this.province,
    this.regencie,
    this.district,
    this.village,
    this.pathFotoKtp,
    this.pathFotoBebas,
    this.pathFotoSelfie,
  });
  //
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bio'] = bio;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    if (province != null) {
      data['province'] = province!.toJson();
    } else {
      data['province'] = null;
    }
    if (regencie != null) {
      data['regencie'] = regencie!.toJson();
    } else {
      data['regencie'] = null;
    }
    if (district != null) {
      data['district'] = district!.toJson();
    } else {
      data['district'] = null;
    }
    if (village != null) {
      data['village'] = village!.toJson();
    } else {
      data['village'] = null;
    }
    data['path_foto_Ktp'] = pathFotoKtp;
    data['path_foto_bebas'] = pathFotoBebas;
    data['path_foto_selfie'] = pathFotoSelfie;
    return data;
  }
}
