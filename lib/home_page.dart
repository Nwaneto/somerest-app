import 'package:flutter/material.dart';
import 'package:somerest/responsive.dart';
import 'top_bar_contents.dart';

import 'menu_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	final ScrollController _scrollController = ScrollController();
	final TextEditingController _messageController = TextEditingController();
	final TextEditingController _nameController = TextEditingController();
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _subjectController = TextEditingController();
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
			? AppBar(
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
			: PreferredSize(
				preferredSize: Size(screenSize.width, 60),
				child: const TopBarContents(),
			  ),
		drawer: const MenuDrawer(),
		body: SingleChildScrollView(
			controller: _scrollController,
			physics: const ClampingScrollPhysics(),
			child: Column(children: [
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
				child: Column(children: [
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
									Container(
										margin: const EdgeInsets.only(left: 40),
										padding: const EdgeInsets.all(40),
										width: screenSize.width * 0.3,
										color: Colors.blue,
										alignment: Alignment.centerLeft,
										child: Column(
											mainAxisAlignment:
												MainAxisAlignment.start,
											children: [
											  Row(children: [
												Image.asset(
												  "assets/images/facial1.png",
												  scale: 1.4,
												),
												Image.asset(
												  "assets/images/facial2.png",
												  scale: 1.4,
												),
												Image.asset(
												  "assets/images/facial3.png",
												  scale: 1.4,
												)
											  ]),
											  Container(
												margin: const EdgeInsets.only(
													top: 20),
												child: const Text(
												  "Let's book you an appointment",
												  textAlign: TextAlign.left,
												  style: TextStyle(
													  fontSize: 18,
													  color: Colors.white,
													  fontWeight:
														  FontWeight.w700),
												),
											  ),
											  Container(
												margin: const EdgeInsets.only(
													top: 50),
												child: const Text(
												  "We'd love to answer your questions. Tell us your needs and we'll contact you shortly.",
												  textAlign: TextAlign.left,
												  style: TextStyle(
													  color: Colors.white,
													  fontWeight:
														  FontWeight.w500),
												),
											  ),
											  Container(
												margin: const EdgeInsets.only(
													top: 80),
												width: screenSize.width * 0.09,
												decoration: BoxDecoration(
													border: Border.all(
													  color: Colors.white,
													  width: 2,
													),
													borderRadius:
														const BorderRadius.all(
															Radius.circular(
																300))),
												child: TextButton(
													onPressed: () => {},
													child: const Text(
													  'Book a meeting',
													  textAlign:
														  TextAlign.center,
													  style: TextStyle(
														  color: Colors.white,
														  fontSize: 10),
													)),
											  )
											]))
								  ]))
							  :

							  // For smaller screens
							  Column(
								mainAxisAlignment: MainAxisAlignment.start,
								children: [
								  Container(
									  margin: const EdgeInsets.only(
										  top: 70, bottom: 10),
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
									  )),
								  Container(
									  margin: const EdgeInsets.only(top: 40),
									  padding: const EdgeInsets.all(40),
									  width: screenSize.width * 0.9,
									  color: Colors.blue,
									  alignment: Alignment.centerLeft,
									  child: Column(
										  mainAxisAlignment:
											  MainAxisAlignment.start,
										  children: [
											Row(children: [
											  Image.asset(
												"assets/images/facial1.png",
												scale: 1.4,
											  ),
											  Image.asset(
												"assets/images/facial2.png",
												scale: 1.4,
											  ),
											  Image.asset(
												"assets/images/facial3.png",
												scale: 1.4,
											  )
											]),
											Container(
											  margin: const EdgeInsets.only(
												  top: 20),
											  child: const Text(
												"Let's book you an appointment",
												textAlign: TextAlign.left,
												style: TextStyle(
													fontSize: 18,
													color: Colors.white,
													fontWeight:
														FontWeight.w700),
											  ),
											),
											Container(
											  margin: const EdgeInsets.only(
												  top: 50),
											  child: const Text(
												"We'd love to answer your questions. Tell us your needs and we'll contact you shortly.",
												textAlign: TextAlign.left,
												style: TextStyle(
													color: Colors.white,
													fontWeight:
														FontWeight.w500),
											  ),
											),
											Container(
											  margin: EdgeInsets.only(
												  top: 80,
												  left: screenSize.width * 0.4),
											  width: screenSize.width * 0.30,
											  decoration: BoxDecoration(
												  border: Border.all(
													color: Colors.white,
													width: 2,
												  ),
												  borderRadius:
													  const BorderRadius.all(
														  Radius.circular(
															  300))),
											  child: TextButton(
												  onPressed: () => {},
												  child: const Text(
													'Book a meeting',
													textAlign: TextAlign.center,
													style: TextStyle(
														color: Colors.white,
														fontSize: 10),
												  )),
											)
										  ]))
								])
						])
				  ])),

			// After covering that large amount of content, we move to the column for leaving messages to
			// the support team.
			Container(
				margin: const EdgeInsets.only(top: 30, bottom: 30, left: 20,  right: 20),
				width: screenSize.width * 0.95,
				padding: ResponsiveWidget.isSmallScreen(context) ? const EdgeInsets.only(top: 10, bottom: 10, left:  20, right: 20) : const EdgeInsets.only(top: 10, bottom: 10, left:  50, right: 50),
				decoration: BoxDecoration(
					border: Border.all(
						color: Colors.blueGrey,
						width: 2,
					),
					borderRadius: const BorderRadius.all(Radius.circular(10)),
				),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: ResponsiveWidget.isLargeScreen(context)
						? 
						
						[
							const Text("Leave a message",
								textAlign: TextAlign.start,
								style: TextStyle(
									color: Colors.black,
									fontSize: 18,
									fontWeight: FontWeight.w700
								)
							),

							Container(
								margin: const EdgeInsets.only(top: 40),
								child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: [
									SizedBox(
										width: screenSize.width * 0.43,
										child: TextField(
											cursorColor: Colors.blue,
											controller: _nameController,
											decoration: const InputDecoration(
												labelText: "Name",
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
										width: screenSize.width * 0.43,
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


							// The subject field
							Container(
								margin: const EdgeInsets.only(top: 20),
								width: screenSize.width * 0.9,
								child: TextField(
									cursorColor: Colors.blue,
									controller: _subjectController,
									decoration: const InputDecoration(
										labelText: "Subject",
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

							// The Message Body
							Container(
								margin: const EdgeInsets.only(top: 20),
								height: screenSize.height * 0.25,
								width: screenSize.width * 0.9,
								child: TextField(
									maxLines: 12,
									cursorColor: Colors.blue,
									controller: _messageController,
									decoration: const InputDecoration(
										labelText: "Your Message",
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
								padding: const EdgeInsets.all(10),
								margin: const EdgeInsets.only(top: 30),
								decoration: const BoxDecoration(
									color: Colors.blue,
									borderRadius: BorderRadius.all(Radius.circular(10))
								),
								child: TextButton(
									onPressed: () {
										var name = _nameController.text;
										var email = _emailController.text;
										var subject = _subjectController.text;
										var message = _messageController.text;

										// After everything, reorder the state of the widget
										setState(() {
											_nameController.text = "";
											_emailController.text = "";
											_subjectController.text = "";
											_messageController.text = "";
										});
									},
							
									child: const Text(
										"Submit",
										textAlign: TextAlign.start,
										style: TextStyle(
											fontSize: 18,
											color: Colors.white
										)
									)
								),
							)
						]

						// For smaller screens
						: [
							const Text("Leave a message",
								textAlign: TextAlign.start,
								style: TextStyle(
									color: Colors.black,
									fontSize: 18,
									fontWeight: FontWeight.w700
								)
							),
							
							Container (
								margin: const EdgeInsets.only(top: 30),
								width: screenSize.width * 0.9,
								child: TextField(
									cursorColor: Colors.blue,
									controller: _nameController,
									decoration: const InputDecoration(
										labelText: "Name",
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
								margin: const EdgeInsets.only(top: 15),
								width: screenSize.width * 1,
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
								margin: const EdgeInsets.only(top: 15),
								width: screenSize.width * 0.9,
								child: TextField(
									cursorColor: Colors.blue,
									controller: _subjectController,
									decoration: const InputDecoration(
										labelText: "Subject",
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

							// The Message Body
							Container(
								margin: const EdgeInsets.only(top: 15),
								height: screenSize.height * 0.25,
								width: screenSize.width * 0.9,
								child: TextField(
									maxLines: 12,
									cursorColor: Colors.blue,
									controller: _messageController,
									decoration: const InputDecoration(
										labelText: "Your Message",
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
								padding: const EdgeInsets.all(10),
								margin: const EdgeInsets.only(top: 30),
								decoration: const BoxDecoration(
									color: Colors.blue,
									borderRadius: BorderRadius.all(Radius.circular(10))
								),
								child: TextButton(
									onPressed: () {
										var name = _nameController.text;
										var email = _emailController.text;
										var subject = _subjectController.text;
										var message = _messageController.text;

										// After everything, reorder the state of the widget
										setState(() {
											_nameController.text = "";
											_emailController.text = "";
											_subjectController.text = "";
											_messageController.text = "";
										});
									},
							
									child: const Text(
										"Submit",
										textAlign: TextAlign.start,
										style: TextStyle(
											fontSize: 18,
											color: Colors.white
										)
									)
								),
							)
						],
				)),

			// Next is the footer of the website.
			Container(
				  color: Colors.black,
				  height: screenSize.height * 0.25,
				  padding: const EdgeInsets.all(10),
				  child: !ResponsiveWidget.isSmallScreen(context)

					  // On larger screens...
					  ? Row(
						  mainAxisAlignment: MainAxisAlignment.center,
						  crossAxisAlignment: CrossAxisAlignment.stretch,
						  children: [
							SizedBox(
								width: screenSize.width * 0.25,
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.stretch,
									mainAxisAlignment: MainAxisAlignment.start,
									children: [
									Container(
										margin:const EdgeInsets.only(bottom: 10),
										child: const Text(
											"Somerest Consulting Limited",
											style: TextStyle(
											  color: Colors.white,
											  fontWeight: FontWeight.w900,
											)
										)
									),
									
									const Text(
										'WW28 Entrance 3, Tafawa Balewa Square complex, Lagos Island, Lagos State, Nigera.',
										style: TextStyle(
											color: Colors.white,
											fontSize: 13
										)
									),
									
									const Text('contact@somerest.com.ng',
										style: TextStyle(
											color: Colors.white,
											fontSize: 13
										)
									),
									
									const Text(
										'Somerest Consulting Services Nigeria Limited © 2022',
										style: TextStyle(
											color: Colors.white,
											fontSize: 13
										)
									),
								  ],
								)),
							Container(
								alignment: Alignment.centerLeft,
								width: screenSize.width * 0.25,
								margin: const EdgeInsets.only(left: 20),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.stretch,
									mainAxisAlignment: MainAxisAlignment.start,
									children: [
									Container(
										margin:
											const EdgeInsets.only(bottom: 10),
										child: const Text("Services",
											style: TextStyle(
												color: Colors.white,
												fontWeight: FontWeight.w900,
											)
										)
									),

									const Text('Recruitment',
										style: TextStyle(
											color: Colors.white,
											fontSize: 13
										)
									),

									const Text('Project Management',
										style: TextStyle (
											color: Colors.white,
											fontSize: 13
										)
									),

									const Text('ICT',
										style: TextStyle(
											color: Colors.white,
											fontSize: 13
										)
									),

									const Text(
										'Background Check and Verification',
										style: TextStyle(
											color: Colors.white,
											fontSize: 13
										)
									),

									const Text('Branding & Digital Services',
										style: TextStyle(
											color: Colors.white,
											fontSize: 13
										)
									),

									const Text('Event Planning',
										style: TextStyle(
											color: Colors.white,
											fontSize: 13
										)
									),
								],
							)),
							Column(
							  mainAxisAlignment: MainAxisAlignment.start,
							  children: [
								Row(
								  mainAxisAlignment: MainAxisAlignment.start,
								  children: [
									Container(
										alignment: Alignment.topLeft,
										width: screenSize.width * 0.1,
										margin: const EdgeInsets.only(left: 20),
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.stretch,
											children: [
											Container(
												margin: const EdgeInsets.only(bottom: 10),
												child: const Text("Company",
												style: TextStyle(
													color: Colors.white,
													fontWeight: FontWeight.w900,
												)
											)
										),
										
										const Text('About',
											style: TextStyle(
												color: Colors.white,
												fontSize: 13
											)
										),
										
										const Text('Services',
											style: TextStyle(
												color: Colors.white,
												fontSize: 13
											)
										),
										
										const Text('Find a Job',
											style: TextStyle(
												color: Colors.white,
												fontSize: 13
											)
										)
										])),
									Container(
										width: screenSize.width * 0.10,
										margin: const EdgeInsets.only(left: 20),
										child: Column(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.stretch,
											children: [
											  Container(
												  margin: const EdgeInsets.only(
													  bottom: 20),
												  child: const Text("Support",
													  style: TextStyle(
														color: Colors.white,
														fontWeight:
															FontWeight.w900,
													  ))),
											  const Text('Contact Us',
												  style: TextStyle(
													  color: Colors.white,
													  fontSize: 13
													)),
											])),
								  ],
								)
							  ],
							),
							Container(
								margin: const EdgeInsets.only(left: 20),
								child: Column(
								  mainAxisAlignment: MainAxisAlignment.start,
								  children: [
									const Text(
									  'Get to know us better',
									  style: TextStyle(
										  color: Colors.white,
										  fontWeight: FontWeight.w900),
									),
									Row(children: const [
									//   IconButton(
									//       onPressed: () {},
									//       icon: Image.asset(""))
									])
								  ],
								))
						  ],
						)

					  // On smaller screens.
						: Column())
					]
				)
			)
		);
	}
}
