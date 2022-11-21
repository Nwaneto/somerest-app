import 'package:flutter/material.dart';
import 'package:somerest/main_page.dart';
import 'package:somerest/menu_drawer.dart';
import 'package:somerest/responsive.dart';
import 'package:somerest/top_bar_contents.dart';

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
				child: const TopBarContents()
			),
			
			),

			drawer: const MenuDrawer(),

			body: SingleChildScrollView(
				controller: _scrollController,
				physics: const ClampingScrollPhysics(),
				child: Column(
					children: [
						const MainPage(),

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
			body.children[0] = page;
		});
	 }
}
