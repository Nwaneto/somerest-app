import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {

  TopBarContents();

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
					SizedBox(width: screenSize.width/20),
					// Home page
					const Text (
						'Somerest',
						style: TextStyle (
							color: Colors.blue,
							fontSize: 20,
							fontFamily: 'Raleway',
							fontWeight: FontWeight.w900,
						),
					),


					// Home
					const SizedBox(width: 50),
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
							'Home',
							style: TextStyle(
								color: _isHovering[0]
									? Color(0xFF077bd7)
									: Color(0xFF077bd7),
								fontWeight: FontWeight.bold,
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
							'About Us',
							style: TextStyle(
								color: _isHovering[1]
									? const Color(0xFF077bd7)
									: const Color(0xFF077bd7),
								fontWeight: FontWeight.bold,
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
							'Services',
							style: TextStyle(
								color: _isHovering[2]
									? Colors.blue
									: Colors.blue,
								fontWeight: FontWeight.bold,
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
							'Contact',
							style: TextStyle(
								color: _isHovering[3]
									? Colors.blue
									: Colors.blue,
								fontWeight: FontWeight.bold,
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
					// TODO: #1 Switch to button
					const SizedBox(width: 50),
					InkWell(
						onHover: (value) {
						setState(() {
							value
								? _isHovering[4] = true
								: _isHovering[4] = false;
						});
						},
						onTap: () {},
						child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text(
							'Submit a CV',
							style: TextStyle(
								color: _isHovering[4]
									? Colors.blue
									: Colors.blue,
								fontWeight: FontWeight.bold,
								fontSize: 16
							),
							),
							const SizedBox(height: 5),
							Visibility(
							maintainAnimation: true,
							maintainState: true,
							maintainSize: true,
							visible: _isHovering[4],
							child: Container(
								height: 2,
								width: 20,
								color: Color(0xFF051441),
							),
							)
						],
						),
					),


					// Login
					// TODO: #1 Switch to button
					const SizedBox(width: 20),
					InkWell(
						onHover: (value) {
						setState(() {
							value
								? _isHovering[5] = true
								: _isHovering[5] = false;
						});
						},
						onTap: () {},
						child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text(
							'Login',
							style: TextStyle(
								color: _isHovering[5]
									? Colors.blue
									: Colors.blue,
								fontWeight: FontWeight.bold,
								fontSize: 16
							),
							),
							const SizedBox(height: 5),
							Visibility(
							maintainAnimation: true,
							maintainState: true,
							maintainSize: true,
							visible: _isHovering[5],
							child: Container(
								height: 2,
								width: 20,
								color: Color(0xFF051441),
							),
							)
						],
						),
					),


					// Book a meeting.
					// TODO: #1 Switch to button
					const SizedBox(width: 20),
					InkWell(
						onHover: (value) {
						setState(() {
							value
								? _isHovering[6] = true
								: _isHovering[6] = false;
						});
						},
						onTap: () {},
						child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text(
							'Book a meeting',
							style: TextStyle(
								color: _isHovering[6]
									? Colors.blue
									: Colors.blue,
								fontWeight: FontWeight.bold,
								fontSize: 16
							),
							),
							const SizedBox(height: 5),
							Visibility(
							maintainAnimation: true,
							maintainState: true,
							maintainSize: true,
							visible: _isHovering[6],
							child: Container(
								height: 2,
								width: 20,
								color: Color(0xFF051441),
							),
							)
						],
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
