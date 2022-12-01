import 'package:flutter/material.dart';

class SomerestSidebar extends StatefulWidget {
	@override
	SomerestSidebarState createState() => SomerestSidebarState();
}

class SomerestSidebarState extends State<SomerestSidebar> {
	String _name = "Hello";

	@override
	void initState() {
		super.initState();

		_name = "Christabel Uche";
	}

	@override
	Widget build(BuildContext context) {
	var screenSize = MediaQuery.of(context).size;
		return Container(
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
								Navigator.of(context).pushNamed("/user/profile");
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
						decoration: const BoxDecoration(
							borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
							color: Colors.blue
						),
						child: 
						Align(
							alignment: Alignment.centerLeft,
							child: TextButton(
								onPressed: () {
									Navigator.of(context).pushNamed("/user/home");
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
						decoration: const BoxDecoration(
							borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
							color: Colors.transparent
						),
						child: 
						Align(
							alignment: Alignment.centerLeft,
							child: TextButton(
								onPressed: () {
									Navigator.of(context).pushNamed("/user/profile");
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
						decoration: const BoxDecoration(
							borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
							color: Colors.transparent
						),
						child: 
						Align(
							alignment: Alignment.centerLeft,
							child: TextButton(
								onPressed: () {
									Navigator.of(context).pushNamed("/user/application");
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
						decoration: const BoxDecoration(
							borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
							color: Colors.transparent
						),
						child: 
						Align(
							alignment: Alignment.centerLeft,
							child: TextButton(
								onPressed: () {
									Navigator.of(context).pushNamed("/user/preferences");
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
						decoration: const BoxDecoration(
							borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
							color: Colors.transparent
						),
						child: 
						Align(
							alignment: Alignment.centerLeft,
							child: TextButton(
								onPressed: () {
									Navigator.of(context).pushNamed("/user/settings");
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
						decoration: const BoxDecoration(
							borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
							color: Colors.transparent
						),
						child: 
						Align(
							alignment: Alignment.centerLeft,
							child: TextButton(
								onPressed: () {
									Navigator.of(context).pushNamed("/user/logout");
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
		);
	}
}