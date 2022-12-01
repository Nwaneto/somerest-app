import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:somerest/widgets/responsive.dart';

class UserBar extends StatefulWidget {
	UserBar({
		super.key
	});

	@override
	_UserBarState createState() => _UserBarState();
}

class _UserBarState extends State<UserBar> {
	final List _isHovering = [
		false,
		false,
		false,
		false
	];

	final int page = -1;

	@override
	Widget build(BuildContext context) {
	var screenSize = MediaQuery.of(context).size;

	return Container(
		color: Colors.white.withOpacity(0.5),
		child: Flex (
			mainAxisSize: MainAxisSize.max,
			direction: Axis.vertical,
			children: [
			Expanded(
					child: Row (
					mainAxisAlignment: MainAxisAlignment.start,
					children: [
					SizedBox(width: ResponsiveWidget.isMediumScreen(context) ? screenSize.width/40 : screenSize.width/25),
					// Home page
					Container(
						margin: const EdgeInsets.only(top: 10),
						child: Image.asset (
								"assets/images/logo.png",
								scale: 5,
								fit: BoxFit.scaleDown,
								filterQuality: FilterQuality.high,
							)
					),

					// Home
					const SizedBox(width: 60),
					InkWell(
						onHover: (value) {
						setState(() {
							value
								? _isHovering[0] = true
								: _isHovering[0] = false;
						});
						},
						onTap: () {
							if(page != 0) {
								Navigator.of(context).pushNamed("/");
							}
						},
						child: Column (
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text(
							'HOME',
							style: TextStyle(
								color: _isHovering[0] || page == 0
									? const Color(0xFF077bd7)
									: Colors.grey,
								fontSize: 16
							),
							),
							const SizedBox(height: 5),
							Visibility(
							maintainAnimation: page ==0,
							maintainState: page == 0,
							maintainSize: page == 0,
							visible: _isHovering[0] || page == 0,
							child: Container (
								height: 2,
								width: 20,
								color: const Color(0xFF051441),
							),
							)
						],
						),
					),



					// About Us
					const SizedBox(width: 20),
					InkWell(
						onHover: (value) {
						setState(() {
							value
								? _isHovering[1] = true
								: _isHovering[1] = false;
						});
						},
						onTap: () {
							if(page != 1) {
								Navigator.of(context).pushNamed("/about");
							}
						},
						child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text(
							'ABOUT US',
							style: TextStyle(
								color: _isHovering[1] || page == 1
									? const Color(0xFF077bd7)
									: Colors.grey,
								fontSize: 16
							),
							),
							const SizedBox(height: 5),
							Visibility(
							maintainAnimation: page ==1,
							maintainState: page == 1,
							maintainSize: page == 1,
							visible: _isHovering[1] || page ==1,
							child: Container(
								height: 2,
								width: 20,
								color: const Color(0xFF051441),
							),
							)
						],
						),
					),

					// Services
					const SizedBox(width: 20),
					InkWell(
						onHover: (value) {
						setState(() {
							value
								? _isHovering[2] = true
								: _isHovering[2] = false;
						});
						},
						onTap: () {
							if(page != 2) {
								Navigator.of(context).pushNamed("/services");
							}
						},
						child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text(
							'SERVICES',
							style: TextStyle(
								color: _isHovering[2] || page  == 2
									? const Color(0xFF077bd7)
									: Colors.grey,
								fontSize: 16
							),
							),
							const SizedBox(height: 5),
							Visibility(
							maintainAnimation: page ==2,
							maintainState: page == 2,
							maintainSize: page == 2,
							visible: _isHovering[2] || page == 2,
							child: Container(
								height: 2,
								width: 20,
								color:const Color(0xFF051441),
							),
							)
						],
						),
					),



					// Contact
					const SizedBox(width: 20),
					InkWell(
						onHover: (value) {
						setState(() {
							value
								? _isHovering[3] = true
								: _isHovering[3] = false;
						});
						},
						onTap: () {
							if(page != 3) {
								Navigator.of(context).pushNamed("/contact");
							}
						},
						child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text (
							'CONTACT',
							style: TextStyle(
								color: _isHovering[3] || page == 3
									? const Color(0xFF077bd7)
									: Colors.grey,
								fontSize: 16
							),
							),
							const SizedBox(height: 5),
							Visibility(
							maintainAnimation: page ==1,
							maintainState: page == 1,
							maintainSize: page == 1,
							visible: _isHovering[3] || page == 3,
							child: Container(
								height: 2,
								width: 20,
								color: const Color(0xFF051441),
							),
							)
						],
						),
					),


					// Submit CV
					SizedBox(width: ResponsiveWidget.isLargeScreen(context)?  screenSize.width * 0.20
					: 40),

					// Your notifications
					Container(
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(10000),
							color: const Color(0x55077bd7)
						),
						child: IconButton(
							onPressed: () {
								// Do something...?
							},
							icon: const Icon(CupertinoIcons.bell)
						),
					),

					const SizedBox(width: 20),

					const CircleAvatar(
						backgroundImage: AssetImage("assets/images/facial2.png"),
					)
				]),
				),

			]),

		);
	//);
	}
}
