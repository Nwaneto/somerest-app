import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:somerest/logs.dart';
import 'package:somerest/topbar/base.dart';
import 'package:somerest/widgets/notification.dart';
import 'package:somerest/widgets/responsive.dart';

import 'package:somerest/widgets/menu_drawer.dart';

class Register extends StatefulWidget {
	const Register({super.key});

	@override
	 RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
	final ScrollController _scrollController = ScrollController();
	final TextEditingController _nameController = TextEditingController();
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _phoneController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();
	final TextEditingController _confirmController = TextEditingController();

	final http.Client _client = http.Client();

	bool _passwordHidden = true;
	bool _confirmHidden = true;
	double _scrollPosition = 0;
	double _opacity = 0;

	_scrollListener() {
		setState(() {
			_scrollPosition = _scrollController.position.pixels;
		});
	}

	@override
	void initState() {
		_scrollController.addListener(_scrollListener);
		super.initState();
	}

	Future finishRegistration() async {
		final String name = _nameController.text.trim();
		final String email = _emailController.text.trim();
		final String phone = _phoneController.text.trim();
		final String password = _passwordController.text.trim();
		final String confirm = _confirmController.text.trim();

		if(name.isEmpty) {
			NotificationHelper.showError(context, "You are required to specify your first name");
			
		}

		else if(email.isEmpty) {
			NotificationHelper.showError(context, "You are required to specify your email address.");
		}

		else if(phone.isEmpty) {
			NotificationHelper.showError(context, "You are required to specify your phone number.");
		}

		else if(password.isEmpty) {
			NotificationHelper.showError(context, "Password cannot be empty");
		}

		else if(confirm.isEmpty) {
			NotificationHelper.showError(context, "Second password cannot be empty.");
		}

		else if(confirm != password) {
			NotificationHelper.showError(context, "The two passwords do not match.");	
		}

		else {
			http.Response response = await _client.post(
				Uri.parse("http://localhost/auth/register"),
				headers:{
					"Content-Type": "application/json",
				},
				encoding: Encoding.getByName("UTF-8"),
				body: jsonEncode({
					"name": name,
					"email": email,
					"phone": phone,
					"password": password,
					"dob": "22222222"
				})
			);

			Map data = jsonDecode(response.body);

			if(response.statusCode == 200) {
				final report = data['data'];
				final email = report['email'];
				final phone = report['phone'];
				final id = report['id'];
				final token = report['token'];
				final name = report['name'];
				final LocalStorage storage = LocalStorage();
				
				// If this user wants to be remembered, add 30 days to the timer just because they want to be and then save that value.
				int expiry = DateTime.now().add(const Duration(days: 30)).millisecondsSinceEpoch;

				// Now that we have saved the authentication token...
				storage.saveString(LocalStorage.KEY_SWS_AUTH, token);
				storage.saveString(LocalStorage.KEY_USER_EMAIL, email);
				storage.saveInt(LocalStorage.KEY_USER_UID, id);
				storage.saveString(LocalStorage.KEY_USER_PHONE, phone);
				storage.saveString(LocalStorage.KEY_USER_NAME, name);

				// We save the authentication token expiry period
				storage.saveInt(LocalStorage.KEY_AUTH_EXPIRATION, expiry);

				// Since that worked out fine, we need to advance to the next page.
				_advance();
			}

			else {
				_printError(data['report']);
			}
		}
	}

	void _printError(String error) {
		NotificationHelper.showError(context, error);
	}

