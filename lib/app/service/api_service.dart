import 'package:seru_mob_app/app/api/api_wilayah.dart';
import 'package:seru_mob_app/app/base/base_dio_datasource.dart';

class ApiService extends BaseDioDataSource with ApiWilayah {
  ApiService(super.client);
}
