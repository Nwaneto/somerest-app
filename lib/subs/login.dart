import 'package:flutter/material.dart';
import 'package:somerest/topbar/base.dart';
import 'package:somerest/widgets/responsive.dart';

import 'package:somerest/widgets/footer.dart';

import 'package:somerest/widgets/menu_drawer.dart';

class RequestMeeting extends StatefulWidget {
  const RequestMeeting({super.key});

	@override
	 RequestMeetingState createState() => RequestMeetingState();
}

class RequestMeetingState extends State<RequestMeeting> {
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

					]
				)
			)
		);
	}
}
