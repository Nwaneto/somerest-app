import 'package:http/http.dart' as http;
import 'dart:async';
import "dart:convert";

class SendRequest {
	final http.Client _client = http.Client();
	late String _token;

	SendRequest() {
		_token = "";
	}

	Future<http.Response> sendGet(String url, String ?arguments) async {
		Map<String, String> httpHeaders = {"SWS-Auth": _token};

		if(arguments != null && arguments.isNotEmpty) {
			url += "/$arguments";
		}
		
		http.Response response = await _client.get(Uri.parse(url), headers: httpHeaders);
		return response;
	}

	Future<http.Response> sendPost(String url, String ?arguments, Map body) async {
		Map<String, String> httpHeaders = {"SWS-Auth": _token};
		if(arguments != null && arguments.isNotEmpty) {
			url += "/$arguments";
		}
		http.Response response = await _client.post(Uri.parse(url), body: jsonEncode(body),headers: httpHeaders);
		return response;
	}

	Future<http.Response> sendDelete(String url, String ?arguments) async {
		Map<String, String> httpHeaders = {"SWS-Auth": _token};

		if(arguments != null && arguments.isNotEmpty) {
			url += "/$arguments";
		}

		http.Response response = await _client.delete(Uri.parse(url), headers: httpHeaders);
		return response;
	}

	Future<http.Response> sendPut(String url, String ?arguments, Map body) async {
		Map<String, String> httpHeaders = {"SWS-Auth": _token};
		
		if(arguments != null && arguments.isNotEmpty) {
			url += "/$arguments";
		}
		
		http.Response response = await _client.put(Uri.parse(url), body: jsonEncode(body), headers: httpHeaders);
		return response;
	}
}