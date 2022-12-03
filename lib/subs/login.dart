import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:somerest/logs.dart';
import 'package:somerest/topbar/base.dart';
import 'package:somerest/widgets/notification.dart';
import 'package:somerest/widgets/responsive.dart';

import 'package:somerest/widgets/menu_drawer.dart';

class Login extends StatefulWidget {
	const Login({super.key});

	@override
	 LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
	final ScrollController _scrollController = ScrollController();
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();
	final http.Client _client = http.Client();
	final LocalStorage _storage = LocalStorage.getInstance();

	bool? _rememberMe = false;
	bool _passwordHidden = true;
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

	void _checkPresent() async {
		String token = await _storage.getString(LocalStorage.KEY_SWS_AUTH);
	
		// If for any reason, this is not empty...
		if(token.isNotEmpty || token != "") {
			_advance();
		}
	}

	Future finishLogin() async {
		final String email = _emailController.text.trim();
		final String password = _passwordController.text.trim();

		int emptyCount = 0;

		if(email.isEmpty) {
			emptyCount++;
		}

		if(password.isEmpty) {
			emptyCount++;
		}

		if(emptyCount > 0) {
			return;
		}

		http.Response response = await _client.post(
			Uri.parse("http://localhost/auth/login"),
			headers:{
				"Content-Type": "application/json",
			},
			encoding: Encoding.getByName("UTF-8"),
			body: jsonEncode({
				"email": email,
				"password": password,
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

			// If this user wants to be remembered, add 30 days to the timer just because they want to be and then save that value.
			int expiry = _rememberMe == true ? DateTime.now().millisecondsSinceEpoch : DateTime.now().add(const Duration(days: 30)).millisecondsSinceEpoch;

			// Now that we have saved the authentication token...
			_storage.saveString(LocalStorage.KEY_USER_EMAIL, email);
			_storage.saveInt(LocalStorage.KEY_USER_UID, id);
			_storage.saveString(LocalStorage.KEY_USER_PHONE, phone);
			_storage.saveString(LocalStorage.KEY_USER_NAME, name);

			// We save the authentication token and its expiry period
			_storage.saveInt(LocalStorage.KEY_AUTH_EXPIRATION, expiry);
			_storage.saveString(LocalStorage.KEY_SWS_AUTH, token);

			// Since that worked out fine, we need to advance to the next page.
			_advance();
		}

		else {
			_showError(data['report']);
		}
	}

	void _showError(String error) {
		NotificationHelper.showError(context, error);
	}

	void _advance() {
		Navigator.of(context).pushNamed("/user/home");
	}

	@override
	Widget build(BuildContext context) {
		_checkPresent();
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
											"Login",
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
												fontSize: 33,
												fontWeight: FontWeight.w600
											),
											),
										),

										const Align(
											alignment: Alignment.centerLeft,
											child: Text(
											"Log into your account here",
											textAlign: TextAlign.start,
											style: TextStyle(
												fontSize: 20,
											),
											),
										),

										// Effective margin
										const SizedBox(height: 60),

