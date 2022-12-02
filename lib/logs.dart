// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
	/// The key to the token as saved locally on this device.
	static const String KEY_SWS_AUTH = "SWS-Auth";

	static const String KEY_AUTH_EXPIRATION = "SWS-Auth-Expiration";

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
}