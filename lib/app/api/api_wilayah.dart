import 'package:seru_mob_app/app/base/base_dio_datasource.dart';
import 'package:seru_mob_app/app/ext/dio_ext.dart';

mixin ApiWilayah on BaseDioDataSource {
  // Ambil Provinsi
  Future getProvinces() {
    String path = "/provinces.json";
    return get(path).load();
  }
  // Ambil Kota by Provinsi
  Future getRegencies(String provinceId) {
    String path = "/regencies/$provinceId.json";
    return get(path).load();
  }
  // Ambil Kecamatan By Kota
  Future getDistricts(String regencyId) {
    String path = "/districts/$regencyId.json";
    return get(path).load();
  }
  // Ambil Desa By Kec
  Future getVillages(String districtId) {
    String path = "/villages/$districtId.json";
    return get(path).load();
  }
}