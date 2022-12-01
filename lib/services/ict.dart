import 'package:flutter/material.dart';

import 'package:somerest/topbar/base.dart';
import 'package:somerest/widgets/book_meeting.dart';
import 'package:somerest/widgets/responsive.dart';
import 'package:somerest/widgets/footer.dart';
import 'package:somerest/widgets/menu_drawer.dart';

class ICT extends StatefulWidget {
  const ICT({super.key});

	@override
	 ICTState createState() => ICTState();
}

class ICTState extends State<ICT> {
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
									"ICT",
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
							padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
							child: Text(
								"SOMEREST provides Information Communication Technology Consulting services to our clients by observing clients business and recommend areas in which they can benefit by computerization (if not in place) and also prepares systems' requirement specification documents. The documents include specification for equipments, installation, training and maintenance.",
								textAlign: TextAlign.justify,
								style: TextStyle (
									fontSize: 18
								),
							),
						),

						const Padding(
							padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
							child: Text(
								"IT training is no doubt vital. Management has to make expensive decisions to make the best use of current technology and other resources. In addition, Chief Executives and Senior Managers need to understand how well planned IT strategies can rapidly improve management efficiency and technique. Therefore computer users and professionals require constant skill developments. In order, to keep abreast of the latest technologies in the IT world, SOMEREST has packaged computer related programs tailored towards extensive skill acquisition and development.",
								textAlign: TextAlign.justify,
								style: TextStyle (
									fontSize: 18
								),
							),
						),

						const Padding(
							padding: EdgeInsets.only(left: 10, right: 10, bottom: 40),
							child: Text(
								"SOMEREST also provides wireless networking for data and voice transfer between locations. This technology enables all branches to be in a vast data and voice communication network with or without telecom involvement. SOMEREST also handles a formidable maintenance and dedicated engineers and technologists. We insist on he culture of proper maintenance of computer equipments and its peripherals.",
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

						const SizedBox(height: 40),

						// Last of all is the footer of the page.
						const Footer()
					]
				)
			)
		);
	}
}