										Container(
											margin: const EdgeInsets.only(top: 20),
											child: TextField(
												cursorColor: Colors.blue,
												controller: _emailController,
												keyboardType: TextInputType.emailAddress,
												decoration: const InputDecoration(
													labelText: "Email Address",
													hintText: "Required",
													prefixIcon: Icon(Icons.email),
													hintStyle: TextStyle(
														color: Colors.red
													),
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
												keyboardType: TextInputType.visiblePassword,
												decoration: InputDecoration(
													labelText: "Password",
													hintText: "Required",
													prefixIcon:const Icon(Icons.lock),
													hintStyle: const TextStyle(
														color: Colors.red
													),
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

										Align(
											alignment: Alignment.centerRight,
											child: TextButton(
												onPressed: finishLogin,
												style: TextButton.styleFrom(
													padding: EdgeInsets.zero,
													tapTargetSize: MaterialTapTargetSize.shrinkWrap,
													minimumSize: const Size(1, 1),
													alignment: Alignment.centerLeft
												),
												child: const Text(
													'Forgot Password',
													textAlign: TextAlign.start,
													style: TextStyle(
														color: Colors.blue,
														fontSize: 14
													)
												),
											),
										),

										Align(
											alignment: Alignment.centerLeft,
											child: Row(
												mainAxisAlignment: MainAxisAlignment.start,
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Checkbox(
														value: _rememberMe,
														onChanged: (value) {
															setState(() {
																_rememberMe = value;
															});
														}
													),

													// Just there as margin.
													const SizedBox(width: 5),

													const Text(
														'Remember Me',
														textAlign: TextAlign.start,
														style: TextStyle(
															color: Colors.blue,
															fontSize: 14
														)
													),
												],
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
													onPressed: finishLogin,
													child: const Text(
														"Login",
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
														"Don't have an account?",
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
															Navigator.of(context).pushNamed("/register");
														},
														style: TextButton.styleFrom(
															padding: EdgeInsets.zero,
															tapTargetSize: MaterialTapTargetSize.shrinkWrap,
															minimumSize: const Size(1, 1),
															alignment: Alignment.centerLeft
														),
														
														child: const Text(
															'Register',
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
												height: screenSize.height,
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
												width: screenSize.width * 0.69,
												padding: const EdgeInsets.all(40),
												child: Column(
													mainAxisAlignment: MainAxisAlignment.start,
													children: [
														const Align(
															alignment: Alignment.centerLeft,
															child:  Text(
															"Login",
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
																fontSize: 33,
																fontWeight: FontWeight.w600
															),
															),
														),

														const Align(
															alignment: Alignment.centerLeft,
															child: Text(
															"Log into your account here",
															textAlign: TextAlign.start,
															style: TextStyle(
																fontSize: 20,
															),
															),
														),

														// Effective margin
														const SizedBox(height: 60),

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
															margin: const EdgeInsets.only(top: 20,  bottom: 20),
															child: TextField(
																cursorColor: Colors.blue,
																controller: _passwordController,
																obscureText: _passwordHidden,
																decoration: InputDecoration(
																	labelText: "Password",
																	hintStyle: const TextStyle(
																		color: Colors.red
																	),
																	hintText: "Required",
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

														Align(
															alignment: Alignment.centerRight,
															child: TextButton(
																onPressed: () {

																},
																style: TextButton.styleFrom(
																	padding: EdgeInsets.zero,
																	tapTargetSize: MaterialTapTargetSize.shrinkWrap,
																	minimumSize: const Size(1, 1),
																	alignment: Alignment.centerLeft
																),
																child: const Text(
																	'Forgot Password',
																	textAlign: TextAlign.start,
																	style: TextStyle(
																		color: Colors.blue,
																		fontSize: 14
																	)
																),
															),
														),

														Align(
															alignment: Alignment.centerLeft,
															child: Row(
																mainAxisAlignment: MainAxisAlignment.start,
																crossAxisAlignment: CrossAxisAlignment.center,
																children: [
																	Checkbox(
																		value: _rememberMe,
																		onChanged: (value) {
																			setState(() {
																			  _rememberMe = value;
																			});
																		}
																	),

																	// Just there as margin.
																	const SizedBox(width: 5),

																	const Text(
																		'Remember Me',
																		textAlign: TextAlign.start,
																		style: TextStyle(
																			color: Colors.blue,
																			fontSize: 14
																		)
																	),
																],
															)
														),

														Align(
															alignment: Alignment.centerLeft,
															child: Container(
																margin: const EdgeInsets.only(top: 40),
																padding: const EdgeInsets.only(top: 15, bottom: 15, left: 50, right: 50),
																decoration: BoxDecoration(
																	borderRadius: BorderRadius.circular(20),
																	color: Colors.blue,
																),
																child: TextButton(
																	onPressed: finishLogin,
																	child: const Text(
																		"Login",
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
															alignment: Alignment.centerLeft,
															child: Row(
																mainAxisAlignment: MainAxisAlignment.start,
																crossAxisAlignment: CrossAxisAlignment.center,
																children: [
																	const Text(
																		"Don't have an account yet?",
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
																			Navigator.of(context).pushNamed("/register");
																		},
																		style: TextButton.styleFrom(
																			padding: EdgeInsets.zero,
																			tapTargetSize: MaterialTapTargetSize.shrinkWrap,
																			minimumSize: const Size(1, 1),
																			alignment: Alignment.centerLeft
																		),
																		
																		child: const Text(
																			'Register',
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
							)
						]
					),
				)
			)
		);
	}
}
