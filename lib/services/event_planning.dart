import 'package:flutter/material.dart';

import 'package:somerest/topbar/base.dart';
import 'package:somerest/widgets/responsive.dart';
import 'package:somerest/widgets/footer.dart';
import 'package:somerest/widgets/menu_drawer.dart';

class EventPlanning extends StatefulWidget {
  const EventPlanning({super.key});

	@override
	 EventPlanningState createState() => EventPlanningState();
}

class EventPlanningState extends State<EventPlanning> {
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
									"Event Planning",
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
								"Planning your upcoming event for your corporation requires the expertise of a seasoned corporate event planer. At Somerest we have the knowledge and experience to insure your success from business meetings to corporate events. We help corporations foster strong relationships with their audiences and employees.",
								textAlign: TextAlign.justify,
								style: TextStyle (
									fontSize: 18
								),
							),
						),


						const Padding(
							padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
							child: Text(
								"Event planning for corporate events requires the full understanding of logistics, entertainment, audio visual, presentations, breakout sessions, social engagement and the marketing leading up to and following up after your corporate event. We'll handle all the logistics associated with corporate event planning for optimal results.",
								textAlign: TextAlign.justify,
								style: TextStyle (
									fontSize: 18
								),
							),
						),


						const Padding(
							padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
							child: Text(
								"Our Scope of services ranges from executing on the program topics designed to resonate with your audience and developing the schedule for presenters ad catering staff. Our corporate event planners are also pros at venue selection. Event marketing is right in our wheel-house from creating an event website to creation of programs including speakers, agenda, social media, venue and registration.",
								textAlign: TextAlign.justify,
								style: TextStyle (
									fontSize: 18
								),
							),
						),

						const Padding(
							padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
							child: Text(
								"Want to shine the spotlight on your new location or drive business to a local branch?",
								textAlign: TextAlign.justify,
								style: TextStyle (
									fontSize: 18,
									wordSpacing: 3,
									fontWeight: FontWeight.w800
								),
							),
						),


						const Padding(
							padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
							child: Text(
								"We can completely transform your parking lot or warehouse with trussing draped with elegant swag curtains and dropdown ceilings.",
								textAlign: TextAlign.justify,
								style: TextStyle (
									fontSize: 18
								),
							),
						),

						const Padding(
							padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
							child: Text(
								"Planning a destination corporate event in any part of Nigeria?",
								textAlign: TextAlign.justify,
								style: TextStyle (
									fontSize: 18,
									wordSpacing: 3,
									fontWeight: FontWeight.w800
								),
							),
						),


						const Padding(
							padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
							child: Text(
								"Our destination management services have partnered with vendors and venues in Lagos, Abuja, Port-Harcourt, and Owerri. We'll handle all the production, catering, party rentals — even transportation and hotel arrangements. If it's on your to-do list, our team would help you check it off.",
								textAlign: TextAlign.justify,
								style: TextStyle (
									fontSize: 18
								),
							),
						),

						Container(
							color: Colors.blue,
							width: screenSize.width,
							padding: const EdgeInsets.all(20),
							margin: const EdgeInsets.only(bottom: 40),
							child: ResponsiveWidget.isSmallScreen(context)

							// For smaller screens like phones.
							?
							Column(
								mainAxisAlignment: MainAxisAlignment.start,
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									Text(
										"WE GOT YOU!",
										style: TextStyle(
											color: Colors.white,
											fontSize: ResponsiveWidget.isSmallScreen(context) ? 36 : 44,
											fontWeight: FontWeight.w800
										),
									),

									const SizedBox(height: 40),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Arrival & Departure Management",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Event Registration",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Graphic Design",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Invitations & Event Flyers",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Digital RSVPs & Event Webpages",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Event Marketing & Branding Services",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Event Security",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Police & Fire Safety",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Event Production",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Event Management",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Food & Beverage Catering",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Entertainment",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Event Design",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Lighting",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white	
												)
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Destination Management",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Audio Visual",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Multi-Media Installations",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Electrical & Power Management",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Venue Scouting & Negotiations",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),

									const SizedBox(height: 10),

									SizedBox(
										width: screenSize.width,
										child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												margin: const EdgeInsets.only(left: 10, right: 5),
												width: 5,
												height: 5,
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.circular(10000)
												),
											),

											const Text(
												"Valet & Parking Management",
												textAlign: TextAlign.start,
												maxLines: 2,
												style: TextStyle(
													fontSize: 16,
													color: Colors.white
													
												),
											)
										]),
									),
								],
							)

							// For PCs, desktops, and tablets.
							: Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: [
											Text(
												"WE GOT YOU!",
												style: TextStyle(
													color: Colors.white,
													fontSize: ResponsiveWidget.isSmallScreen(context) ? 36 : 44,
													fontWeight: FontWeight.w800
												),
											),

											const SizedBox(height: 40),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Arrival & Departure Management",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Event Registration",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Graphic Design",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Invitations & Event Flyers",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Digital RSVPs & Event Webpages",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Event Marketing & Branding Services",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Event Security",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Police & Fire Safety",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),
										],
									),
								
									Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: [
											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Event Production",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Event Management",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Food & Beverage Catering",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Entertainment",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Event Design",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Lighting",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white	
														)
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Destination Management",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Audio Visual",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Multi-Media Installations",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Electrical & Power Management",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Venue Scouting & Negotiations",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 10),

											SizedBox(
												width: screenSize.width * 0.45,
												child: Row(
												crossAxisAlignment: CrossAxisAlignment.center,
												children: [
													Container(
														margin: const EdgeInsets.only(left: 10, right: 5),
														width: 5,
														height: 5,
														decoration: BoxDecoration(
															color: Colors.white,
															borderRadius: BorderRadius.circular(10000)
														),
													),

													const Text(
														"Valet & Parking Management",
														textAlign: TextAlign.start,
														maxLines: 2,
														style: TextStyle(
															fontSize: 16,
															color: Colors.white
															
														),
													)
												]),
											),

											const SizedBox(height: 40),
										],
									)
								],
							)
						),


						// Last of all is the footer of the page.
						const Footer()
					]
				)
			)
		);
	}
}
