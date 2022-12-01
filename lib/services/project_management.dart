import 'package:flutter/material.dart';

import 'package:somerest/topbar/base.dart';
import 'package:somerest/widgets/book_meeting.dart';
import 'package:somerest/widgets/responsive.dart';
import 'package:somerest/widgets/footer.dart';
import 'package:somerest/widgets/menu_drawer.dart';
import 'package:somerest/widgets/support_message.dart';

class ProjectManagement extends StatefulWidget {
  const ProjectManagement({super.key});

	@override
	 ProjectManagementState createState() => ProjectManagementState();
}

class ProjectManagementState extends State<ProjectManagement> {
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
									"Project Management",
									style: TextStyle(
										fontSize: ResponsiveWidget.isSmallScreen(context) ? 32 : 50,
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

						const SizedBox(height: 80),

						Padding(
							padding: const EdgeInsets.only(left: 10, right: 10),
							child: Text(
								"Managing built environment projects is the flagship product of our firm. Our services in this area are targeted at clients who need to develop their own properties and infrastructures. We assist such clients through all the project delivery stages from concept to commissioning and occupation.",
								textAlign: ResponsiveWidget.isSmallScreen(context) ? TextAlign.justify : TextAlign.start,
								style: const TextStyle (
									fontSize: 17
								),
							),
						),

						// Time to start writing the major services they offer..
						const Padding(
							padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
							child: Text(
								"Our major services offered are:",
								textAlign: TextAlign.left,
								style: TextStyle (
									fontSize: 17,
									fontWeight: FontWeight.w700
								),
							),
						),

						// Now... the services.
						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 5),
									width: 8,
									height: 8,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Project brief preparation",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]
						),


						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 5),
									width: 8,
									height: 8,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Project scope",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]
						),


						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 5),
									width: 8,
									height: 8,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Cost & quality planning",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]
						),


						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 5),
									width: 8,
									height: 8,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Selection of consultants",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]
						),


						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 5),
									width: 8,
									height: 8,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								SizedBox(
									width: screenSize.width -23,
										child: const Text(
										"Management & coordination of design preparation",
										textAlign: TextAlign.start,
										style: TextStyle(
											fontSize: 16,
										),
									),
								)
							]
						),


						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 5),
									width: 8,
									height: 8,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Statutory planning approvals.",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]
						),


						SizedBox(
							width: screenSize.width,
							child: Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 5),
									width: 8,
									height: 8,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Selection of contractors & sub-contractors",
									textAlign: TextAlign.start,
									maxLines: 2,
									style: TextStyle(
										fontSize: 16,
										
									),
								)
							]),
						),


						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 5),
									width: 8,
									height: 8,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Contract administration",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]
						),


						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 5),
									width: 8,
									height: 8,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Construction supervision",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]
						),


						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 5),
									width: 8,
									height: 8,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Project commissioning",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]
						),


						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(left: 10, right: 5),
									width: 8,
									height: 8,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Defects liability period management",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]
						),


						// After all the services.
						Padding(
							padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
							child: Text(
								"We are able to get involved with projects at any stage of the development, be it at the inception, conception, design, or construction stage — or indeed if the project gets troublesome.",
								textAlign: ResponsiveWidget.isSmallScreen(context) ? TextAlign.justify : TextAlign.start,
								style: const TextStyle (
									fontSize: 18,
								),
							),
						),

						Container (
							padding: const EdgeInsets.only(top: 30, bottom: 20),
							margin: const EdgeInsets.only(top: 50, bottom: 50),
							decoration: const BoxDecoration(
								color: Color(0xFF051441),
							),
							child: Column(
								mainAxisAlignment: MainAxisAlignment.start,
								crossAxisAlignment: CrossAxisAlignment.stretch,
								children: [
									const Padding(
									  padding: EdgeInsets.only(left: 20, bottom: 10),
									  child:  Text(
									  	"What our clients get",
									  	style: TextStyle(
									  		color: Colors.white,
									  		fontSize: 19
									  	),
									  ),
									),

									const SizedBox(height: 15),

									ResponsiveWidget.isSmallScreen(context)

									?

									// This is for mobile phones.
									Column (
										mainAxisAlignment: MainAxisAlignment.spaceEvenly,
										children: [
											Container(
												width: screenSize.width * 0.7,
												height: screenSize.width * 0.7,
												margin: const EdgeInsets.only(bottom: 20),
												padding: const EdgeInsets.all(10),
												decoration: BoxDecoration(
													color: Colors.blue,
													borderRadius: BorderRadius.circular(1000000),
													border: Border.all(
														color: Colors.blueGrey
													)
												),

												child: Column(
													mainAxisAlignment: MainAxisAlignment.center,
													children: const [
														Text(
															"Satisfaction",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 19
															),
														),

														SizedBox(height: 20),

														Text(
															"We access the needs of our clients and execute 100% as desired.",
															textAlign: TextAlign.center,
															style: TextStyle(
																color: Colors.white,
																fontSize: 17
															),
														),
													],
												)
											),

											Container(
												width: screenSize.width * 0.7,
												height: screenSize.width * 0.7,
												margin: const EdgeInsets.only(bottom: 20),
												padding: const EdgeInsets.all(10),
												decoration: BoxDecoration(
													color: Colors.blue,
													borderRadius: BorderRadius.circular(1000000),
													border: Border.all(
														color: Colors.blueGrey
													)
												),

												child: Column(
													mainAxisAlignment: MainAxisAlignment.center,
													children: const [
														Text(
															"Time",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 19
															),
														),

														SizedBox(height: 20),

														Text(
															"Time is essential and of great value. Prompt delivery is our goal.",
															textAlign: TextAlign.center,
															style: TextStyle(
																fontSize: 17,
																color: Colors.white
															),
														),
													],
												)
											),

											Container(
												width: screenSize.width * 0.7,
												height: screenSize.width * 0.7,
												margin: const EdgeInsets.only(bottom: 20),
												padding: const EdgeInsets.all(10),
												decoration: BoxDecoration(
													color: Colors.blue,
													borderRadius: BorderRadius.circular(1000000),
													border: Border.all(
														color: Colors.blueGrey
													)
												),

												child: Column(
													mainAxisAlignment: MainAxisAlignment.center,
													children: const [
														Text(
															"Quality",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 19
															),
														),

														SizedBox(height: 20),

														Text(
															"Acquiring inferior materials can cost the most. With us, there is heavy emphasis on quality assurance from start to finish.",
															textAlign: TextAlign.center,
															style: TextStyle(
																fontSize: 17,
																color: Colors.white
															),
														),
													],
												)
											),
										],
									)

									// This is for desktops and laptops.
									:
									
									Row (
										mainAxisAlignment: MainAxisAlignment.spaceEvenly,
										children: [
											Container(
												width: screenSize.width * 0.22,
												height: screenSize.width * 0.22,
												margin: const EdgeInsets.only(bottom: 20),
												padding: const EdgeInsets.all(10),
												decoration: BoxDecoration(
													color: Colors.blue,
													borderRadius: BorderRadius.circular(1000000),
													border: Border.all(
														color: Colors.blueGrey
													)
												),

												child: Column(
													mainAxisAlignment: MainAxisAlignment.center,
													children: const [
														Text(
															"Satisfaction",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 19
															),
														),

														SizedBox(height: 20),

														Text(
															"We access the needs of our clients and execute 100% as desired.",
															textAlign: TextAlign.center,
															style: TextStyle(
																color: Colors.white,
																fontSize: 17
															),
														),
													],
												)
											),

											Container(
												width: screenSize.width * 0.22,
												height: screenSize.width * 0.22,
												margin: const EdgeInsets.only(bottom: 20),
												padding: const EdgeInsets.all(10),
												decoration: BoxDecoration(
													color: Colors.blue,
													borderRadius: BorderRadius.circular(1000000),
													border: Border.all(
														color: Colors.blueGrey
													)
												),

												child: Column(
													mainAxisAlignment: MainAxisAlignment.center,
													children: const [
														Text(
															"Time",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 19
															),
														),

														SizedBox(height: 20),

														Text(
															"Time is essential and of great value. Prompt delivery is our goal.",
															textAlign: TextAlign.center,
															style: TextStyle(
																fontSize: 17,
																color: Colors.white
															),
														),
													],
												)
											),

											Container(
												width: screenSize.width * 0.22,
												height: screenSize.width * 0.22,
												margin: const EdgeInsets.only(bottom: 20),
												padding: const EdgeInsets.all(10),
												decoration: BoxDecoration(
													color: Colors.blue,
													borderRadius: BorderRadius.circular(1000000),
													border: Border.all(
														color: Colors.blueGrey
													)
												),

												child: Column(
													mainAxisAlignment: MainAxisAlignment.center,
													children: const [
														Text(
															"Quality",
															style: TextStyle(
																fontWeight: FontWeight.w900,
																fontSize: 19
															),
														),

														SizedBox(height: 20),

														Text(
															"Acquiring inferior materials can cost the most. With us, there is heavy emphasis on quality assurance from start to finish.",
															textAlign: TextAlign.center,
															style: TextStyle(
																fontSize: 17,
																color: Colors.white
															),
														),
													],
												)
											),
										],
									)

								],
							)
						),

						// This is followed by a meeting booking request.
						Container(
							margin: EdgeInsets.only(right: ResponsiveWidget.isSmallScreen(context) ? 0 : screenSize.width * 0.64),
							child: BookMeeting()
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
