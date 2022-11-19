import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
	Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
	var screenSize = MediaQuery.of(context).size;

	return Drawer(
	  child: Container (
		color: Colors.white,
		child: Padding(

		  padding: const EdgeInsets.all(16.0),
		  child: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			mainAxisAlignment: MainAxisAlignment.start,
			children: [
				// Home
				InkWell(
				onTap: () {},
				child: const Text(
					'Home',
					style: TextStyle(color: Color(0xFF077bd7), fontSize: 18),
				),
				),
				Padding(
				padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
				child: Divider(
					color: Colors.blueGrey.shade400,
					thickness: 2,
				),
				),


				// About Us
				InkWell(
				onTap: () {},
				child: const Text(
					'About Us',
					style: TextStyle(color: Color(0xFF077bd7), fontSize: 18),
				),
				),
				Padding(
				padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
				child: Divider(
					color: Colors.blueGrey.shade400,
					thickness: 2,
				),
				),


				// Services
				InkWell(
				onTap: () {},
				child: const Text(
					'Services',
					style:  TextStyle(color: Color(0xFF077bd7), fontSize: 18),
				),
				),
				Padding(
				padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
				child: Divider(
					color: Colors.blueGrey.shade400,
					thickness: 2,
				),
				),


				// Contact 
				InkWell(
				onTap: () {},
				child: const Text(
					'Contact',
					style:  TextStyle(color: Color(0xFF077bd7), fontSize: 18),
				),
				),
				const Padding(
				padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
				child: Divider(
					color: Colors.transparent,
					thickness: 2,
				),
				),



				// Submit your CV
				Container(
					padding: const EdgeInsets.all(5),
					width: screenSize.width * 0.9,
					decoration:  BoxDecoration(
						color: const Color(0xFF077bd7),
						borderRadius: BorderRadius.circular(10)
					),
					child: TextButton (
						onPressed: () {
							var s = "";
						},
						child: const Text(
							"Submit CV",
							style:  TextStyle(
								color: Colors.white,
								fontSize: 18
							),
						)
					),
				),


				// Login button
				Container(
					margin: const EdgeInsets.only(top: 10),
					width: screenSize.width * 0.9,
					padding: const EdgeInsets.all(5),
					decoration:  BoxDecoration(
						color: const Color(0xFF077bd7),
						borderRadius: BorderRadius.circular(10)
					),
					child: TextButton (
						onPressed: () {
							var s = "";
						},
						child: const Text(
							"Login",
							style:  TextStyle(
								color: Colors.white,
								fontSize: 18
							),
						)
					),
				),


				// Book a Meeting
				Container(
					margin: const EdgeInsets.only(top: 10),
					width: screenSize.width * 0.9,
					padding: const EdgeInsets.all(5),
					decoration:  BoxDecoration(
						color: const Color(0xFF077bd7),
						borderRadius: BorderRadius.circular(10)
					),
					child: TextButton (
						onPressed: () {
							var s = "";
						},
						child: const Text(
							"Book A Meeting",
							style:  TextStyle(
								color: Colors.white,
								fontSize: 18
							),
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
					  fontSize: 14,
					),
				  ),
				),
			  )
			],
		  ),
		),
	  ),
	);
  }
}
