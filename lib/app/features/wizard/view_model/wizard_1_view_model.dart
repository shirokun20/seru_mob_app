import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:seru_mob_app/app/base/base_ui_state.dart';
import 'package:seru_mob_app/app/base/base_view_model.dart';
import 'package:seru_mob_app/app/configs/app_route.dart';
import 'package:seru_mob_app/app/features/wizard/model/wilayah_response_model.dart';
import 'package:seru_mob_app/app/features/wizard/model/wizard_data_model.dart';
import 'package:seru_mob_app/app/service/api_service.dart';

class Wizard1ViewModel extends BaseViewModel {
  final ApiService _apiService;
  final Logger _logger = Logger();
  //
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController bioCtrl = TextEditingController();
  //
  BaseUIState provincesState = BaseUIIdle();
  BaseUIState regenciesState = BaseUIIdle();
  BaseUIState districtsState = BaseUIIdle();
  BaseUIState villagesState = BaseUIIdle();
  //
  Wizard1ViewModel(this._apiService);
  //
  WilayahResponseModel? provinceSelected;
  WilayahResponseModel? regencieSelected;
  WilayahResponseModel? districtSelected;
  WilayahResponseModel? villageSelected;
  //
  WilayahResponseModel? provinceBs;
  WilayahResponseModel? regencieBs;
  WilayahResponseModel? districtBs;
  WilayahResponseModel? villageBs;
  //
  void onGetProvinceInit() {
    provinceBs = null;
    provincesState = BaseUIIdle();
    update();
    onGetProvince();
  }

  //
  void onNextWizard() {
    Get.toNamed(
      AppRouteName.wizard2,
      arguments: WizardArgumentModel(
        firstName: firstNameCtrl.text,
        lastName: lastNameCtrl.text,
        bio: bioCtrl.text,
        province: provinceSelected,
        regencie: regencieSelected,
        district: districtSelected,
        village: villageSelected,
      ),
    );
  }

  //
  Future<void> onGetProvince() async {
    provincesState = BaseUILoading();
    update();
    try {
      final res = await _apiService.getProvinces().then((value) {
        List<WilayahResponseModel> output = [];
        value.forEach((element) {
          output.add(WilayahResponseModel.fromJson(element));
        });
        return output;
      });
      provincesState = BaseUILoadSuccess(res);
    } on DioException catch (e) {
      _logger.e(e, stackTrace: e.stackTrace);
      _logger.i(e.response?.data);
      provincesState = BaseUIError();
    } finally {
      update();
    }
  }

  void onSelectBsProvince(WilayahResponseModel provinceData) {
    provinceBs = provinceData;
    update();
  }

  void onSelectedProvince() {
    if (provinceSelected != provinceBs) {
      regencieSelected = null;
      districtSelected = null;
      villageSelected = null;
      regencieBs = null;
      districtBs = null;
      villageBs = null;
    }
    provinceSelected = provinceBs;
    update();
  }

  void onGetRegencieInit() {
    regencieBs = null;
    regenciesState = BaseUIIdle();
    update();
    onGetRegencie();
  }

  //
  Future<void> onGetRegencie() async {
    regenciesState = BaseUILoading();
    update();
    try {
      final data = provinceSelected!;
      final res = await _apiService.getRegencies("${data.id}").then((value) {
        List<WilayahResponseModel> output = [];
        value.forEach((element) {
          output.add(WilayahResponseModel.fromJson(element));
        });
        return output;
      });
      regenciesState = BaseUILoadSuccess(res);
    } on DioException catch (e) {
      _logger.e(e, stackTrace: e.stackTrace);
      _logger.i(e.response?.data);
      regenciesState = BaseUIError();
    } finally {
      update();
    }
  }

  void onSelectBsRegencie(WilayahResponseModel regencieData) {
    regencieBs = regencieData;
    update();
  }

  void onSelectedRegencie() {
    if (regencieSelected != regencieBs) {
      districtSelected = null;
      villageSelected = null;
      districtBs = null;
      villageBs = null;
    }
    regencieSelected = regencieBs;
    update();
  }

  void onGetDistrictInit() {
    districtBs = null;
    districtsState = BaseUIIdle();
    update();
    onGetDistrict();
  }

  //
  Future<void> onGetDistrict() async {
    districtsState = BaseUILoading();
    update();
    try {
      final data = regencieSelected!;
      final res = await _apiService.getDistricts("${data.id}").then((value) {
        List<WilayahResponseModel> output = [];
        value.forEach((element) {
          output.add(WilayahResponseModel.fromJson(element));
        });
        return output;
      });
      districtsState = BaseUILoadSuccess(res);
    } on DioException catch (e) {
      _logger.e(e, stackTrace: e.stackTrace);
      _logger.i(e.response?.data);
      districtsState = BaseUIError();
    } finally {
      update();
    }
  }

  void onSelectBsDistrict(WilayahResponseModel districtData) {
    districtBs = districtData;
    update();
  }

  void onSelectedDistrict() {
    if (districtSelected != districtBs) {
      villageSelected = null;
      villageBs = null;
    }
    districtSelected = districtBs;
    update();
  }

  void onGetVillageInit() {
    villageBs = null;
    villagesState = BaseUIIdle();
    update();
    onGetVillage();
  }

  //
  Future<void> onGetVillage() async {
    villagesState = BaseUILoading();
    update();
    try {
      final data = districtSelected!;
      final res = await _apiService.getVillages("${data.id}").then((value) {
        List<WilayahResponseModel> output = [];
        value.forEach((element) {
          output.add(WilayahResponseModel.fromJson(element));
        });
        return output;
      });
      villagesState = BaseUILoadSuccess(res);
    } on DioException catch (e) {
      _logger.e(e, stackTrace: e.stackTrace);
      _logger.i(e.response?.data);
      villagesState = BaseUIError();
    } finally {
      update();
    }
  }

  void onSelectBsVillage(WilayahResponseModel villageData) {
    villageBs = villageData;
    update();
  }

  void onSelectedVillage() {
    villageSelected = villageBs;
    update();
  }
}
