import 'package:flutter/material.dart';
import 'package:somerest/widgets/book_meeting.dart';
import 'package:somerest/widgets/google_maps.dart';
import 'package:somerest/widgets/responsive.dart';
import 'package:somerest/topbar/contact.dart';
import 'package:somerest/widgets/footer.dart';
import 'package:somerest/widgets/menu_drawer.dart';
import 'package:somerest/widgets/support_message.dart';

class ContactPage extends StatefulWidget {
	const ContactPage({super.key});

	@override
	ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
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
					child: ContactTopBarContents()
				),
			),

			drawer: const MenuDrawer(),

			body: SingleChildScrollView(
				controller: _scrollController,
				physics: const ClampingScrollPhysics(),
				child: Column(
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
									"Contact Us",
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

						ResponsiveWidget.isSmallScreen(context)

						?

						Column(
							children: [
								const Text(
									"Visit Our Branch Today",
									textAlign: TextAlign.center,
									style: TextStyle(
										color: Colors.blue,
										fontSize: 44
									)
								),

								const Divider(
									thickness: 3,
									color: Colors.blueGrey,
								),

								// This is the Maps widget. Not very useful or practical for now.
								const SomerestMaps(),

								SizedBox(
									width: screenSize.width * 0.9,
									child: Column(
										mainAxisAlignment: MainAxisAlignment.start,
										crossAxisAlignment: CrossAxisAlignment.stretch,
										children: const [
											// margin section
											SizedBox(height: 20),

											// Phone number section
											Text(
												"Call Us",
												style: TextStyle(
													color: Colors.blue,
													fontSize: 44
												)
											),

											// This is the actual phone number
											Text(
												"+2348037179051",
												style: TextStyle(
													color: Colors.black,
													fontSize: 18
												)
											),


											// The email section.
											Divider(
												thickness: 3,
												color: Colors.blueGrey,
											),


											// Phone number section
											SizedBox(height: 30),
											Text(
												"Email Us",
												style: TextStyle(
													color: Colors.blue,
													fontSize: 44
												)
											),

											// This is the actual phone number
											Text(
												"contact@somerest.com.ng",
												style: TextStyle(
													color: Colors.black,
													fontSize: 18
												)
											),
										],
									)
								)
							],
						)

						: 

						// For Larger screens.
						Row(
							crossAxisAlignment: CrossAxisAlignment.start,
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: [
								// This is the Maps widget. Not very useful or practical for now.
								const SomerestMaps(),

								SizedBox(
									width: screenSize.width * 0.45,
									child: Column(
										mainAxisAlignment: MainAxisAlignment.start,
										crossAxisAlignment: CrossAxisAlignment.stretch,
										children: const [
											Text(
												"Visit Our Branch Today",
												textAlign: TextAlign.center,
												style: TextStyle(
													color: Colors.blue,
													fontSize: 44
												)
											),

											// This is the Icon pointing to this stuff.
											Icon(Icons.arrow_back),
											Divider(
												thickness: 3,
												color: Colors.blueGrey,
											),


											// Phone number section
											SizedBox(height: 30),
											Text(
												"Call Us",
												style: TextStyle(
													color: Colors.blue,
													fontSize: 44
												)
											),

											// This is the actual phone number
											Text(
												"+2348037179051",
												style: TextStyle(
													color: Colors.black,
													fontSize: 18
												)
											),


											// The email section.
											Divider(
												thickness: 3,
												color: Colors.blueGrey,
											),


											// Phone number section
											SizedBox(height: 30),
											Text(
												"Email Us",
												style: TextStyle(
													color: Colors.blue,
													fontSize: 44
												)
											),

											// This is the actual phone number
											Text(
												"contact@somerest.com.ng",
												style: TextStyle(
													color: Colors.black,
													fontSize: 18
												)
											),
										],
									)
								)

							],
						),

						// Margin for the next section.
						const SizedBox(height: 70),

						// The next section is a conditional variable too.
						ResponsiveWidget.isSmallScreen(context)

						?

						Column(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: [
								BookMeeting(),

								Container(
									margin: const EdgeInsets.only(top: 60),
									width: screenSize.width * 0.9, 
									child: Column(
										mainAxisAlignment: MainAxisAlignment.start,
										children: const [
											Text(
												"Request for a Meeting",
												style: TextStyle(
													color: Colors.blue,
													fontSize: 29
												)
											),

											// Margin between these niggas
											SizedBox(height: 20),
											Icon(Icons.arrow_upward),

											// Margin between the both of them
											SizedBox(height: 50),

											// Virtual meeting
											Text(
												"Virtual Meeting?",
												style: TextStyle(
													color: Colors.blue,
													fontSize: 29
												)
											),

											// Margin between these niggas
											SizedBox(height: 20),
											Icon(Icons.arrow_upward),
										],
									), 

								)
							]
						)

						:

						Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								BookMeeting(),

								SizedBox(
									width: screenSize.width * 0.65,
									child: Column(
										mainAxisAlignment: MainAxisAlignment.start,
										children: const [
											Text(
												"Request for a Meeting",
												style: TextStyle(
													color: Colors.blue,
													fontSize: 44
												)
											),

											// Margin between these niggas
											SizedBox(height: 20),
											Icon(Icons.arrow_back),

											// Margin between the both of them
											SizedBox(height: 50),

											// Virtual meeting
											Text(
												"Virtual Meeting?",
												style: TextStyle(
													color: Colors.blue,
													fontSize: 44
												)
											),

											// Margin between these niggas
											SizedBox(height: 20),
											Icon(Icons.arrow_back),
										],
									), 
								)
							]
						),

						const SizedBox(height: 70),

						ResponsiveWidget.isSmallScreen(context)

						?


						SizedBox(
							width: screenSize.width * 0.9,
							child: Column(
								children: const [
									Text(
										"Do you have a comment or question?",
										style: TextStyle(
											fontWeight: FontWeight.w900,
											fontSize: 16
										)
									),

									SizedBox(height: 2),

									Text(
										"Did not find what you are looking for?",
										style: TextStyle(
											fontWeight: FontWeight.w700,
											fontSize: 16
										),
									)
								],
							),
						)

						:

						SizedBox(
							width: screenSize.width * 0.9,
							child: Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: const [
									Text(
										"Do you have a comment or question?",
										style: TextStyle(
											fontWeight: FontWeight.w900,
											fontSize: 22
										)
									),

									SizedBox(width: 30),

									Text(
										"Can't find what you are looking for?",
										style: TextStyle(
											fontWeight: FontWeight.w700,
											fontSize: 22
										),
									)
								],
							),
						),

						const SupportMessageWidget(),

						// Next is the footer of the website.
						const Footer()
					],
				)
			)
		);
	}
}