	void _advance() {
		Navigator.of(context).pushNamed("/user/home");
	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Scaffold(

			appBar: ResponsiveWidget.isSmallScreen(context)
			
			? 
			
			AppBar(
				iconTheme: const IconThemeData(color: Color(0xFF077bd7)),
				backgroundColor: Colors.white,
				elevation: 0,
				centerTitle: true,
				title: Image.asset(
					"assets/images/logo.png",
					scale: 5,
					fit: BoxFit.scaleDown,
					filterQuality: FilterQuality.high,
				))
			: 
			
			PreferredSize(
				preferredSize: Size(screenSize.width, 60),
				child: Container(
					color: Colors.white.withOpacity(0.5),
					child: TopBarContents()
				),
			),

			drawer: const MenuDrawer(),

			body: SingleChildScrollView(
				controller: _scrollController,
				physics: const ClampingScrollPhysics(),
				child: Container(
					color: ResponsiveWidget.isLargeScreen(context) ? const Color(0x55000000) : Colors.white,
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.center,
						children: [
							!ResponsiveWidget.isLargeScreen(context)

							? 

							// For mobile phones and tablets
							Container(
								padding: EdgeInsets.all(ResponsiveWidget.isLargeScreen(context) ? 40 :10),
								child: Column(
									mainAxisAlignment: MainAxisAlignment.start,
									children: [
										const Align(
											alignment: Alignment.centerLeft,
											child:  Text(
											"Sign Up",
											textAlign: TextAlign.start,
											style: TextStyle(
												fontSize: 49,
												fontWeight: FontWeight.w800
											),
											),
										),

										const Align(
											alignment: Alignment.centerLeft,
											child: Text(
											"Welcome to SOMEREST",
											textAlign: TextAlign.start,
											style: TextStyle(
												fontSize: 27,
												fontWeight: FontWeight.w600
											),
											),
										),

										const Align(
											alignment: Alignment.centerLeft,
											child: Text(
											"Register as a job seeker to get jobs",
											textAlign: TextAlign.start,
											style: TextStyle(
												fontSize: 18,
											),
											),
										),

										// Effective margin
										const SizedBox(height: 60),

										Container(
											margin: const EdgeInsets.only(top: 20),
											child: TextField(
												cursorColor: Colors.blue,
												controller: _nameController,
												decoration: const InputDecoration(
													labelText: "Fullname",
													hintText: "Required",
													hintStyle: TextStyle(
														color: Colors.red
													),
													prefixIcon: Icon(Icons.account_box),
													border: OutlineInputBorder(
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
											margin: const EdgeInsets.only(top: 20),
											child: TextField(
												cursorColor: Colors.blue,
												controller: _emailController,
												decoration: const InputDecoration(
													labelText: "Email Address",
													hintText: "Required",
													hintStyle: TextStyle(
														color: Colors.red
													),
													prefixIcon: Icon(Icons.email),
													border: OutlineInputBorder(
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
											margin: const EdgeInsets.only(top: 20),
											child: TextField(
												cursorColor: Colors.blue,
												controller: _phoneController,
												decoration: const InputDecoration(
													labelText: "Phone Number",
													hintText: "Required",
													hintStyle: TextStyle(
														color: Colors.red
													),
													prefixIcon: Icon(Icons.call),
													border: OutlineInputBorder(
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
											margin: const EdgeInsets.only(top: 20,  bottom: 20),
											child: TextField(
												cursorColor: Colors.blue,
												controller: _passwordController,
												obscureText: _passwordHidden,
												decoration: InputDecoration(
													labelText: "Password",
													hintText: "Required",
													hintStyle: const TextStyle(
														color: Colors.red
													),
													prefixIcon: const Icon(Icons.lock_open),
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
											margin: const EdgeInsets.only(bottom: 20),
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
													prefixIcon: const Icon(Icons.lock),
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
											alignment: Alignment.center,
											child: Container(
												margin: const EdgeInsets.only(top: 40),
												padding: const EdgeInsets.only(top: 15, bottom: 15, left: 50, right: 50),
												decoration: BoxDecoration(
													borderRadius: BorderRadius.circular(20),
													color: Colors.blue,
												),
												child: TextButton(
													onPressed: finishRegistration,
													child: const Text(
														"Register",
														style: TextStyle(
															fontSize: 20,
															color: Colors.white,
															fontWeight: FontWeight.w900
														)
													)
												),
											),
										),

										const SizedBox(height: 30),

										Align(
											alignment: Alignment.center,
											child: Row(
												mainAxisAlignment: MainAxisAlignment.center,
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													const Text(
														"Already have an account?",
														textAlign: TextAlign.start,
														style: TextStyle(
															color: Colors.black,
															fontSize: 14
														)
													),

													// Just there as margin.
													const SizedBox(width: 5),

													TextButton(
														onPressed: () {
															Navigator.of(context).pushNamed("/login");
														},
														style: TextButton.styleFrom(
															padding: EdgeInsets.zero,
															tapTargetSize: MaterialTapTargetSize.shrinkWrap,
															minimumSize: const Size(1, 1),
															alignment: Alignment.centerLeft
														),
														
														child: const Text(
															'Login',
															textAlign: TextAlign.start,
															style: TextStyle(
																color: Colors.blue,
																fontSize: 14
															)
														),
													),
												],
											)
										),
									]
								),
							)

							:

							Container (
								width: null,
								margin: const EdgeInsets.all(20),
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(20)
								),
								child: Card(
									child: Row(
										crossAxisAlignment: CrossAxisAlignment.start,
										mainAxisAlignment: MainAxisAlignment.start,
										children: [
											Container(
												height: screenSize.height + 100,
												padding: const EdgeInsets.all(0),
												margin: const EdgeInsets.all(0),
												decoration: BoxDecoration(
													borderRadius: BorderRadius.circular(20)
												),
												child: Image.asset(
													"assets/images/image10.png",
													fit: BoxFit.fitHeight
												),
											),

											Container(
												width: screenSize.width * 0.65,
												padding: const EdgeInsets.all(40),
												child: Column(
													mainAxisAlignment: MainAxisAlignment.start,
													children: [
														const Align(
															alignment: Alignment.centerLeft,
															child:  Text(
															"Sign Up",
															textAlign: TextAlign.start,
															style: TextStyle(
																fontSize: 49,
																fontWeight: FontWeight.w800
															),
															),
														),

														const Align(
															alignment: Alignment.centerLeft,
															child: Text(
															"Welcome to SOMEREST",
															textAlign: TextAlign.start,
															style: TextStyle(
																fontSize: 27,
																fontWeight: FontWeight.w600
															),
															),
														),

														const Align(
															alignment: Alignment.centerLeft,
															child: Text(
															"Register as a job seeker to get jobs",
															textAlign: TextAlign.start,
															style: TextStyle(
																fontSize: 18,
															),
															),
														),

														// Effective margin
														const SizedBox(height: 60),

														Container(
															margin: const EdgeInsets.only(top: 20),
															child: TextField(
																cursorColor: Colors.blue,
																controller: _nameController,
																decoration: const InputDecoration(
																	labelText: "Fullname",
																	hintText: "Required",
																	hintStyle: TextStyle(
																		color: Colors.red
																	),
																	prefixIcon: Icon(Icons.account_box),
																	border: OutlineInputBorder(
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
															margin: const EdgeInsets.only(top: 20),
															child: TextField(
																cursorColor: Colors.blue,
																controller: _emailController,
																decoration: const InputDecoration(
																	labelText: "Email Address",
																	hintText: "Required",
																	hintStyle: TextStyle(
																		color: Colors.red
																	),
																	prefixIcon: Icon(Icons.email),
																	border: OutlineInputBorder(
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
															margin: const EdgeInsets.only(top: 20),
															child: TextField(
																cursorColor: Colors.blue,
																controller: _phoneController,
																decoration: const InputDecoration(
																	labelText: "Phone Number",
																	hintText: "Required",
																	hintStyle: TextStyle(
																		color: Colors.red
																	),
																	prefixIcon: Icon(Icons.call),
																	border: OutlineInputBorder(
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
															margin: const EdgeInsets.only(top: 20,  bottom: 20),
															child: TextField(
																cursorColor: Colors.blue,
																controller: _passwordController,
																obscureText: _passwordHidden,
																decoration: InputDecoration(
																	labelText: "Password",
																	hintText: "Required",
																	hintStyle: const TextStyle(
																		color: Colors.red
																	),
																	prefixIcon: const Icon(Icons.lock_open),
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
															margin: const EdgeInsets.only(bottom: 20),
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
																	prefixIcon: const Icon(Icons.lock),
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
															alignment: Alignment.center,
															child: Container(
																margin: const EdgeInsets.only(top: 40),
																padding: const EdgeInsets.only(top: 15, bottom: 15, left: 50, right: 50),
																decoration: BoxDecoration(
																	borderRadius: BorderRadius.circular(20),
																	color: Colors.blue,
																),
																child: TextButton(
																	onPressed: finishRegistration,
																	child: const Text(
																		"Register",
																		style: TextStyle(
																			fontSize: 20,
																			color: Colors.white,
																			fontWeight: FontWeight.w900
																		)
																	)
																),
															),
														),

														const SizedBox(height: 30),

														Align(
															alignment: Alignment.center,
															child: Row(
																mainAxisAlignment: MainAxisAlignment.center,
																crossAxisAlignment: CrossAxisAlignment.center,
																children: [
																	const Text(
																		"Already have an account?",
																		textAlign: TextAlign.start,
																		style: TextStyle(
																			color: Colors.black,
																			fontSize: 14
																		)
																	),

																	// Just there as margin.
																	const SizedBox(width: 5),

																	TextButton(
																		onPressed: () {
																			Navigator.of(context).pushNamed("/login");
																		},
																		style: TextButton.styleFrom(
																			padding: EdgeInsets.zero,
																			tapTargetSize: MaterialTapTargetSize.shrinkWrap,
																			minimumSize: const Size(1, 1),
																			alignment: Alignment.centerLeft
																		),
																		
																		child: const Text(
																			'Login',
																			textAlign: TextAlign.start,
																			style: TextStyle(
																				color: Colors.blue,
																				fontSize: 14
																			)
																		),
																	),
																],
															)
														),
													]
												),
											)
										],
									),
								)
							),
						]
					),
				)
			)
		);
	}
}
