import 'package:flutter/material.dart';
import 'package:somerest/topbar/base.dart';
import 'package:somerest/widgets/responsive.dart';

import 'package:somerest/widgets/footer.dart';

import 'package:somerest/widgets/menu_drawer.dart';

class RequestMeeting extends StatefulWidget {
  const RequestMeeting({super.key});

	@override
	 RequestMeetingState createState() => RequestMeetingState();
}

class RequestMeetingState extends State<RequestMeeting> {
	final ScrollController _scrollController = ScrollController();
	final TextEditingController _firstNameController = TextEditingController();
	final TextEditingController _lastNameController = TextEditingController();
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _phoneController = TextEditingController();
	final TextEditingController _companyController = TextEditingController();
	final TextEditingController _messageController = TextEditingController();

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
				  scale: 50,
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
					crossAxisAlignment: CrossAxisAlignment.center,
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
									"Request for Meeting",
									style: TextStyle(
										fontSize: ResponsiveWidget.isSmallScreen(context) ? 30 : 50,
										fontWeight: FontWeight.w900,
										color: Colors.white,
									)
								),

								Text(
									".",
									style: TextStyle(
										fontSize: ResponsiveWidget.isSmallScreen(context) ? 30 : 50,
										fontWeight: FontWeight.w900,
										color: Colors.blue,
									)
								)
							])
						),

						// Next is the text that is prompted-ish on the home screen.
						Padding(
							padding: const EdgeInsets.all(8.0),
							child: Text(
								"Let's book you an appointment",
								textAlign: TextAlign.center,
								style: TextStyle(
									fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 30,
									fontWeight: FontWeight.w800
								)
							),
						),

						Padding(
							padding: const EdgeInsets.all(8.0),
							child: Text(
								"We'd love to hear ideas and requirements. Fill out the form below and we would get in touch within 24 hours.",
								textAlign: TextAlign.center,
								style: TextStyle(
									fontSize: ResponsiveWidget.isSmallScreen(context) ? 15 : 18,
								)
							),
						),

						// Next the divider
						SizedBox(
							width: screenSize.width * 0.29,
							child: const Divider(
								thickness: 5,
								color: Colors.blue,
							),
						),

						// Bottom margin for the divider and the actually important stuff
						Container(
							margin: const EdgeInsets.only(top: 50, bottom: 50),
							child: 
							
							ResponsiveWidget.isSmallScreen(context) 
							
							?

							Column (
								mainAxisAlignment: MainAxisAlignment.spaceEvenly,
								children: [
									// Some strange things that are technically pointless.
									Container(
										padding: const EdgeInsets.only(top: 30, bottom: 30),
										width: screenSize.width * 0.90,
										child: Column(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												const Text(
													"Let's help you build a profound solution to your business and help you accomplish your dreams.",
													style: TextStyle(
														fontSize: 17
													)
												),

												Row(
													mainAxisAlignment: MainAxisAlignment.spaceEvenly,
													children: [
														Container(
															width: screenSize.width * 0.40,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Recruitment",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														),

														Container(
															width: screenSize.width * 0.40,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Project Management",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														)
													],
												),

												Row(
													mainAxisAlignment: MainAxisAlignment.spaceEvenly,
													children: [
														Container(
															width: screenSize.width * 0.40,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"ICT",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														),

														Container(
															width: screenSize.width * 0.40,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Event Planning",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														)
													],
												),

												// Margin for this stuff.
												const SizedBox(height: 40),

												// Some unnecessary stuff again.
												const Text(
													"Fill the form",
												),

												// Some necessary looking stuff again.
												const Icon(Icons.arrow_downward),

												// Another box to just use as margin.
												const SizedBox(height: 40),

												const Text(
													"Have you ever had a million-dollar idea for an amazing digital product?",
													style: TextStyle(
														fontSize: 17
													)
												),

												// The second half of it.
												Row(
													mainAxisAlignment: MainAxisAlignment.spaceEvenly,
													children: [
														Container(
															width: screenSize.width * 0.40,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Digital Marketing",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														),

														Container(
															width: screenSize.width * 0.40,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Branding",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														)
													],
												),

												Row(
													mainAxisAlignment: MainAxisAlignment.spaceEvenly,
													children: [
														Container(
															width: screenSize.width * 0.40,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Web Development",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														),

														Container(
															width: screenSize.width * 0.40,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"App Development",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														)
													],
												),

												// Margin for this stuff.
												const SizedBox(height: 40),

												// Some unnecessary stuff again.
												const Text(
													"Fill the form",
												),

												// Some necessary looking stuff again.
												const Icon(Icons.arrow_downward),

												// Margin for this stuff's bottom
												const SizedBox(height: 140),
											],
										),
									),

									// The actual meeting request box.
									Container(
										width: screenSize.width * 0.95,
										padding: const EdgeInsets.all(10),
										decoration: BoxDecoration(
											border: Border.all(
												color: Colors.blue,
												width: 5
											),
											borderRadius: BorderRadius.circular(10),
										),
										child: Column(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.end,
											children:  [
												Container (
													margin: const EdgeInsets.only(top: 40),
													width: screenSize.width * 0.90,
													child: TextField(
														cursorColor: Colors.blue,
														controller: _firstNameController,
														decoration: const InputDecoration(
															labelText: "First Name",
															hintText: "Required",
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

												Container (
													width: screenSize.width * 0.90,
													margin: const EdgeInsets.only(top: 40),
													child: TextField(
														cursorColor: Colors.blue,
														controller: _lastNameController,
														decoration: const InputDecoration(
															labelText: "Last Name",
															hintText: "Required",
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

												Container (
													width: screenSize.width * 0.9,
													margin: const EdgeInsets.only(top: 40),
													child: TextField(
														cursorColor: Colors.blue,
														controller: _phoneController,
														decoration: const InputDecoration(
															labelText: "Phone Number",
															hintText: "Required",
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

												Container (
													width: screenSize.width * 0.90,
													margin: const EdgeInsets.only(top: 40),
													child: TextField(
														cursorColor: Colors.blue,
														controller: _emailController,
														decoration: const InputDecoration(
															labelText: "Email",
															hintText: "Required",
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
													margin: const EdgeInsets.only(top: 40),
													child: TextField(
														cursorColor: Colors.blue,
														controller: _companyController,
														decoration: const InputDecoration(
															labelText: "Company Name",
															hintText: "Required",
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
													margin: const EdgeInsets.only(top: 40),
													child: TextField(
														cursorColor: Colors.blue,
														controller: _messageController,
														maxLines: 15,
														decoration: const InputDecoration(
															labelText: "Reason For Meeting",
															hintText: "Required",
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

												const SizedBox(height: 40),

												Container(
													padding: const EdgeInsets.all(5),
													decoration: BoxDecoration(
														border: Border.all(
															width: 2,
															color: Colors.black
														),
														borderRadius: BorderRadius.circular(15)
													),
													child: TextButton(
														onPressed: () {

														},
														child: const Text(
															"Send a Message",
															style: TextStyle(
																color: Colors.black,
																fontWeight: FontWeight.w700
															),
														)
													),
												),

												const SizedBox(height: 100),
											],
										),
									),
								],
							)
						

							:

							Row(
								mainAxisAlignment: MainAxisAlignment.spaceEvenly,
								children: [
									// Some strange things that are technically pointless.
									Container(
										padding: const EdgeInsets.only(top: 30, bottom: 30),
										width: screenSize.width * 0.45,
										child: Column(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												const Text(
													"Let's help you build a profound solution to your business and help you accomplish your dreams.",
													style: TextStyle(
														fontSize: 17
													)
												),

												Row(
													mainAxisAlignment: MainAxisAlignment.spaceEvenly,
													children: [
														Container(
															width: screenSize.width * 0.18,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Recruitment",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														),

														Container(
															width: screenSize.width * 0.18,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Project Management",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														)
													],
												),

												Row(
													mainAxisAlignment: MainAxisAlignment.spaceEvenly,
													children: [
														Container(
															width: screenSize.width * 0.18,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"ICT",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														),

														Container(
															width: screenSize.width * 0.18,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Event Planning",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														)
													],
												),

												// Margin for this stuff.
												const SizedBox(height: 40),

												// Some unnecessary stuff again.
												const Text(
													"Fill the form",
												),

												// Some necessary looking stuff again.
												const Icon(Icons.arrow_forward),

												// Another box to just use as margin.
												const SizedBox(height: 40),

												const Text(
													"Have you ever had a million-dollar idea for an amazing digital product?",
													style: TextStyle(
														fontSize: 17
													)
												),

												// The second half of it.
												Row(
													mainAxisAlignment: MainAxisAlignment.spaceEvenly,
													children: [
														Container(
															width: screenSize.width * 0.18,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Digital Marketing",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														),

														Container(
															width: screenSize.width * 0.18,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Branding",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														)
													],
												),

												Row(
													mainAxisAlignment: MainAxisAlignment.spaceEvenly,
													children: [
														Container(
															width: screenSize.width * 0.18,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"Web Development",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														),

														Container(
															width: screenSize.width * 0.18,
															padding: const EdgeInsets.all(10),
															margin: const EdgeInsets.only(top: 20),
															decoration: const BoxDecoration(
																color: Colors.blue,
																borderRadius: BorderRadius.all(Radius.circular(10))
															),
															child: const Text(
																"App Development",
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.white,
																),
															),
														)
													],
												),

												// Margin for this stuff.
												const SizedBox(height: 40),

												// Some unnecessary stuff again.
												const Text(
													"Fill the form",
												),

												// Some necessary looking stuff again.
												const Icon(Icons.arrow_forward),

												// Margin for this stuff's bottom
												const SizedBox(height: 140),
											],
										),
									),

									// The actual meeting request box.
									Container(
										width: screenSize.width * 0.45,
										padding: const EdgeInsets.all(10),
										decoration: BoxDecoration(
											border: Border.all(
												color: Colors.blue,
												width: 5
											),
											borderRadius: BorderRadius.circular(10),
										),
										child: Column(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.end,
											children:  [
												Container(
													margin: const EdgeInsets.only(top: 40),
													child: Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: [
															SizedBox(
																width: screenSize.width * 0.21,
																child: TextField(
																	cursorColor: Colors.blue,
																	controller: _firstNameController,
																	decoration: const InputDecoration(
																		labelText: "First Name",
																		hintText: "Required",
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

															SizedBox(
																width: screenSize.width * 0.21,
																child: TextField(
																	cursorColor: Colors.blue,
																	controller: _lastNameController,
																	decoration: const InputDecoration(
																		labelText: "Last Name",
																		hintText: "Required",
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
															)
														],
													)
												),

												Container(
													margin: const EdgeInsets.only(top: 40),
													child: Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: [
															SizedBox(
																width: screenSize.width * 0.21,
																child: TextField(
																	cursorColor: Colors.blue,
																	controller: _phoneController,
																	decoration: const InputDecoration(
																		labelText: "Phone Number",
																		hintText: "Required",
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

															SizedBox(
																width: screenSize.width * 0.21,
																child: TextField(
																	cursorColor: Colors.blue,
																	controller: _emailController,
																	decoration: const InputDecoration(
																		labelText: "Email",
																		hintText: "Required",
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
															)
														],
													)
												),

												Container(
													margin: const EdgeInsets.only(top: 40),
													child: TextField(
														cursorColor: Colors.blue,
														controller: _companyController,
														decoration: const InputDecoration(
															labelText: "Company Name",
															hintText: "Required",
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
													margin: const EdgeInsets.only(top: 40),
													child: TextField(
														cursorColor: Colors.blue,
														controller: _messageController,
														maxLines: 15,
														decoration: const InputDecoration(
															labelText: "Reason For Meeting",
															hintText: "Required",
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

												const SizedBox(height: 40),

												Container(
													padding: const EdgeInsets.all(5),
													decoration: BoxDecoration(
														border: Border.all(
															width: 2,
															color: Colors.black
														),
														borderRadius: BorderRadius.circular(15)
													),
													child: TextButton(
														onPressed: () {

														},
														child: const Text(
															"Send a Message",
															style: TextStyle(
																color: Colors.black,
																fontWeight: FontWeight.w700
															),
														)
													),
												),

												const SizedBox(height: 100),
											],
										),
									),
								],
							),
						
						),

						// Next is the footer of the website.
						const Footer()
					]
				)
			)
		);
	}
}