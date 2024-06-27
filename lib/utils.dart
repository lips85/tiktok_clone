import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/02_tweeter/features/settings/view_models/darkmode_config_vm.dart';

bool isDarkMode(BuildContext context) =>
    context.watch<DarkmodeConfigViewModel>().darked;
