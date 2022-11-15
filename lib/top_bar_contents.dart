import 'package:flutter/material.dart';
import 'package:somerest/responsive.dart';

class TopBarContents extends StatefulWidget {

  const TopBarContents({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
	false,
	false,
	false,
	false,
	false,
	false,
	false
  ];

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
					SizedBox(width: ResponsiveWidget.isMediumScreen(context) ? screenSize.width/40 : screenSize.width/6),
					// Home page
					Container(
						margin: const EdgeInsets.only(top: 10),
						child: Column(
							children: const [
								Text (
									'Somerest',
									style: TextStyle (
										color: Colors.black,
										fontSize: 20,
										fontFamily: 'Raleway',
										fontWeight: FontWeight.w900,
									),
								),

								Text (
									'CONSULTING LIMITED',
									style: TextStyle (
										color: Colors.black,
										fontSize: 8,
										fontFamily: 'Raleway',
									),
								),
							],
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
						onTap: () {},
						child: Column (
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text(
							'HOME',
							style: TextStyle(
								color: _isHovering[0]
									? Color(0xFF077bd7)
									: Colors.grey,
								fontSize: 16
							),
							),
							const SizedBox(height: 5),
							Visibility(
							maintainAnimation: true,
							maintainState: true,
							maintainSize: true,
							visible: _isHovering[0],
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
						onTap: () {},
						child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text(
							'ABOUT US',
							style: TextStyle(
								color: _isHovering[1]
									? Color(0xFF077bd7)
									: Colors.grey,
								fontSize: 16
							),
							),
							const SizedBox(height: 5),
							Visibility(
							maintainAnimation: true,
							maintainState: true,
							maintainSize: true,
							visible: _isHovering[1],
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
						onTap: () {},
						child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text(
							'SERVICES',
							style: TextStyle(
								color: _isHovering[2]
									? Color(0xFF077bd7)
									: Colors.grey,
								fontSize: 16
							),
							),
							const SizedBox(height: 5),
							Visibility(
							maintainAnimation: true,
							maintainState: true,
							maintainSize: true,
							visible: _isHovering[2],
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
						onTap: () {},
						child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text (
							'CONTACT',
							style: TextStyle(
								color: _isHovering[3]
									? Color(0xFF077bd7)
									: Colors.grey,
								fontSize: 16
							),
							),
							const SizedBox(height: 5),
							Visibility(
							maintainAnimation: true,
							maintainState: true,
							maintainSize: true,
							visible: _isHovering[3],
							child: Container(
								height: 2,
								width: 20,
								color: Color(0xFF051441),
							),
							)
						],
						),
					),


					// Submit CV
					SizedBox(width: ResponsiveWidget.isLargeScreen(context)?  screenSize.width * 0.25
                    : 40),
					Container(
						margin: const EdgeInsets.only(top: 10),
						padding: const EdgeInsets.all(2),
						decoration:  BoxDecoration(
							color: const Color(0xFF077bd7),
							borderRadius: BorderRadius.circular(20)
						),
						child: TextButton (
							onPressed: () {
								var s = "";
							},
							child: const Text(
								"Submit CV",
								style:  TextStyle(
									color: Colors.white,
									fontSize: 12
								),
							)
						),
					),


					// Login
					const SizedBox(width: 10),
					Container(
						margin: const EdgeInsets.only(top: 10),
						padding: const EdgeInsets.all(2),
						decoration:  BoxDecoration(
							color: const Color(0xFF077bd7),
							borderRadius: BorderRadius.circular(20)
						),
						child: TextButton (
							onPressed: () {
								var s = "";
							},
							child: const Text(
								"Login",
								style:  TextStyle(
									color: Colors.white,
									fontSize: 12
								),
							)
						),
					),

						
					// Book a Meeting
					const SizedBox(width: 10),
					Container(
						margin: const EdgeInsets.only(top: 10),
						padding: const EdgeInsets.all(2),
						decoration:  BoxDecoration(
							color: const Color(0xFF077bd7),
							borderRadius: BorderRadius.circular(20)
						),
						child: TextButton (
							onPressed: () {
								var s = "";
							},
							child: const Text(
								"Book A Meeting",
								style:  TextStyle(
									color: Colors.white,
									fontSize: 12
								),
							)
						),
					),
					],
				),
				),

			]),

		);
	//);
	}
}
