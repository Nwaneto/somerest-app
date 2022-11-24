import "package:flutter/material.dart";
import 'package:somerest/widgets/responsive.dart';

class BookMeeting extends StatefulWidget {
	@override
	BookMeetingState createState() => BookMeetingState();
}

class BookMeetingState extends State<BookMeeting> {
	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Container(
			margin: EdgeInsets.only(left: ResponsiveWidget.isSmallScreen(context) ? 0 : 40, top: ResponsiveWidget.isSmallScreen(context) ? 40 : 0),
			padding: const EdgeInsets.all(40),
			width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width * 0.9: screenSize.width * 0.3,
			color: Colors.blue,
			alignment: Alignment.centerLeft,
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
				SizedBox(
					width: 300,
					height: 100,
					child: Stack(	
					children: [
						Positioned(
							child: Image.asset(
								"assets/images/facial1.png",
								scale: 1.4,
							)
						),

						Positioned(
							left: 48,
							child: Image.asset(
								"assets/images/facial2.png",
								scale: 1.4,
							),
						),

						Positioned(
							left: 97,
							child: Image.asset(
								"assets/images/facial3.png",
								scale: 1.4,
							),
						)
					]),
				),
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
			])
		);
	}
}