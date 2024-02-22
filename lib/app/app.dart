library app_layer;

import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../app/managers/shared_pref_manager.dart';
import '../data/login/api/login_api.dart';
import '../presentation/home/home_route.dart';
import '../presentation/list_user/list_user_route.dart';
import '../presentation/login/login_route.dart';
import 'app.config.dart';

part 'core/enum.dart';
part 'di/injection.dart';
part 'managers/color_manager.dart';
part 'managers/config_manager.dart';
part 'managers/style_manager.dart';
part 'managers/theme_manager.dart';
part 'route/app_routing.dart';
part 'utils/navigation_util.dart';
part 'utils/session_utils.dart';
