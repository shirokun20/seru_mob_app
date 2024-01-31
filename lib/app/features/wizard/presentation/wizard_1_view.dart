import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:seru_mob_app/app/base/base_ui_state.dart';
import 'package:seru_mob_app/app/configs/app_style.dart';
import 'package:seru_mob_app/app/features/wizard/local_widgets/wizard_footer_btn_widget.dart';
import 'package:seru_mob_app/app/features/wizard/local_widgets/wizard_form_input_widget.dart';
import 'package:seru_mob_app/app/features/wizard/local_widgets/wizard_select_input_widget.dart';
import 'package:seru_mob_app/app/features/wizard/model/wilayah_response_model.dart';
import 'package:seru_mob_app/app/features/wizard/view_model/wizard_1_view_model.dart';

class Wizard1View extends GetView<Wizard1ViewModel> {
  const Wizard1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _main(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text(
        "Form 1",
        style: AppStyle.styleBold(
          size: 15,
          textColor: Colors.white,
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  Widget _main() {
    return Column(
      children: [
        Expanded(
          child: _content(),
        ),
        _footer(
          onTap: () => controller.onNextWizard(),
        ),
      ],
    );
  }

  Widget _content() {
    return GetBuilder<Wizard1ViewModel>(builder: (ctrl) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: WizardFormInputWidget(
                controller: ctrl.firstNameCtrl,
                label: "First Name",
                isTextArea: false,
                hint: "First Name",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: WizardFormInputWidget(
                controller: ctrl.lastNameCtrl,
                label: "Last Name",
                isTextArea: false,
                hint: "Last Name",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: WizardFormInputWidget(
                controller: ctrl.bioCtrl,
                label: "Biodata",
                isTextArea: true,
                hint: "Biodata",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: WizardSelectInputWidget(
                label: "Province",
                value: ctrl.provinceSelected != null
                    ? "${ctrl.provinceSelected?.name}"
                    : "Select Province",
                onTap: () {
                  ctrl.onGetProvinceInit();
                  Get.bottomSheet(
                    selectCustom(
                      label: "Province",
                      widget: provinceWidget(),
                    ),
                  );
                },
              ),
            ),
            Visibility(
              visible: ctrl.provinceSelected != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: WizardSelectInputWidget(
                  label: "Regency",
                  value: ctrl.regencieSelected != null
                      ? "${ctrl.regencieSelected?.name}"
                      : "Select Regency",
                  onTap: () {
                    ctrl.onGetRegencieInit();
                    Get.bottomSheet(
                      selectCustom(
                        label: "Regency",
                        widget: regencieWidget(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: ctrl.regencieSelected != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: WizardSelectInputWidget(
                  label: "District",
                  value: ctrl.districtSelected != null
                      ? "${ctrl.districtSelected?.name}"
                      : "Select District",
                  onTap: () {
                    ctrl.onGetDistrictInit();
                    Get.bottomSheet(
                      selectCustom(
                        label: "District",
                        widget: districtWidget(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: ctrl.districtSelected != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: WizardSelectInputWidget(
                  label: "Village",
                  value: ctrl.villageSelected != null
                      ? "${ctrl.villageSelected?.name}"
                      : "Select Village",
                  onTap: () {
                    ctrl.onGetVillageInit();
                    Get.bottomSheet(
                      selectCustom(
                        label: "Village",
                        widget: villageWidget(),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      );
    });
  }

  Widget provinceWidget() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: GetBuilder<Wizard1ViewModel>(builder: (ctrl) {
        final state = ctrl.provincesState;
        final selected = ctrl.provinceBs;
        if (state is BaseUILoadSuccess) {
          List<Widget> output = [];
          List<WilayahResponseModel> data = state.data;
          Logger().i("$selected");
          for (var e in data) {
            output.add(
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: GestureDetector(
                  onTap: () => ctrl.onSelectBsProvince(e),
                  child: Row(
                    children: [
                      Text(
                        "${e.name}",
                        style: AppStyle.styleMedium(
                          size: 15,
                          textColor: selected != null && selected.id == e.id
                              ? Colors.blueAccent
                              : Colors.black,
                        ),
                      ),
                      const Spacer(),
                      selected != null && selected.id == e.id
                          ? const Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.blueAccent,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: output,
                  ),
                ),
              ),
              btnBs(
                isSelected: selected != null,
                onTap: () {
                  Get.back();
                  ctrl.onSelectedProvince();
                },
              )
            ],
          );
        }

        if (state is BaseUILoading) {
          return loadingUi();
        }
        return Container();
      }),
    );
  }

  Widget regencieWidget() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: GetBuilder<Wizard1ViewModel>(builder: (ctrl) {
        final state = ctrl.regenciesState;
        final selected = ctrl.regencieBs;
        if (state is BaseUILoadSuccess) {
          List<Widget> output = [];
          List<WilayahResponseModel> data = state.data;
          Logger().i("$selected");
          for (var e in data) {
            output.add(
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: GestureDetector(
                  onTap: () => ctrl.onSelectBsRegencie(e),
                  child: Row(
                    children: [
                      Text(
                        "${e.name}",
                        style: AppStyle.styleMedium(
                          size: 15,
                          textColor: selected != null && selected.id == e.id
                              ? Colors.blueAccent
                              : Colors.black,
                        ),
                      ),
                      const Spacer(),
                      selected != null && selected.id == e.id
                          ? const Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.blueAccent,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: output,
                  ),
                ),
              ),
              btnBs(
                isSelected: selected != null,
                onTap: () {
                  Get.back();
                  ctrl.onSelectedRegencie();
                },
              )
            ],
          );
        }

        if (state is BaseUILoading) {
          return loadingUi();
        }
        return Container();
      }),
    );
  }

  Widget districtWidget() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: GetBuilder<Wizard1ViewModel>(builder: (ctrl) {
        final state = ctrl.districtsState;
        final selected = ctrl.districtBs;
        if (state is BaseUILoadSuccess) {
          List<Widget> output = [];
          List<WilayahResponseModel> data = state.data;
          Logger().i("$selected");
          for (var e in data) {
            output.add(
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: GestureDetector(
                  onTap: () => ctrl.onSelectBsDistrict(e),
                  child: Row(
                    children: [
                      Text(
                        "${e.name}",
                        style: AppStyle.styleMedium(
                          size: 15,
                          textColor: selected != null && selected.id == e.id
                              ? Colors.blueAccent
                              : Colors.black,
                        ),
                      ),
                      const Spacer(),
                      selected != null && selected.id == e.id
                          ? const Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.blueAccent,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: output,
                  ),
                ),
              ),
              btnBs(
                isSelected: selected != null,
                onTap: () {
                  Get.back();
                  ctrl.onSelectedDistrict();
                },
              )
            ],
          );
        }

        if (state is BaseUILoading) {
          return loadingUi();
        }
        return Container();
      }),
    );
  }

  Widget villageWidget() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: GetBuilder<Wizard1ViewModel>(builder: (ctrl) {
        final state = ctrl.villagesState;
        final selected = ctrl.villageBs;
        if (state is BaseUILoadSuccess) {
          List<Widget> output = [];
          List<WilayahResponseModel> data = state.data;
          Logger().i("$selected");
          for (var e in data) {
            output.add(
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: GestureDetector(
                  onTap: () => ctrl.onSelectBsVillage(e),
                  child: Row(
                    children: [
                      Text(
                        "${e.name}",
                        style: AppStyle.styleMedium(
                          size: 15,
                          textColor: selected != null && selected.id == e.id
                              ? Colors.blueAccent
                              : Colors.black,
                        ),
                      ),
                      const Spacer(),
                      selected != null && selected.id == e.id
                          ? const Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.blueAccent,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: output,
                  ),
                ),
              ),
              btnBs(
                isSelected: selected != null,
                onTap: () {
                  Get.back();
                  ctrl.onSelectedVillage();
                },
              )
            ],
          );
        }

        if (state is BaseUILoading) {
          return loadingUi();
        }
        return Container();
      }),
    );
  }

  Widget loadingUi() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Sedang Mengambil data",
            style: AppStyle.styleSemiBold(
              size: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget btnBs({
    bool isSelected = false,
    void Function()? onTap,
  }) {
    return Visibility(
      visible: isSelected,
      child: Column(
        children: [
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xFFD0D5DD),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Text(
                    "Pilih",
                    textAlign: TextAlign.center,
                    style: AppStyle.styleSemiBold(
                      size: 15,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget selectCustom({String label = "", Widget? widget}) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Text(
              label,
              style: AppStyle.styleSemiBold(
                size: 14,
                textColor: const Color(0xFF101828),
              ),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xFFD0D5DD),
          ),
          Expanded(child: widget ?? const SizedBox()),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _footer({
    void Function()? onTap,
  }) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(
        bottom: 25,
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          const Spacer(),
          WizardFooterBtnWidget(
            onTap: onTap,
            isDisabled: false,
          ),
        ],
      ),
    );
  }
}
