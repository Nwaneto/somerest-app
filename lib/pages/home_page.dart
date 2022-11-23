import 'package:flutter/material.dart';
import 'package:somerest/widgets/book_meeting.dart';
import 'package:somerest/widgets/menu_drawer.dart';
import 'package:somerest/widgets/responsive.dart';
import 'package:somerest/topbar/home.dart';

import 'package:somerest/widgets/footer.dart';
import 'package:somerest/widgets/support_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	final ScrollController _scrollController = ScrollController();
	double _scrollPosition = 0;
	double _opacity = 0;

	_scrollListener() {
		setState(() {
			_scrollPosition = _scrollController.position.pixels;
		});
	}

	Scaffold _scaffold = const Scaffold();

	@override
	void initState() {
		_scrollController.addListener(_scrollListener);
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		_scaffold =  Scaffold(

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
					child: HomeTopBarContents()
				),
			),

			drawer: const MenuDrawer(),

			body: SingleChildScrollView(
				controller: _scrollController,
				physics: const ClampingScrollPhysics(),
				child: Column(
					children: [
					Column(
						children: [
							Container(
								width: screenSize.width,
								height: screenSize.height * 0.7,
								alignment: Alignment.center,
								padding: const EdgeInsets.all(40),
								decoration: const BoxDecoration(
									color: Colors.blueGrey,
									borderRadius: BorderRadius.only(
										bottomLeft: Radius.elliptical(400, 250),
										bottomRight: Radius.elliptical(1500, 400))),
								child: Column(
									
									children: [
								Container(
									margin: EdgeInsets.only(top: screenSize.height * .2),
									child: const Text(
										'Welcome to Somerest Consulting Limited',
										textAlign: TextAlign.center,
										style: TextStyle(
											fontWeight: FontWeight.w400,
											color: Colors.white,
											fontSize: 25),
									)),
								Container(
									margin: const EdgeInsets.only(top: 10),
									width: screenSize.width * 0.5,
									decoration: const BoxDecoration(),
									child: const Text(
									'One of Nigeria’s leading consulting firm. We have been providing solution through the services we offer to our clients for over a decade and more',
									textAlign: TextAlign.center,
									style: TextStyle(color: Colors.white, fontSize: 16),
									),
								)
								]),
							),

							Container(
								margin: const EdgeInsets.only(top: 50),
								child: Column(children: [
									const Text(
									'Somerest Consulting Limited',
									style: TextStyle(
										fontWeight: FontWeight.w900,
										fontSize: 23,
									),
									),
									Container(
										width: 200,
										margin: const EdgeInsets.only(bottom: 10),
										child: const Divider(
										thickness: 3,
										color: Colors.blue,
										)),
									SizedBox(
									width: screenSize.width * 0.9,
									child: const Text(
										"""SOMEREST commenced business operation in the year 2002 as an ICT and project management firm and later expanded business to cover Recruitment/outsourcing, branding and Event Planning services with an emphasis on business supports services consultancy. Over the past years, we have consolidated the business by providing excellent service to our clients.""",
										style: TextStyle(
											fontWeight: FontWeight.w400,
											fontSize: 16,
											wordSpacing: 1),
										textAlign: TextAlign.left,
									),
									),
									Container(
										width: 100,
										margin: EdgeInsets.only(
											top: 5,
											left: ResponsiveWidget.isLargeScreen(context)
												? screenSize.width * 0.80
												: screenSize.width * 0.60,
											right: 30),
										padding: const EdgeInsets.all(5),
										alignment: Alignment.center,
										decoration: BoxDecoration(
											color: Colors.blue,
											borderRadius: BorderRadius.circular(10)),
										child: TextButton(
											onPressed: () {},
											child: const Text(
											'Read More',
											textAlign: TextAlign.center,
											style: TextStyle(color: Colors.white),
											))),
									Container(
										margin: const EdgeInsets.only(top: 50),
										child: const Text(
											'Discover Our Services',
											style: TextStyle(
												fontSize: 20,
												fontWeight: FontWeight.w900
											),
										)),

										const SizedBox(
											width: 100,
											child: Divider(
												thickness: 3,
												color: Colors.blue,
											)
										),

										ResponsiveWidget.isSmallScreen(context) ?

										// For smaller screens. Basically only mobile phones.
										Column(
											mainAxisAlignment: MainAxisAlignment.spaceEvenly,
											children: [
												Container (
													margin: const EdgeInsets.only(top: 40),
													width: screenSize.width*0.9,
													child: Column(
													children: [
														Image.asset(
															"assets/images/image5.png",
															fit: BoxFit.scaleDown,
														),

														const SizedBox(height: 10),

														const Text(
															"What is our mission?",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 23,
																color: Colors.blue
															)
														),

														const Text(
															"SOMEREST seeks to change the perception of the recruitment and support services of businesses in Nigeria by focusing on:\n · Integrity\n · Trust\n · Specialist Expertise\n · Staff Retention",
															style: TextStyle(
																color: Color(0xFF5B5B5B),
															)
														),
													])
												),

												Container (
													margin: const EdgeInsets.only(top: 40),
													width: screenSize.width*0.9,
													child: Column(
													children: [
														Image.asset(
															"assets/images/image1.png",
															fit: BoxFit.scaleDown,
														),

														const SizedBox(height: 5),

														const Text(
															"What is our approach?",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 23,
																color: Colors.blue
															)
														),

														const Text(
															"We ascertain your exact requirements and value system in order to save time and present the right people and resources on time — every time. Therefore, it is imperative to schedule a client visit for the first time per request.",
															style: TextStyle(
																color: Color(0xFF5B5B5B),
															)
														),
													])
												),

												Container(
													margin: const EdgeInsets.only(top: 40),
													width: screenSize.width*0.90,
													child: Column(
													children: [
														Image.asset(
															"assets/images/image14.png",
															fit: BoxFit.scaleDown,
														),

														const SizedBox(height: 10),

														const Text(
															"What is our vision?",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 23,
																color: Colors.blue
															)
														),

														const Text(
															"SOMEREST is determined to be a leading specialist recruitment agency and valuable business support company to our clientele.",
															style: TextStyle(
																color: Color(0xFF5B5B5B),
															)
														),
													])
												),
											]
										)

										:

										// For medium to larger-type screens....
										Row(
											mainAxisAlignment: MainAxisAlignment.spaceEvenly,
											children: [
												SizedBox(
													width: screenSize.width*0.30,
													child: Column(
													children: [
														Image.asset(
															"assets/images/image5.png",
															fit: BoxFit.scaleDown,
														),

														const SizedBox(height: 10),

														const Text(
															"What is our mission?",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 23,
																color: Colors.blue
															)
														),

														const Padding(
															padding: EdgeInsetsDirectional.all(10),
															child: Text(
																"SOMEREST seeks to change the perception of the recruitment and support services of businesses in Nigeria by focusing on:\n · Integrity\n · Trust\n · Specialist Expertise\n · Staff Retention",
																style: TextStyle(
																	color: Color(0xFF5B5B5B),
																)
															)
														),
													])
												),

												SizedBox(
													width: screenSize.width*0.30,
													child: Column(
													children: [
														Image.asset(
															"assets/images/image1.png",
															fit: BoxFit.scaleDown,
														),

														const SizedBox(height: 5),

														const Text(
															"What is our approach?",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 23,
																color: Colors.blue
															)
														),

														const Padding(
															padding: EdgeInsetsDirectional.all(10),
															child: Text(
																"We ascertain your exact requirements and value system in order to save time and present the right people and resources on time — every time. Therefore, it is imperative to schedule a client visit for the first time per request.",
																style: TextStyle(
																	color: Color(0xFF5B5B5B),
																)
															)
														),
													])
												),

												SizedBox(
													width: screenSize.width*0.30,
													child: Column(
													children: [
														Image.asset(
															"assets/images/image14.png",
															fit: BoxFit.scaleDown,
														),

														const SizedBox(height: 10),

														const Text(
															"What is our vision?",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 23,
																color: Colors.blue
															)
														),

														const Padding(
															padding: EdgeInsetsDirectional.all(10),
															child: Text(
																"SOMEREST is determined to be a leading specialist recruitment agency and valuable business support company to our clientele.",
																style: TextStyle(
																	color: Color(0xFF5B5B5B),
																)
															)
														),
													])
												),
											],
										)
									]
								)
							),

							// Let's begin to make the list of testimonies, right?
							Container(
								margin: const EdgeInsets.only(top: 40, bottom: 20),
								padding: const EdgeInsets.all(5),
								child: Column(children: [
									const Text('Testimonies from who we have worked with',
										textAlign: TextAlign.center,
										style: TextStyle(
											fontSize: 20,
											fontWeight: FontWeight.w900,
											color: Colors.blue)),

									// Then we need a row to display the testimonies.
									ResponsiveWidget.isLargeScreen(context)
										?

										// Larger screens
										Row(
											mainAxisSize: MainAxisSize.max,
											mainAxisAlignment: MainAxisAlignment.spaceEvenly,
											children: [
												Container(
													width: screenSize.width / 4.5,
													height: 280,
													padding: const EdgeInsets.only(
														top: 20,
														bottom: 20,
														left: 10,
														right: 10),
													margin: const EdgeInsets.only(top: 30),
													color: Colors.black,
													child: Column(
													children: [
														const Text(
															'   "\nIt is worthy of note that your services so far at Spar-Ilupeju have been quite commendable at interfacing the intern and customers\' relationships.',
															style: TextStyle(
																color: Colors.white,
																fontFamily: 'Quicksand')),
														Container(
															margin: const EdgeInsets.only(
																top: 114, bottom: 5),
															child: const Text(
																'Admin Manager, SPAR NIGERIA (ILUPEJU)',
																textAlign: TextAlign.center,
																style: TextStyle(
																color: Colors.blue,
																))),
														const Text('Mr Sunday',
															style: TextStyle(
																color: Colors.white,
																fontSize: 12))
													],
													)),
												Container(
													width: screenSize.width / 4.5,
													height: 280,
													padding: const EdgeInsets.only(
														top: 20,
														bottom: 20,
														left: 10,
														right: 10),
													margin: const EdgeInsets.only(top: 30),
													color: Colors.black,
													child: Column(
													children: [
														const Text(
															'   "\nIt was a great experience working on Somerest on the branding of my company from start to finish. Excellent customer service, quick response and prompt delivery.',
															style: TextStyle(
																color: Colors.white,
																fontFamily: 'Quicksand')),
														Container(
															margin: const EdgeInsets.only(
																top: 94, bottom: 5),
															child: const Text(
																'Managing Director, AXEL',
																textAlign: TextAlign.center,
																style: TextStyle(
																color: Colors.blue,
																))),
														const Text('Mr Fabian',
															style: TextStyle(
																color: Colors.white,
																fontSize: 12))
													],
													)),
												Container(
													width: screenSize.width / 4.5,
													height: 280,
													padding: const EdgeInsets.only(
														top: 20,
														bottom: 20,
														left: 10,
														right: 10),
													margin: const EdgeInsets.only(top: 30),
													color: Colors.black,
													child: Column(
													children: [
														const Text(
															'   "\nSomerest consulting limited is very professional in their line of work. Great service overall.',
															style: TextStyle(
																color: Colors.white,
																fontFamily: 'Quicksand')),
														Container(
															margin: const EdgeInsets.only(
																top: 129, bottom: 5),
															child: const Text(
																'Managing Director, SPAR NIGERIA',
																textAlign: TextAlign.center,
																style: TextStyle(
																color: Colors.blue,
																))),
														const Text('Olatunde Hakeeb',
															style: TextStyle(
																color: Colors.white,
																fontSize: 12))
													],
													)),
												Container(
													width: screenSize.width / 4.5,
													height: 280,
													padding: const EdgeInsets.only(
														top: 20,
														bottom: 20,
														left: 10,
														right: 10),
													margin: const EdgeInsets.only(top: 30),
													color: Colors.black,
													child: Column(
													children: [
														const Text(
															'   "\nSo incredible! Thanks for your top notch work and attention to detail.',
															style: TextStyle(
																color: Colors.white,
																fontFamily: 'Quicksand')),
														Container(
															margin: const EdgeInsets.only(
																top: 145, bottom: 5),
															child: const Text(
																'Managing Director, SPAR NIGERIA',
																textAlign: TextAlign.center,
																style: TextStyle(
																color: Colors.transparent,
																))),
														const Text('Emilia',
															style: TextStyle(
																color: Colors.white,
																fontSize: 12))
													],
													)),
											])
										:

										// Smaller screens like phones
										Column(children: [
											Row(
												mainAxisSize: MainAxisSize.max,
												mainAxisAlignment:
													MainAxisAlignment.spaceEvenly,
												children: [
												Container(
													width: screenSize.width / 2.3,
													height: 320,
													padding: const EdgeInsets.only(
														top: 20,
														bottom: 20,
														left: 10,
														right: 10),
													margin: const EdgeInsets.only(top: 30),
													color: Colors.black,
													child: Column(
														children: [
														const Text(
															'   "\nIt is worthy of note that your services so far at Spar-Ilupeju have been quite commendable at interfacing the intern and customers\' relationships.',
															style: TextStyle(
																color: Colors.white,
																fontFamily: 'Quicksand')),
														Container(
															margin: const EdgeInsets.only(
																top: 23, bottom: 5),
															child: const Text(
																'Admin Manager,\nSPAR NIGERIA (ILUPEJU)',
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.blue,
																))),
														const Text('Mr Sunday',
															style: TextStyle(
																color: Colors.white,
																fontSize: 12))
														],
													)),
												Container(
													width: screenSize.width / 2.3,
													height: 320,
													padding: const EdgeInsets.only(
														top: 20,
														bottom: 20,
														left: 10,
														right: 10),
													margin: const EdgeInsets.only(top: 30),
													color: Colors.black,
													child: Column(
														children: [
														const Text(
															'   "\nIt was a great experience working on Somerest on the branding of my company from start to finish. Excellent customer service, quick response and prompt delivery.',
															style: TextStyle(
																color: Colors.white,
																fontFamily: 'Quicksand')),
														Container(
															margin: const EdgeInsets.only(
																top: 40, bottom: 5),
															child: const Text(
																'Managing Director,\nAXEL',
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.blue,
																))),
														const Text('Mr Fabian',
															style: TextStyle(
																color: Colors.white,
																fontSize: 12))
														],
													)),
												]),
											Row(
												mainAxisSize: MainAxisSize.max,
												mainAxisAlignment:
													MainAxisAlignment.spaceEvenly,
												children: [
												Container(
													width: screenSize.width / 2.3,
													height: 320,
													padding: const EdgeInsets.only(
														top: 20,
														bottom: 20,
														left: 10,
														right: 10),
													margin: const EdgeInsets.only(top: 10),
													color: Colors.black,
													child: Column(
														children: [
														const Text(
															'   "\nSomerest consulting limited is very professional in their line of work. Great service overall.',
															style: TextStyle(
																color: Colors.white,
																fontFamily: 'Quicksand')),
														Container(
															margin: const EdgeInsets.only(
																top: 92, bottom: 5),
															child: const Text(
																'Managing Director,\nSPAR NIGERIA',
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.blue,
																))),
														const Text('Olatunde Hakeeb',
															style: TextStyle(
																color: Colors.white,
																fontSize: 12))
														],
													)),
												Container(
													width: screenSize.width / 2.3,
													height: 320,
													padding: const EdgeInsets.only(
														top: 20,
														bottom: 20,
														left: 10,
														right: 10),
													margin: const EdgeInsets.only(top: 10),
													color: Colors.black,
													child: Column(
														children: [
														const Text(
															'   "\nSo incredible! Thanks for your top notch work and attention to detail.',
															style: TextStyle(
																color: Colors.white,
																fontFamily: 'Quicksand')),
														Container(
															margin: const EdgeInsets.only(
																top: 130, bottom: 5),
															child: const Text(
																'Managing Director, SPAR NIGERIA',
																textAlign: TextAlign.center,
																style: TextStyle(
																	color: Colors.transparent,
																))),
														const Text('Emilia',
															style: TextStyle(
																color: Colors.white,
																fontSize: 12))
														],
													)),
												])
										]),

									Row(
										mainAxisAlignment: MainAxisAlignment.spaceEvenly,
										mainAxisSize: MainAxisSize.max,
										children: [

										ResponsiveWidget.isLargeScreen(context)
											?

											// For larger screens
											Container(
												margin: const EdgeInsets.only(
													top: 70, bottom: 10),
												child: Row(children: [
													Column(children: [
													SizedBox(
														width: screenSize.width * 0.3,
														child: Image.asset(
															"assets/images/image9.png",
															fit: BoxFit.scaleDown,
														)),
													SizedBox(
														width: screenSize.width * 0.3,
														child: const Text(
														'We are a team that is constantly working to create a better and a longer lasting user experience.',
														textAlign: TextAlign.center,
														style: TextStyle(
															color: Colors.blue,
															fontWeight: FontWeight.w700,
															fontSize: 18),
														),
													)
													]),

													BookMeeting()
												]))
											:

											// For smaller screens
											Column (
												mainAxisAlignment: MainAxisAlignment.start,
												children: [

												Container(
													margin: const EdgeInsets.only(top: 70, bottom: 10),
													height: screenSize.width * 0.9,
													child: Image.asset(
														"assets/images/image9.png",
														fit: BoxFit.scaleDown,
												)),

												SizedBox(
													width: screenSize.width * 0.7,
													child: const Text(
														'We are a team that is constantly working to create a better and a longer lasting user experience.',
														textAlign: TextAlign.center,
														style: TextStyle(
															color: Colors.blue,
															fontWeight: FontWeight.w700),
													)
												),
												BookMeeting()
											]
										)
									])
								])
							),

							// After covering that large amount of content, we move to the column for leaving messages to
							// the support team.
							const SupportMessageWidget(),
						]),

						// Next is the footer of the website.
						const Footer()
				],
			)
			)
		);

		return _scaffold;
	}
}
