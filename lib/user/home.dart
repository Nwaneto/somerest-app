import 'package:flutter/material.dart';
import 'package:somerest/topbar/user.dart';
import 'package:somerest/user/pages/application.dart';
import 'package:somerest/user/pages/dashboard.dart';
import 'package:somerest/user/pages/logout.dart';
import 'package:somerest/user/pages/preferences.dart';
import 'package:somerest/user/pages/profile.dart';
import 'package:somerest/user/pages/settings.dart';
import 'package:somerest/user/widgets/sidebar.dart';
import 'package:somerest/widgets/footer.dart';
import 'package:somerest/widgets/responsive.dart';

import 'package:somerest/widgets/menu_drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

	@override
	 DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
	final ScrollController _scrollController = ScrollController();
	late Widget current;
	String _name = "Hello";

	double _scrollPosition = 0;
	double _opacity = 0;

	final List selected = [
		false,
		false,
		false,
		false,
		false,
		false
	];

	int selectedIndex  = 0;

	_scrollListener() {
		setState(() {
			_scrollPosition = _scrollController.position.pixels;
		});
	}

	Widget switchCurrent(int i) {
		if(i > 5 || i < 0) {
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

			default: {
				return UserHome();
			}
		}
	}

	@override
	void initState() {
		_scrollController.addListener(_scrollListener);
		super.initState();

		current = switchCurrent(0);
		_name = "Christabel Uche";
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
					child: UserBar()
				),
			),

			drawer: const MenuDrawer(),

			body: SingleChildScrollView(
				controller: _scrollController,
				physics: const ClampingScrollPhysics(),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
						!ResponsiveWidget.isSmallScreen(context)

						?

						Row(
							mainAxisAlignment: MainAxisAlignment.start,
							children: [
								// The first thing we put in this case is a sidebar for this nigga.
								Container(
									padding: const EdgeInsets.only(top: 40, right: 10),
									width: screenSize.width * 0.18,
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
						
						Column(),

						// This page has a footer.
						const Footer(),
					]
				)
			)
		);
	}
}
