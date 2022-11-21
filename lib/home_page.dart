import 'package:flutter/material.dart';
import 'package:somerest/main_page.dart';
import 'package:somerest/responsive.dart';

import 'about_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	final ScrollController _scrollController = ScrollController();
	double _scrollPosition = 0;
	double _opacity = 0;
	String _current = "MainPage";


	final List _isHovering = [
		false,
		false,
		false,
		false
	];

	final List _isSelected = [
		false,
		false,
		false,
		false
	];

	int _last = 0;

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
		Widget child = const MainPage();
		_current = "MainPage";
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
				child: 
				// Desktop view
				Flex (
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
								scale: 50,
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
							switchToPage(0);
                            setState(() {});
						},
						child: Column (
						mainAxisSize: MainAxisSize.min,
						children: [
							const SizedBox(height: 10),
							Text(
							key: const GlobalObjectKey("main-navbar-home"),
							'HOME',
							style: TextStyle(
								color: _isHovering[0]
									? const Color(0xFF077bd7)
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
						onTap: () {
							switchToPage(1);
						},
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

		),
			
			),

			drawer: Drawer(
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
			),


		body: SingleChildScrollView(
			controller: _scrollController,
			physics: const ClampingScrollPhysics(),
			child: Column(
				children: [
					child,

					// Next is the footer of the website.
					Container(
						color: Colors.black,
						height: ResponsiveWidget.isSmallScreen(context) ? null : screenSize.height * 0.25,
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
										])
									)
								],
								)

								:
								
								// On smaller screens.						
								Column(
									mainAxisAlignment: MainAxisAlignment.center,
									crossAxisAlignment: CrossAxisAlignment.stretch,
									children: [
										Row(
											children: [
												SizedBox(
													width: screenSize.width * 0.50,
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
													width: screenSize.width * 0.388,
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
												
											],
										),

										Row(
										mainAxisAlignment: MainAxisAlignment.start,
										children: [
											Container(
												alignment: Alignment.topLeft,
												width: screenSize.width * 0.50,
												margin: const EdgeInsets.only(top: 50),
												child: Column(
													crossAxisAlignment: CrossAxisAlignment.start,
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
												width: screenSize.width * 0.20,
												margin: const EdgeInsets.only(left: 20, top: 30),
												child: Column(
													mainAxisAlignment: MainAxisAlignment.start,
													crossAxisAlignment: CrossAxisAlignment.start,
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
										]),

										Container(
										margin: const EdgeInsets.only(top: 50),
										child: Column(
										mainAxisAlignment: MainAxisAlignment.start,
										crossAxisAlignment: CrossAxisAlignment.start,
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
										])
									)
									]
								)),

					Container(
						width: screenSize.width,
						color: Colors.blue,
						padding: const EdgeInsets.only(left: 10,  right: 10, top: 5, bottom: 5),
						child: const Text (
							"Powered By System Works Solutions",
							textAlign: TextAlign.center,

							style: TextStyle(
								color: Colors.white,
								fontSize: 12
							)
						),
					)
				],
			)
			)
		);

		return _scaffold;
	}
	
	 void switchToPage(int i) {
		_isSelected[_last] = false;
		Widget page = const MainPage();


		switch(i) {
			case 0:
			_current = "MainPage";
			page = const MainPage();
			break;

			case 1:{
				_current = "AboutPage";
				page =  const AboutPage();
			}	break;

			case 2: {
				_current = "ServicesPage";
			}	break;

			case 3: {
				_current = "ContactPage";
			}	break;

			default: {
				_current = "${i}Page";
			}	break;
		}

		_isSelected[i] = true;
		_last = i;


		SingleChildScrollView scroller = _scaffold.body as SingleChildScrollView;
		Column body = scroller.child as Column;
		body.children[0] = page;
	
		setState(() {
			
		});
	 }
}
