import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/02_tweeter/features/settings/repos/darkmode_config_repo.dart';
import 'package:tiktok_clone/02_tweeter/features/settings/views/models/darkmode_config_model.dart';

class DarkmodeConfigViewModel extends Notifier<DarkmodeConfigModel> {
  final DarkmodeConfigRepository _repository;

  DarkmodeConfigViewModel(this._repository);

  void setDark(bool value) {
    _repository.setDark(value);
    state = DarkmodeConfigModel(
      isDarkMode: value,
    );
  }

  @override
  DarkmodeConfigModel build() {
    return DarkmodeConfigModel(
      isDarkMode: _repository.isDark(),
    );
  }
}

final darkModeConfigProvider =
    NotifierProvider<DarkmodeConfigViewModel, DarkmodeConfigModel>(
  () => throw UnimplementedError(),
);
