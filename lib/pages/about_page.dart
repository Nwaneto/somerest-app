import 'package:somerest/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:somerest/topbar/about.dart';
import 'package:somerest/widgets/support_message.dart';

import 'package:somerest/widgets/footer.dart';
import 'package:somerest/widgets/menu_drawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
	final ScrollController _scrollController = ScrollController();
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
					child: AboutTopBarContents()
				),
			),

			drawer: const MenuDrawer(),

			body: SingleChildScrollView(
				controller: _scrollController,
				physics: const ClampingScrollPhysics(),
				child: Column(
				children: [
					// 
					Container(
						height: screenSize.height * 0.45,
						width: screenSize.width,
						margin: const EdgeInsets.only(bottom: 50),
						decoration: const BoxDecoration(
							color: Color(0xFF051441),
							borderRadius: BorderRadius.only(
								bottomLeft: Radius.elliptical(100, 100),
								bottomRight: Radius.elliptical(100, 100)
							),

						),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Row(
									mainAxisAlignment: MainAxisAlignment.center,
									children: const [
									Text(
										"About Us",
										style: TextStyle(
											fontSize: 57,
											fontWeight: FontWeight.w900,
											color: Colors.white,
										)
									),

									Text(
										".",
										style: TextStyle(
											fontSize: 57,
											fontWeight: FontWeight.w900,
											color: Colors.blue,
										)
									)
								]),


								// Then the prompt like thing at the bottom of the header.
								const Text(
									"Serving you better to create a long lasting user experience",
									textAlign: TextAlign.center,
									style: TextStyle(
										color: Colors.white,
										fontSize: 16
									)
								)
							],
						)
					),

					// Next is the place which contains the company description
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
						Text(
							"Somerest Consulting Limited",
							style: TextStyle(
								fontSize: ResponsiveWidget.isSmallScreen(context) ? 23 : 29,
								fontWeight: FontWeight.w900,
								color: Colors.black,
							)
						),

						Text(
							".",
							style: TextStyle(
								fontSize: ResponsiveWidget.isSmallScreen(context) ? 23 : 29,
								fontWeight: FontWeight.w900,
								color: Colors.red,
							)
						)
					]),

					Container(
						width: screenSize.width * 0.15,
						margin: const EdgeInsets.only(bottom: 10),
						child: const Divider(
							height: 10,
							thickness: 4,
							color: Colors.blue
						),
					),

					SizedBox(
						width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width * 0.9 : screenSize.width * 0.95,
						child: const Text(
							"""
							SOMEREST commenced business operation in the year 2002 as an ICT and project management firm and later expanded to cover recruitment/outsourcing, branding and event planning with an emphasis on business support services consultancy. Over the past years, we have consolidated the business by providing excellent services to our clients.
							At SOMEREST we share ideas, knowledge, and experience to deliver outstanding results to our clients. We also invest heavily in staff training and ensuring our team is equipped with specialist skills necessary to perform to the highest possible standard.
							SOMEREST is committed to providing tailored end-to-end services to its clients resulting in mutually beneficial outcomes without compromising on the overall quality of our services and our partnership with our clients to ensure we understand their goals and guidelines. We hold the requisite licenses required by law to offer our services and management and staffs are qualified to discharge their responsibilities.""",
							style: TextStyle(
								fontSize: 16,
								fontWeight: FontWeight.w700
							)
						),
					),


					// The experience road map.
					Stack(
						children: [
							Container(
							width: screenSize.width,
							height: screenSize.height * 0.635,
							color: const Color(0xFF051441),
							padding: const EdgeInsets.only(top: 30, bottom: 20),
							margin: const EdgeInsets.only(top: 40),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.center,
								children: [
									Text(
										"Our Years of Experience in the Industry",
										textAlign: TextAlign.center,
										style: TextStyle(
											color: Colors.white,
											fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 27,
											fontWeight: FontWeight.w700
										),
									),
	
									// Then the timeline widget
									Container(
										margin: const EdgeInsets.only(top: 30, bottom: 9),
										width: screenSize.width * 0.90,
										child: Row(
											mainAxisAlignment: MainAxisAlignment.spaceBetween,
											children: const [
												Text(
													"Founded",
													style: TextStyle(
														color: Colors.white,
														fontSize: 19
													)
												),
	
												Text(
													"Present",
													style: TextStyle(
														color: Colors.white,
														fontSize: 19,
													)
												),
											]
										),
									),
	
									// For the time ruler...
									SizedBox(
										width: screenSize.width * 0.9,
										child: Stack(
										children: [
											Container(
												margin: const EdgeInsets.only(left: 5, right: 5),
												child: const Divider(
												color: Colors.white,
												thickness: 5,
												),
											),
	
											Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: [
												Container(
													height: 10,
													width: 10,
													margin: const EdgeInsets.only(top: 3),
													decoration: BoxDecoration(
														color: Colors.red,
														borderRadius: BorderRadius.circular(10000)
													),
												),
	
												Container(
													height: 10,
													width: 10,
													margin: const EdgeInsets.only(top: 3),
													decoration: BoxDecoration(
														color: Colors.red,
														borderRadius: BorderRadius.circular(10000)
													),
												),
											]),
	
											Positioned(
												left: screenSize.width *0.35,
												child: Container(
													height: 10,
													width: 10,
													margin: const EdgeInsets.only(top: 3),
													decoration: BoxDecoration(
														color: Colors.red,
														borderRadius: BorderRadius.circular(10000)
													),
												)
											)
										]),
									),
	
									// For the time under the ruler.
									SizedBox(
										width: screenSize.width*0.9,
										child: Stack(children: [
											Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: const [
													Text(
														"2002",
														style: TextStyle(
															color: Colors.red,
															fontSize: 18,
															fontWeight: FontWeight.w700
														),
													),
	
													Text(
														"2022",
														style: TextStyle(
															color: Colors.red,
															fontSize: 18,
															fontWeight: FontWeight.w700
														),
													),
											]),
	
											Positioned(
												left: (screenSize.width *0.35) - 15,
												child: const Text(
														"2010",
														style: TextStyle(
															color: Colors.red,
															fontSize: 18,
															fontWeight: FontWeight.w700
														),
													),
											)
										])
									),
	
									// Next is the CEO's quote.
									Container(
										margin: const EdgeInsets.only(top: 50),
										width: screenSize.width * 0.6,
										child: const Text(
											"\"In the Last 20 years, even despite a lot of challenges that COVID-19 posed to many organizations and Nigeria's economy at large, we at SOMEREST are still able to record many successes viza-vize total staff commitment and dedication towards companies' goals.\"",
											style: TextStyle(
												color: Colors.white,
												fontSize: 14
											),
										)
									)
								])
							),

							ResponsiveWidget.isSmallScreen(context) 
							
							?

							Positioned(child: Container())

							:

							Positioned(
								left: -40,
								top: 320,
								child: Container(
								height: screenSize.height/3,
								width: screenSize.height/3,
								margin: const EdgeInsets.only(top: 3),
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(10000),
									border: Border.all(
										width: 40,
										color: Colors.white
									)
								),
								),
							),

							ResponsiveWidget.isSmallScreen(context)
							// If this is a small screen we do not want to show this at all.
							?

							const SizedBox()
							:

							// Only show this if this is a large screen.
							Positioned(
								left: (screenSize.width - screenSize.height/3) + 40,
								top: 320,
								child: Container(
								height: screenSize.height/3,
								width: screenSize.height/3,
								margin: const EdgeInsets.only(top: 3),
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(10000),
									border: Border.all(
										width: 40,
										color: Colors.white
									)
								),
								),
							),

						]
					),

					// For some reason this page has a support conversation box so... let's put that here too.
					const SupportMessageWidget(),

					// Next is the footer of the website.
					const Footer()
				])
			)
		);
	}
}