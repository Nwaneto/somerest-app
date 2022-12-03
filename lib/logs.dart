// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
	/// The key to the token as saved locally on this device.
	static const String KEY_SWS_AUTH = "SWS-Auth";
	static const String KEY_AUTH_EXPIRATION = "SWS-Auth-Expiration";
	static const String KEY_USER_NAME = "SWS-Auth-Name";
	static const String KEY_USER_EMAIL = "SWS-Auth-Email";
	static const String KEY_USER_PHONE = "SWS-Auth-Phone";
	static const String KEY_USER_UID = "SWS-Auth-UserID";

	static final LocalStorage _instance = LocalStorage();

	LocalStorage() {
		SharedPreferences.setMockInitialValues({
			KEY_SWS_AUTH: "",
			KEY_AUTH_EXPIRATION: 0,
			KEY_USER_EMAIL: "",
			KEY_USER_NAME: "",
			KEY_USER_PHONE: "",
			KEY_USER_UID: 0
		});
	}

	static LocalStorage getInstance() {
		return _instance;
	}

	Future saveString(String key, String value) async {
		SharedPreferences storage = await SharedPreferences.getInstance();
		storage.setString(key, value);
	}

	Future saveInt(String key, int value) async {
		SharedPreferences storage = await SharedPreferences.getInstance();
		storage.setInt(key, value);
	}

	Future<String> getString(String key) async {
		SharedPreferences storage = await SharedPreferences.getInstance();
		return Future.value(storage.getString(key));
	}

	Future<int> getInt(String key) async {
		SharedPreferences storage = await SharedPreferences.getInstance();
		return Future.value(storage.getInt(key));
	}

	void remove(String key) async {
		SharedPreferences storage = await SharedPreferences.getInstance();
		await storage.remove(key);
	}

	void clear() async {
		SharedPreferences storage = await SharedPreferences.getInstance();
		await storage.clear();
		SharedPreferences.setMockInitialValues({
			KEY_SWS_AUTH: "",
			KEY_AUTH_EXPIRATION: 0,
			KEY_USER_EMAIL: "",
			KEY_USER_NAME: "",
			KEY_USER_PHONE: "",
			KEY_USER_UID: 0
		});
		
	}
}