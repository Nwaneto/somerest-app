import 'package:flutter/material.dart';


import 'package:somerest/topbar/base.dart';
import 'package:somerest/widgets/responsive.dart';
import 'package:somerest/widgets/footer.dart';
import 'package:somerest/widgets/menu_drawer.dart';

class MeetCEO extends StatefulWidget {
  const MeetCEO({super.key});

	@override
	 MeetCEOState createState() => MeetCEOState();
}

class MeetCEOState extends State<MeetCEO> {
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
					children:  [
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
									"Meet The CEO",
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

						!ResponsiveWidget.isSmallScreen(context)

						?

						// After that, we push the banner telling you what kind of man he is to you.
						Column(
							children: [
							Row(
								mainAxisAlignment: MainAxisAlignment.spaceEvenly,
								children: [
									Container(
									margin: const EdgeInsets.only(top: 30),
									child: Container(
										margin: const EdgeInsets.only(bottom: 10),
										width: screenSize.height * 0.33,
										height: screenSize.height * 0.33,
										child: const CircleAvatar(
												backgroundImage: AssetImage("assets/images/image2.png"),
											),
										),
									),

									SizedBox(
										width: screenSize.width * 0.66,
										child: Padding(
										padding: const EdgeInsets.all(10),
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.stretch,
											children: const [
												Text(
													"Oladejo Kola",
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: 48,
														color: Colors.blue
													)
												),

												SizedBox(height: 40),

												Text(
													"Kola Oladejo, the Managing Consultant is a man of principles and action who aims to always give tangible results. Many of his colleagues know him to be a man who sees anything to perfection. As a holder of a Bachelor's degree in Computer Science and a Master's degrees in both Product Management and Business Administration, Kola upholds the basic tenets of project development in order to produce tangible results based on building realistic goals and action plans. Regardless of the tasks, Kola ensures that excellent results are produced.",
													textAlign: TextAlign.justify,
													style: TextStyle(
														fontSize: 17,
														fontWeight: FontWeight.w700
													)
												),
											],
										)
										),
									),
								],
							),
							
							const Padding(
								padding: EdgeInsets.only(left: 20, right: 20),
								child: Text(
									"Kola began his professional career as an IT officer with one of the leading textile firms in Nigeria 1987. Having worked in some other organizations of repute ranging from consulting, project management, and Information and Communication Technology — coupled with his innate endowment to lead, personal traits, credentials, and work ethic — Kola did not find it difficult to grow over the years to establish his own firm in 2002.",
									textAlign: TextAlign.justify,
									style: TextStyle(
										fontSize: 17,
										fontWeight: FontWeight.w700
									)
								),
							),

							const SizedBox(height: 30),

							const Padding(
								padding: EdgeInsets.only(left: 20, right: 20),
								child: Text(
									"He then started to replicate his applied process in his business and withing a period of 24 moths, he had turned around the business to become one of the best consulting and business support firms in the country.",
									textAlign: TextAlign.justify,
									style: TextStyle(
										fontSize: 17,
										fontWeight: FontWeight.w700
									)
								),
							),

							const SizedBox(height: 30),

							const Padding(
								padding: EdgeInsets.only(left: 20, right: 20),
								child: Text(
									"In 2019, when the world was stricken with the Corona Virus pandemic, the country's economy was badly affected which consequently created a chain reaction on his company. Nonetheless, Kola rose above the challenges posed by this situation and equally took advantage to move his firm to the next level. Now, he he no longer just met up with goals, but exceeded them month in and month out. He created seamless processes that were undeniably close to genius.",
									textAlign: TextAlign.justify,
									style: TextStyle(
										fontSize: 17,
										fontWeight: FontWeight.w700
									)
								),
							)]
						)

						: 

						Column(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: [
								Container(
								margin: const EdgeInsets.only(top: 30, bottom: 40),
								child: Container(
									margin: const EdgeInsets.all(10),
									width: screenSize.height * 0.5,
									height: screenSize.height * 0.5,
									child: const CircleAvatar(
											backgroundImage: AssetImage("assets/images/image2.png"),
										),
									),
								),

								SizedBox(
									width: screenSize.width * 0.9,
									child: Padding(
									padding: const EdgeInsets.all(10),
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.stretch,
										children: const [
											Text(
												"Oladejo Kola",
												textAlign: TextAlign.center,
												style: TextStyle(
													fontSize: 48,
													color: Colors.blue
												)
											),

											SizedBox(height: 40),

											Text(
												"Kola Oladejo, the Managing Consultant is a man of principles and action who aims to always give tangible results. Many of his colleagues know him to be a man who sees anything to perfection. As a holder of a Bachelor's degree in Computer Science and a Master's degrees in both Product Management and Business Administration, Kola upholds the basic tenets of project development in order to produce tangible results based on building realistic goals and action plans. Regardless of the tasks, Kola ensures that excellent results are produced.",
												textAlign: TextAlign.justify,
												style: TextStyle(
													fontSize: 17,
													fontWeight: FontWeight.w700
												)
											),


											SizedBox(height: 30),

											Text(
												"Kola began his professional career as an IT officer with one of the leading textile firms in Nigeria 1987. Having worked in some other organizations of repute ranging from consulting, project management, and Information and Communication Technology — coupled with his innate endowment to lead, personal traits, credentials, and work ethic — Kola did not find it difficult to grow over the years to establish his own firm in 2002.",
												textAlign: TextAlign.justify,
												style: TextStyle(
													fontSize: 17,
													fontWeight: FontWeight.w700
												)
											),

											SizedBox(height: 30),

											Text(
												"He then started to replicate his applied process in his business and withing a period of 24 moths, he had turned around the business to become one of the best consulting and business support firms in the country.",
												textAlign: TextAlign.justify,
												style: TextStyle(
													fontSize: 17,
													fontWeight: FontWeight.w700
												)
											),

											SizedBox(height: 30),

											Text(
												"In 2019, when the world was stricken with the Corona Virus pandemic, the country's economy was badly affected which consequently created a chain reaction on his company. Nonetheless, Kola rose above the challenges posed by this situation and equally took advantage to move his firm to the next level. Now, he he no longer just met up with goals, but exceeded them month in and month out. He created seamless processes that were undeniably close to genius.",
												textAlign: TextAlign.justify,
												style: TextStyle(
													fontSize: 17,
													fontWeight: FontWeight.w700
												)
											)
										],
									)
									),
								),
							],
						),


						const SizedBox(height: 90),

						// Next is the footer.
						const Footer()
					]
				)
			)
		);
	}
}
