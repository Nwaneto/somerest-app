import 'package:flutter/material.dart';

import 'package:somerest/topbar/base.dart';
import 'package:somerest/widgets/book_meeting.dart';
import 'package:somerest/widgets/responsive.dart';
import 'package:somerest/widgets/footer.dart';
import 'package:somerest/widgets/menu_drawer.dart';
import 'package:somerest/widgets/support_message.dart';

class Branding extends StatefulWidget {
  const Branding({super.key});

	@override
	 BrandingState createState() => BrandingState();
}

class BrandingState extends State<Branding> {
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
									"Branding",
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
							padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
							child: Text(
								"We provide a variety of brand and business growth opportunities such  as Digital Marketing, Branding and Design, Web and Application Development, SEO, Growth Marketing, Social Media, Digital Advertising and Digital Marketing Strategy Consulting. Any product, no matter how good, with bad publicity would soon exit the market. This is why we dedicate resources to developing digital marketing strategies for our clients to create and control favourable conversation around the brand.",
								textAlign: TextAlign.justify,
								style: TextStyle (
									fontSize: 18
								),
							),
						),

						ResponsiveWidget.isSmallScreen(context)

						?

						Column(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: [
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceEvenly,
									children: [
										Container(
											width: screenSize.width * 0.44,
											height: screenSize.width * 0.44 ,
											decoration: const BoxDecoration(
												color: Colors.blue
											),
											alignment: Alignment.center,
											child: const Text(
												"Digital Marketing",
												textAlign: TextAlign.center,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
												)
											),
										),

										Container(
											width: screenSize.width * 0.44,
											height: screenSize.width * 0.44 ,
											decoration: const BoxDecoration(
												color: Colors.blue
											),
											alignment: Alignment.center,
											child: const Text(
												"Branding & Design",
												textAlign: TextAlign.center,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
												)
											),
										),
									],
								),

								const SizedBox(height: 15),

								Row(
									mainAxisAlignment: MainAxisAlignment.spaceEvenly,
									children: [
										Container(
											width: screenSize.width * 0.44,
											height: screenSize.width * 0.44 ,
											decoration: const BoxDecoration(
												color: Colors.blue
											),
											alignment: Alignment.center,
											child: const Text(
												"Web Development",
												textAlign: TextAlign.center,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
												)
											),
										),

										Container(
											width: screenSize.width * 0.44,
											height: screenSize.width * 0.44 ,
											decoration: const BoxDecoration(
												color: Colors.blue
											),
											alignment: Alignment.center,
											child: const Text(
												"App Development",
												textAlign: TextAlign.center,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
												)
											),
										),
									],
								)
							],
						)

						:

						Row(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: [
								Container(
									width: screenSize.width * 0.13,
									height: screenSize.width * 0.13 ,
									decoration: const BoxDecoration(
										color: Colors.blue
									),
									alignment: Alignment.center,
									child: const Text(
										"Digital Marketing",
										textAlign: TextAlign.center,
										style: TextStyle(
											fontSize: 17,
											color: Colors.white
										)
									),
								),


								Container(
									width: screenSize.width * 0.13,
									height: screenSize.width * 0.13 ,
									decoration: const BoxDecoration(
										color: Colors.blue
									),
									alignment: Alignment.center,
									child: const Text(
										"Branding & Design",
										textAlign: TextAlign.center,
										style: TextStyle(
											fontSize: 17,
											color: Colors.white
										)
									),
								),


								Container(
									width: screenSize.width * 0.13,
									height: screenSize.width * 0.13 ,
									decoration: const BoxDecoration(
										color: Colors.blue
									),
									alignment: Alignment.center,
									child: const Text(
										"Web Development",
										textAlign: TextAlign.center,
										style: TextStyle(
											color: Colors.white,
											fontSize: 17,
										)
									),
								),


								Container(
									width: screenSize.width * 0.13,
									height: screenSize.width * 0.13 ,
									decoration: const BoxDecoration(
										color: Colors.blue
									),
									alignment: Alignment.center,
									child: const Text(
										"App Development",
										textAlign: TextAlign.center,
										style: TextStyle(
											fontSize: 17,
											color: Colors.white
										)
									),
								),
							],
						),

						Padding(
							padding: EdgeInsets.only(left: 20, right: 20, bottom: ResponsiveWidget.isSmallScreen(context) ? 20 : 70, top: 40),
							child: const Text(
								"Digital marketing allows businesses like yours to promote their products and/or services online and get their fair share of limelight. With the right digital marketing strategies, even a small or medium-sized business can get tons of traffic to their website and convert a sizable chunk of traffic into sales.",
								textAlign: TextAlign.justify,
								style: TextStyle (
									fontSize: 18
								),
							),
						),

						Container(
							margin: EdgeInsets.only(right: ResponsiveWidget.isSmallScreen(context) ? 0 : screenSize.width * 0.64),
							child: BookMeeting()
						),

						const SupportMessageWidget(),

						// Last of all is the footer of the page.
						const Footer()
					]
				)
			)
		);
	}
}
