import 'package:flutter/material.dart';

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
	false,
	false
  ];

  @override
  Widget build(BuildContext context) {
	var screenSize = MediaQuery.of(context).size;
	return Container(
		color: Colors.white,
		child: Padding(
		  padding: const EdgeInsets.all(20),
		  child:
			  Expanded(
				child: Row(
				  mainAxisAlignment: MainAxisAlignment.start,
				  children: [
					// Home page
					SizedBox(width: screenSize.width/4,),
					const Text(
						'Home',
						style: TextStyle(
						color: Colors.blue,
						fontSize: 18,
						fontFamily: 'Raleway',
						fontWeight: FontWeight.w900,
						letterSpacing: 3,
					  ),
					),



					// About Us
					SizedBox(width: screenSize.width / 15),
					InkWell(
					  onHover: (value) {
						setState(() {
						  value
							  ? _isHovering[0] = true
							  : _isHovering[0] = false;
						});
					  },
					  onTap: () {},
					  child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
						  Text(
							'About Us',
							style: TextStyle(
								color: _isHovering[0]
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
							visible: _isHovering[0],
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
					SizedBox(width: screenSize.width / 15),
					InkWell(
					  onHover: (value) {
						setState(() {
						  value
							  ? _isHovering[0] = true
							  : _isHovering[0] = false;
						});
					  },
					  onTap: () {},
					  child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
						  Text(
							'Services',
							style: TextStyle(
								color: _isHovering[0]
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
							visible: _isHovering[0],
							child: Container(
							  height: 2,
							  width: 20,
							  color: const Color(0xFF051441),
							),
						  )
						],
					  ),
					),



					// Contact
					SizedBox(width: screenSize.width / 15),
					InkWell(
					  onHover: (value) {
						setState(() {
						  value
							  ? _isHovering[0] = true
							  : _isHovering[0] = false;
						});
					  },
					  onTap: () {},
					  child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
						  Text(
							'Contact',
							style: TextStyle(
								color: _isHovering[0]
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
							visible: _isHovering[0],
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
					// TODO: #1 Switch to button
					SizedBox(width: screenSize.width / 15),
					InkWell(
					  onHover: (value) {
						setState(() {
						  value
							  ? _isHovering[0] = true
							  : _isHovering[0] = false;
						});
					  },
					  onTap: () {},
					  child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
						  Text(
							'Submit CV',
							style: TextStyle(
								color: _isHovering[0]
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
							visible: _isHovering[0],
							child: Container(
							  height: 2,
							  width: 20,
							  color: const Color(0xFF051441),
							),
						  )
						],
					  ),
					),


					// Login
					// TODO: #1 Switch to button
					SizedBox(width: screenSize.width / 15),
					InkWell(
					  onHover: (value) {
						setState(() {
						  value
							  ? _isHovering[0] = true
							  : _isHovering[0] = false;
						});
					  },
					  onTap: () {},
					  child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
						  Text(
							'Login',
							style: TextStyle(
								color: _isHovering[0]
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
							visible: _isHovering[0],
							child: Container(
							  height: 2,
							  width: 20,
							  color: const Color(0xFF051441),
							),
						  )
						],
					  ),
					),


					// Book a meeting.
					// TODO: #1 Switch to button
					SizedBox(width: screenSize.width / 15),
					InkWell(
					  onHover: (value) {
						setState(() {
						  value
							  ? _isHovering[0] = true
							  : _isHovering[0] = false;
						});
					  },
					  onTap: () {},
					  child: Column(
						mainAxisSize: MainAxisSize.min,
						children: [
						  Text(
							'Book a meeting',
							style: TextStyle(
								color: _isHovering[0]
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
							visible: _isHovering[0],
							child: Container(
							  height: 2,
							  width: 20,
							  color: const Color(0xFF051441),
							),
						  )
						],
					  ),
					),
				  ],
				),
			  ),

		  ),

	  );
	//);
  }
}
