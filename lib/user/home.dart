import 'package:flutter/material.dart';
import 'package:somerest/logs.dart';
import 'package:somerest/topbar/user.dart';
import 'package:somerest/user/pages/application.dart';
import 'package:somerest/user/pages/dashboard.dart';
import 'package:somerest/user/pages/logout.dart';
import 'package:somerest/user/pages/notifications.dart';
import 'package:somerest/user/pages/preferences.dart';
import 'package:somerest/user/pages/profile.dart';
import 'package:somerest/user/pages/settings.dart';
import 'package:somerest/user/widgets/menu_drawer.dart';
import 'package:somerest/widgets/footer.dart';
import 'package:somerest/widgets/responsive.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

	@override
	 DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
	late Widget current;
	String _name = "Mock Name";
	final LocalStorage _storage = LocalStorage.getInstance();
	final UserDrawer _drawer = UserDrawer();

	double _scrollPosition = 0;
	double _opacity = 0;



	final List selected = [
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false
	];

	int selectedIndex  = 0;

	final ScrollController _scrollController = ScrollController();
	
	_scrollListener() {
		setState(() {
			_scrollPosition = _scrollController.position.pixels;
		});
	}

	Widget switchCurrent(int i) {

		if(i > 6 || i < 0) {
			throw UnimplementedError("No such page with this  index here");
		}

		//Switch to the newly selected page.
		selected[selectedIndex] = false;
		selectedIndex = i;
		selected[i] =  true;

		switch(i) {
			case 1: {
				return UserProfile();
			}

			case 2: {
				return UserApplication();
			}

			case 3: {
				return UserPreferences();
			}

			case 4: {
				return UserSettings();
			}

			case 5: {
				return UserLogout();
			}
			
			case 6: {
				return UserNotifications();
			}

			default: {
				return UserHome();
			}
		}
	}

	void _getData() async {
		String name = await _storage.getString(LocalStorage.KEY_USER_NAME);
		setState(() {
			_name = name;
		});
	}

	@override
	void initState() {
		_scrollController.addListener(_scrollListener);
		super.initState();
		_getData();
		current = switchCurrent(0);
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
					child: const UserBar()
				),
			),

			drawer: Drawer(
				child: Container (
				color: Colors.white,
				child: Padding(

				padding: const EdgeInsets.all(16.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					mainAxisAlignment: MainAxisAlignment.start,
					children: [
						Image.asset("assets/images/facial2.png"),

						// Margin
						const SizedBox(height: 5),

						// Next, the profile name.
						Text(
							_name,
							textAlign: TextAlign.center,
							style: const TextStyle(
								color: Colors.blue,
								fontSize: 15
							) 
						),

						Container(
							margin: const EdgeInsets.only(top: 10),
							padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
							decoration:    BoxDecoration(
								borderRadius: BorderRadius.circular(10),
								color: Colors.blue
							),
							child: TextButton(
								onPressed: () {
									setState(() {
										current = switchCurrent(1);
									});
								},
								child: const Text(
									"My Profile",
									style: TextStyle(
										color: Colors.white,
										fontWeight: FontWeight.w700
									),
								)
							),
						),

						Container(
							height: 50,
							padding: const EdgeInsets.only(left: 5),
							width: screenSize.width,
							margin: const EdgeInsets.only(top: 40),
							decoration: BoxDecoration(
								borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
								color: selected[7] ? Colors.blue :  Colors.transparent
							),
							child: 
							Align(
								alignment: Alignment.centerLeft,
								child: TextButton(
									onPressed: () {
										Navigator.of(context).pushNamed("/");
									},

									child: Text(
										"Go Home",
										textAlign: TextAlign.start,
										style: TextStyle(
											color: selected[7] ? Colors.white :  Colors.blue
										),
									)
								)
							),
						),

						Container(
							height: 50,
							padding: const EdgeInsets.only(left: 5),
							width: screenSize.width,
							decoration: BoxDecoration(
								borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
								color: selected[0] ? Colors.blue :  Colors.transparent
							),
							child: 
							Align(
								alignment: Alignment.centerLeft,
								child: TextButton(
									onPressed: () {
										setState(() {
											current =  switchCurrent(0);
										});
									},

									child: Text(
										"Dashboard",
										textAlign: TextAlign.start,
										style: TextStyle(
											color: selected[0] ? Colors.white :  Colors.blue
										),
									)
								)
							),
						),

						Container(
							height: 50,
							padding: const EdgeInsets.only(left: 5),
							width: screenSize.width,
							decoration: BoxDecoration(
								borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
								color: selected[6] ? Colors.blue :  Colors.transparent
							),
							child: 
							Align(
								alignment: Alignment.centerLeft,
								child: TextButton(
									onPressed: () {
										setState(() {
											current =  switchCurrent(6);
										});
									},

									child: Text(
										"Notifications",
										textAlign: TextAlign.start,
										style: TextStyle(
											color: selected[6] ? Colors.white :  Colors.blue
										),
									)
								)
							),
						),

						Container(
							height: 50,
							padding: const EdgeInsets.only(left: 5),
							width: screenSize.width,
							decoration: BoxDecoration(
								borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
								color: selected[1] ? Colors.blue :  Colors.transparent
							),
							child: 
							Align(
								alignment: Alignment.centerLeft,
								child: TextButton(
									onPressed: () {
										setState(() {
											current =  switchCurrent(1);
										});
									},

									child: Text(
										"Profile",
										textAlign: TextAlign.start,
										style: TextStyle(
											color: selected[1] ? Colors.white :  Colors.blue
										),
									)
								)
							),
						),

						Container(
							height: 50,
							padding: const EdgeInsets.only(left: 5),
							width: screenSize.width,
							decoration: BoxDecoration(
								borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
								color: selected[2] ? Colors.blue :  Colors.transparent
							),
							child: 
							Align(
								alignment: Alignment.centerLeft,
								child: TextButton(
									onPressed: () {
										setState(() {
											current =  switchCurrent(2);
										});
									},

									child: Text(
										"Application",
										textAlign: TextAlign.start,
										style: TextStyle(
											color: selected[2] ? Colors.white :  Colors.blue								),
									)
								)
							),
						),

						Container(
							height: 50,
							padding: const EdgeInsets.only(left: 5),
							width: screenSize.width,
							decoration: BoxDecoration(
								borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
								color: selected[3] ? Colors.blue :  Colors.transparent
							),
							child: 
							Align(
								alignment: Alignment.centerLeft,
								child: TextButton(
									onPressed: () {
										setState(() {
											current =  switchCurrent(3);
										});
									},

									child: Text(
										"Preferences",
										textAlign: TextAlign.start,
										style: TextStyle(
											color: selected[3] ? Colors.white :  Colors.blue
										),
									)
								)
							),
						),

						Container(
							height: 50,
							padding: const EdgeInsets.only(left: 5),
							width: screenSize.width,
							decoration: BoxDecoration(
								borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
								color: selected[4] ? Colors.blue :  Colors.transparent
							),
							child: 
							Align(
								alignment: Alignment.centerLeft,
								child: TextButton(
									onPressed: () {
										setState(() {
											current =  switchCurrent(4);
										});
									},

									child: Text(
										"Settings",
										textAlign: TextAlign.start,
										style: TextStyle(
											color: selected[4] ? Colors.white :  Colors.blue
										),
									)
								)
							),
						),

						Container(
							height: 50,
							padding: const EdgeInsets.only(left: 5),
							width: screenSize.width,
							decoration: BoxDecoration(
								borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
								color: selected[5] ? Colors.blue :  Colors.transparent
							),
							child: 
							Align(
								alignment: Alignment.centerLeft,
								child: TextButton(
									onPressed: () {
										setState(() {
											current =  switchCurrent(5);
										});
									},

									child: Text(
										"Log out",
										textAlign: TextAlign.start,
										style: TextStyle(
											color: selected[5] ? Colors.white :  Colors.blue
										),
									)
								)
							),
						),

						const Expanded(
						child: Align(
							alignment: Alignment.bottomCenter,
							child: Text(
								'Powered By System Works Solutions',
								style: TextStyle(
									color: Colors.blue,
									fontSize: 13,
								),
							),
						),
					)
				]),
				),
			),
			),

			body: SingleChildScrollView(
				controller: _scrollController,
				physics: const ClampingScrollPhysics(),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						!ResponsiveWidget.isSmallScreen(context)

						?

						Row(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								// The first thing we put in this case is a sidebar for this nigga.
								Container(
									width: ResponsiveWidget.isSmallScreen(context) ? null : screenSize.width * 0.18,
									padding: const EdgeInsets.only(top: 40, right: 10),
									color: const Color(0xBB000000),
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											// First the profile image.
											Image.asset("assets/images/facial2.png"),

											// Margin
											const SizedBox(height: 5),

											// Next, the profile name.
											Text(
												_name,
												textAlign: TextAlign.center,
												style: const TextStyle(
													color: Colors.white,
													fontSize: 17
												) 
											),

											Container(
												margin: const EdgeInsets.only(top: 10),
												padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
												decoration:    BoxDecoration(
													borderRadius: BorderRadius.circular(10),
													color: Colors.blue
												),
												child: TextButton(
													onPressed: () {
														setState(() {
															current = switchCurrent(1);
														});
													},
													child: const Text(
														"My Profile",
														style: TextStyle(
															color: Colors.white,
															fontWeight: FontWeight.w700
														),
													)
												),
											),

											Container(
												height: 50,
												padding: const EdgeInsets.only(left: 30),
												width: screenSize.width,
												margin: const EdgeInsets.only(top: 40),
												decoration: BoxDecoration(
													borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
													color: selected[0] ? Colors.blue :  Colors.transparent
												),
												child: 
												Align(
													alignment: Alignment.centerLeft,
													child: TextButton(
														onPressed: () {
															setState(() {
																current =  switchCurrent(0);
															});
														},

														child: const Text(
															"Dashboard",
															textAlign: TextAlign.start,
															style: TextStyle(
																color: Colors.white,
															),
														)
													)
												),
											),

											Container(
												height: 50,
												padding: const EdgeInsets.only(left: 30),
												width: screenSize.width,
												decoration: BoxDecoration(
													borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
													color: selected[1] ? Colors.blue :  Colors.transparent
												),
												child: 
												Align(
													alignment: Alignment.centerLeft,
													child: TextButton(
														onPressed: () {
															setState(() {
																current =  switchCurrent(1);
															});
														},

														child: const Text(
															"Profile",
															textAlign: TextAlign.start,
															style: TextStyle(
																color: Colors.white,
															),
														)
													)
												),
											),

											Container(
												height: 50,
												padding: const EdgeInsets.only(left: 30),
												width: screenSize.width,
												decoration: BoxDecoration(
													borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
													color: selected[2] ? Colors.blue :  Colors.transparent
												),
												child: 
												Align(
													alignment: Alignment.centerLeft,
													child: TextButton(
														onPressed: () {
															setState(() {
																current =  switchCurrent(2);
															});
														},

														child: const Text(
															"Application",
															textAlign: TextAlign.start,
															style: TextStyle(
																color: Colors.white,
															),
														)
													)
												),
											),

											Container(
												height: 50,
												padding: const EdgeInsets.only(left: 30),
												width: screenSize.width,
												decoration: BoxDecoration(
													borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
													color: selected[3] ? Colors.blue :  Colors.transparent
												),
												child: 
												Align(
													alignment: Alignment.centerLeft,
													child: TextButton(
														onPressed: () {
															setState(() {
																current =  switchCurrent(3);
															});
														},

														child: const Text(
															"Preferences",
															textAlign: TextAlign.start,
															style: TextStyle(
																color: Colors.white,
															),
														)
													)
												),
											),

											Container(
												height: 50,
												padding: const EdgeInsets.only(left: 30),
												width: screenSize.width,
												decoration: BoxDecoration(
													borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
													color: selected[4] ? Colors.blue :  Colors.transparent
												),
												child: 
												Align(
													alignment: Alignment.centerLeft,
													child: TextButton(
														onPressed: () {
															setState(() {
																current =  switchCurrent(4);
															});
														},

														child: const Text(
															"Settings",
															textAlign: TextAlign.start,
															style: TextStyle(
																color: Colors.white,
															),
														)
													)
												),
											),

											Container(
												height: 50,
												padding: const EdgeInsets.only(left: 30),
												width: screenSize.width,
												decoration: BoxDecoration(
													borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
													color: selected[5] ? Colors.blue :  Colors.transparent
												),
												child: 
												Align(
													alignment: Alignment.centerLeft,
													child: TextButton(
														onPressed: () {
															setState(() {
																current =  switchCurrent(5);
															});
														},

														child: const Text(
															"Log out",
															textAlign: TextAlign.start,
															style: TextStyle(
																color: Colors.white,
															),
														)
													)
												),
											),

											// The remaining margin.
											const SizedBox(height: 40),

											Padding(
												padding: const EdgeInsets.only(left: 30, bottom: 5),
												child: Row(
													mainAxisAlignment: MainAxisAlignment.start,
													children: const [
														Text(
															"Skills Percentage: ",
															textAlign: TextAlign.start,
															style: TextStyle(
																color: Colors.white,
															fontWeight: FontWeight.w700
															),
														),

														Text(
															"33%",
															textAlign: TextAlign.start,
															style: TextStyle(
																color: Colors.red,
															fontWeight: FontWeight.w700
															),
														),
													],
												),
											),

											const Padding(
												padding: EdgeInsets.only(left: 30),
												child: Text(
													"Update your profile for more boost on your skills",
													style: TextStyle(
														color: Colors.grey,
														fontSize: 10
													)
												),
											),

											Container(
												margin: const EdgeInsets.only(top: 10, bottom: 200),
												alignment: Alignment.centerLeft,
												padding: const EdgeInsets.only(left: 30),
												child: const Text( 
													"Boost your profile",
													textAlign: TextAlign.start,
													style: TextStyle(
														color: Colors.white,

													),
												),
											),
										],
									)
								),


								current
							],
						)
						
						:
						
						Column(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Align(
									alignment: Alignment.topLeft,
									child: current
								)
							]
						),

						// This page has a footer.
						const Footer(),
					]
				)
			)
		);
	}
}
