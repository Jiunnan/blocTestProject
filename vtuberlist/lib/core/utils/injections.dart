import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vtuberlist/core/helper/app_share_preference.dart';


final s1 = GetIt.instance;

Future<void> initInjections() async {
  await initSharedPrefsInjections();
  await initAPPSharePrefsInjections();
}

initSharedPrefsInjections() async {
  s1.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  await s1.isReady<SharedPreferences>();
}

initAPPSharePrefsInjections() async {
  s1.registerSingletonAsync<APPSharePreferences>(() async {
    return APPSharePreferences();
  });

  await s1.isReady<APPSharePreferences>();
}