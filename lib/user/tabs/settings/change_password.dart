import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:somerest/logs.dart';
import 'package:somerest/widgets/notification.dart';
import 'package:somerest/widgets/responsive.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
	@override
	ChangePasswordState createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePassword> {
	final TextEditingController _oldController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();
	final TextEditingController _confirmController = TextEditingController();
	final LocalStorage _storage = LocalStorage.getInstance();
	final http.Client _client = http.Client();

	bool _oldHidden = true;
	bool _passwordHidden = true;
	bool _confirmHidden = true;

	@override
	void initState() {
		super.initState();
	}

	void _deleteAccount() async {
		final String token = await _storage.getString(LocalStorage.KEY_SWS_AUTH);
		final String id = (await _storage.getInt(LocalStorage.KEY_USER_UID)).toString();

		http.Response response = await _client.delete(
			Uri.parse("https://api.somerest.com.ng/users/get/$id"),
			headers:{
				"Content-Type": "application/json",
				"SWS-Auth": token,
			},
			encoding: Encoding.getByName("UTF-8"),
		);

		Map data = jsonDecode(response.body);

		if(response.statusCode == 200) {
			_tellComplete("Your account was deactivated successfully");

			// Delete all of the saved shared preferences
			_storage.clear();

			// Then navigate back to the home page.
			_goHome();
		}

		else {
			_showError(data['report']);
		}
	}

	void _goHome() {
		Navigator.of(context).pushNamed("/");
	}

	void _changePassword() async {
		String old = _oldController.text;
		String password = _passwordController.text;
		String confirm = _confirmController.text;

		if(old.isEmpty) {
			NotificationHelper.showError(context, "You are required to pass in your old password to prove you are the owner of your account.");
		}

		else if(password.isEmpty) {
			NotificationHelper.showError(context, "The new password field cannot be empty. We need your new password in the first instance to change it.");
		}

		else if(password != confirm) {
			NotificationHelper.showError(context, "The two passwords do not match. Review them and attempt again.");
		}

		else if(password == old) {
			NotificationHelper.showError(context, "You are required to pass a different password in order to actually change it.");
		}

		else {
			_oldController.clear();
			_passwordController.clear();
			_confirmController.clear();

			String token = await _storage.getString(LocalStorage.KEY_SWS_AUTH);
			String id = (await _storage.getInt(LocalStorage.KEY_USER_UID)).toString();
			http.Response response = await _client.put(
				Uri.parse("https://api.somerest.com.ng/auth/change_password"),
				headers:{
					"Content-Type": "application/json",
					LocalStorage.KEY_SWS_AUTH: token
				},
				encoding: Encoding.getByName("UTF-8"),
				body: jsonEncode({
					"id": int.parse(id),
					"old": old,
					"new": password,
				})
			);

			Map data = jsonDecode(response.body);

			if(response.statusCode == 200) {
				_tellComplete("We have changed your password successfully.");
			}

			else {
				_showError(data['report']);
			}
		}
	}

	void _tellComplete(String message) {
		NotificationHelper.showSuccessful(context, message);
	}

	void _showError(String message) {
		NotificationHelper.showError(context, message);
	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Container(
			width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width : screenSize.width*0.82,
			padding: const EdgeInsets.only(left: 10, right: 10),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Container(
						margin: const EdgeInsets.only(top: 20,  bottom: 20),
						child: TextField(
							cursorColor: Colors.blue,
							controller: _oldController,
							obscureText: _oldHidden,
							decoration: InputDecoration(
								labelText: "Old Password",
								hintText: "Required",
								hintStyle: const TextStyle(
									color: Colors.red
								),
								prefixIcon: const Icon(Icons.lock_open),
								suffixIcon: IconButton(
									onPressed: () {
										setState(() {
											_oldHidden = !_oldHidden;
										});
									},

									icon: Icon(
										_oldHidden ?
										Icons.visibility_off : Icons.visibility
									) 
								),
								border: const OutlineInputBorder(
									borderRadius: BorderRadius.all(
										Radius.circular(10)
									),

									borderSide: BorderSide(
										color: Colors.blue,
										width: 1.0,
									)
								)
							),
						)
					),

					Container(
						margin: const EdgeInsets.only(bottom: 20),
						child: TextField(
							cursorColor: Colors.blue,
							controller: _passwordController,
							obscureText: _passwordHidden,
							decoration: InputDecoration(
								labelText: "New Password",
								hintText: "Required",
								hintStyle: const TextStyle(
									color: Colors.red
								),
								prefixIcon: const Icon(Icons.lock),
								suffixIcon: IconButton(
									onPressed: () {
										setState(() {
											_passwordHidden = !_passwordHidden;
										});
									},

									icon: Icon(
										_passwordHidden ?
										Icons.visibility_off : Icons.visibility
									) 
								),
								border: const OutlineInputBorder(
									borderRadius: BorderRadius.all(
										Radius.circular(10)
									),

									borderSide: BorderSide(
										color: Colors.blue,
										width: 1.0,
									)
								)
							),
						)
					),

					Container(
						margin: const EdgeInsets.only(bottom: 40),
						child: TextField(
							cursorColor: Colors.blue,
							controller: _confirmController,
							obscureText: _confirmHidden,
							decoration: InputDecoration(
								labelText: "Confirm Password",
								hintText: "Required",
								hintStyle: const TextStyle(
									color: Colors.red
								),
								prefixIcon: const Icon(Icons.lock_person),
								suffixIcon: IconButton(
									onPressed: () {
										setState(() {
											_confirmHidden = !_confirmHidden;
										});
									},

									icon: Icon(
										_confirmHidden ?
										Icons.visibility_off : Icons.visibility
									) 
								),
								border: const OutlineInputBorder(
									borderRadius: BorderRadius.all(
										Radius.circular(10)
									),

									borderSide: BorderSide(
										color: Colors.blue,
										width: 1.0,
									)
								)
							),
						)
					),

					Align(
						alignment: Alignment.centerLeft,
						child: Container(
							margin: const EdgeInsets.only(bottom: 20),
							padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
							decoration: BoxDecoration(
								borderRadius: BorderRadius.circular(20),
								color: Colors.blue,
							),
							child: TextButton(
								onPressed: _changePassword,
								child: const Text(
									"Save Changes",
									style: TextStyle(
										color: Colors.white,
									)
								)
							),
						),
					),

					const Divider(
						color: Color(0x55000000)
					),


					const SizedBox(height: 20),

					const Text(
						"Deactivate my account",
						style: TextStyle(
							fontSize: 18,
							fontWeight: FontWeight.w700
						),
					),

					Text(
						"Are you sure you want to deactivate your account?",
						style: TextStyle(
							fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : null
						),
					),

					Text(
						"You would no longer be able to login to your account or receive job alerts.",
						style: TextStyle(
							color: Colors.red,
							fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : null
						)
					),

					const SizedBox(height: 40),

					Align(
						alignment: Alignment.centerLeft,
						child: Container(
							margin: const EdgeInsets.only(bottom: 20),
							padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
							decoration: BoxDecoration(
								borderRadius: BorderRadius.circular(20),
								color: Colors.blue,
							),
							child: TextButton(
								onPressed: _deleteAccount,
								child: const Text(
									"Deactivate Account",
									style: TextStyle(
										color: Colors.white,
									)
								)
							),
						),
					),


					const SizedBox(height: 70),
				]
			)
		);
	}
}