import 'package:flutter/material.dart';
import 'package:tiktok_clone/02_tweeter/features/settings/repos/darkmode_config_repo.dart';
import 'package:tiktok_clone/02_tweeter/features/settings/views/models/darkmode_config_model.dart';

class DarkmodeConfigViewModel extends ChangeNotifier {
  final DarkmodeConfigRepository _repository;

  late final DarkmodeConfigModel _model = DarkmodeConfigModel(
    isDarkMode: _repository.isDark(),
  );

  DarkmodeConfigViewModel(this._repository);

  bool get darked => _model.isDarkMode;

  void setDark(bool value) {
    _repository.setDark(value);
    _model.isDarkMode = value;
    notifyListeners();
  }
}
