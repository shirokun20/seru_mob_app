import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:seru_mob_app/app/base/base_view_model.dart';
import 'package:seru_mob_app/app/configs/app_route.dart';
import 'package:seru_mob_app/app/features/wizard/model/wizard_data_model.dart';
import 'package:seru_mob_app/app/service/api_service.dart';

class Wizard2ViewModel extends BaseViewModel {
  // ignore: unused_field
  final ApiService _apiService;
  final Logger _logger = Logger();
  final ImagePicker picker = ImagePicker();
  final argument = Get.arguments;

  String? photoSelfiePath;
  String? photoKtpPath;
  String? photoBiasaPath;

  Wizard2ViewModel(this._apiService);

  @override
  void onInit() {
    WizardArgumentModel data = argument;
    _logger.i(data.toJson().toString());
    super.onInit();
  }

  void onNextWizard() {
    WizardArgumentModel data = argument;
    data.pathFotoSelfie = photoSelfiePath;
    data.pathFotoKtp = photoKtpPath;
    data.pathFotoBebas = photoBiasaPath;
    Get.toNamed(
      AppRouteName.wizard3,
      arguments: data,
    );
  }

  void setSelfie({
    String? value,
  }) {
    photoSelfiePath = value;
    update();
  }

  void setKtp({
    String? value,
  }) {
    photoKtpPath = value;
    update();
  }

  void setBiasa({
    String? value,
  }) {
    photoBiasaPath = value;
    update();
  }

  Future<String?> onGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    Get.back();
    if (image == null) {
      return null;
    } else {
      return image.path;
    }
  }

  Future<String?> onCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    Get.back();
    if (image == null) {
      return null;
    } else {
      return image.path;
    }
  }
}
