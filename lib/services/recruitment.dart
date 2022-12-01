import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:somerest/topbar/base.dart';
import 'package:somerest/widgets/book_meeting.dart';
import 'package:somerest/widgets/responsive.dart';
import 'package:somerest/widgets/footer.dart';
import 'package:somerest/widgets/menu_drawer.dart';
import 'package:somerest/widgets/support_message.dart';

class Recruitment extends StatefulWidget {
  const Recruitment({super.key});

	@override
	 RecruitmentState createState() => RecruitmentState();
}

class RecruitmentState extends State<Recruitment> {
	final ScrollController _scrollController = ScrollController();
	final TextEditingController _messageController = TextEditingController();
	final TextEditingController _titleController = TextEditingController();
	final TextEditingController _employeesController = TextEditingController();
	final TextEditingController _workplaceController = TextEditingController();
	final TextEditingController _locationController = TextEditingController();
	final TextEditingController _descriptionController = TextEditingController();

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
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: [
						Container(
							height: screenSize.height * 0.45,
							width: screenSize.width,
							margin: const EdgeInsets.only(bottom: 50),
							decoration: const BoxDecoration(
								color: Color(0xFF051441)
							),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.center,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: [
								Text(
									"Recruitment",
									style: TextStyle(
										fontSize: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
										fontWeight: FontWeight.w900,
										color: Colors.white,
									)
								),

								Text(
									".",
									style: TextStyle(
										fontSize: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
										fontWeight: FontWeight.w900,
										color: Colors.blue,
									)
								)
							])
						),

						const Padding(
						  padding: EdgeInsets.all(10),
						  child: Text(
						  	"If you're looking to fill a vacancy at your company, look no further than SOMEREST. No matter the industry or job title, you get the perfect fit not only at the most affordable rate but also in the shortest time possible. We will listen, learn, get to know your business needs in depth and then tailor the right solution for your organization. We would do so while ensuring you maximize opportunities and minimize risks.",
						  	textAlign: TextAlign.justify,
							style: TextStyle(
						  		fontSize: 18
						  	)
						  ),
						),

						const SizedBox(height: 30),


						const Padding(
						  padding: EdgeInsets.all(10),
						  child: Text(
						  	"Tap into our system to choose our streamlined recruitment process to save yourself money and hassle. Our services cover the following:",
						  	textAlign: TextAlign.justify,
							style: TextStyle(
						  		fontSize: 18
						  	)
						  ),
						),

						const SizedBox(height: 60),

						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 10),
									width: 15,
									height: 15,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Executive Search and Selection",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 18,
										fontWeight: FontWeight.w600
									),
								)
							]
						),

						const SizedBox(height: 10),

						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 10),
									width: 15,
									height: 15,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Graduate & Entry-Level Recruitment",
									style: TextStyle(
										fontSize: 18,
										fontWeight: FontWeight.w600
									),
								)
							]
						),

						const SizedBox(height: 10),

						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 10),
									width: 15,
									height: 15,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Semi-Skilled Workers",
									style: TextStyle(
										fontSize: 18,
										fontWeight: FontWeight.w600
									),
								)
							]
						),

						const Padding(
						  padding: EdgeInsets.only(left: 10, top: 100),
						  child: Text(
						  	"Fill in the details below",
						  	style: TextStyle(
						  		fontSize: 18,
						  		fontWeight: FontWeight.w600
						  	),
						  ),
						),

						Container(
							margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
							width: screenSize.width * 0.9,
							child: TextField(
								maxLines: 4,
								cursorColor: Colors.blue,
								controller: _messageController,
								decoration: const InputDecoration(
									labelText: "About Your Company",
									hintText: "Required",
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


						// Your title as an employee
						Container(
							margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
							width: screenSize.width * 0.9,
							child: TextField(
								maxLines: 1,
								cursorColor: Colors.blue,
								controller: _titleController,
								decoration: const InputDecoration(
									labelText: "Job Title",
									hintText: "Required",
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
							margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
							width: screenSize.width * 0.15,
							child: TextField(
								maxLines: 1,
								cursorColor: Colors.blue,
								controller: _employeesController,
								decoration: const InputDecoration(
									labelText: "Employee Count",
									hintText: "Required",
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

						// Workplace type
						Container(
							margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
							width: screenSize.width * 0.9,
							child: TextField(
								maxLines: 1,
								cursorColor: Colors.blue,
								controller: _workplaceController,
								decoration: const InputDecoration(
									labelText: "Workplace type",
									hintText: "Required",
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


						// Job Location
						Container(
							margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
							width: screenSize.width * 0.9,
							child: TextField(
								maxLines: 1,
								cursorColor: Colors.blue,
								controller: _locationController,
								decoration: const InputDecoration(
									labelText: "Job Location",
									hintText: "Required",
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


						// Description
						Container(
							margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
							width: screenSize.width * 0.9,
							child: TextField(
								maxLines: 4,
								cursorColor: Colors.blue,
								controller: _descriptionController,
								decoration: const InputDecoration(
									labelText: "Description",
									hintText: "Add skill requirements you're looking for in 100-200 words",
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

						const Padding(
						  padding: EdgeInsets.only(left: 10, right: 10, top: 30),
						  child: Text (
						  	"By continuing you agree to Somerest's Terms and Conditions including our policies prohibiting discriminatory posts\n\n Note: This information would be verified for authenticity"
						  ),
						),

						Column(
							crossAxisAlignment: ResponsiveWidget.isSmallScreen(context) ? CrossAxisAlignment.center : CrossAxisAlignment.end,
							children: [
								Container(
									margin: const EdgeInsets.only(top: 30, right: 30, bottom: 50),
									padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
									decoration:  BoxDecoration(
										color: const Color(0xFF077bd7),
										borderRadius: BorderRadius.circular(10)
									),
									child: TextButton (
										onPressed: () {

										},
										child: const Text(
											"Submit",
											style:  TextStyle(
												color: Colors.white,
												fontSize: 18
											),
										)
									),
								),

								// This is followed by a meeting booking request.
								Container(
									margin: EdgeInsets.only(right: ResponsiveWidget.isSmallScreen(context) ? 0 : screenSize.width * 0.64),
									child: BookMeeting()
								),
							]
						),

						// Next it is the ability to message support.
						const SupportMessageWidget(), 

						// Last of all is the footer of the page.
						const Footer()
					]
				)
			)
		);
	}
}
