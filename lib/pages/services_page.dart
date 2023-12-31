import 'package:flutter/material.dart';
import 'package:somerest/widgets/responsive.dart';
import 'package:somerest/topbar/services.dart';

import 'package:somerest/widgets/footer.dart';

import 'package:somerest/widgets/menu_drawer.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

	@override
	 ServicesPageState createState() => ServicesPageState();
}

class ServicesPageState extends State<ServicesPage> {
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
					child: ServicesTopBarContents()
				),
			),

			drawer: const MenuDrawer(),

			body: SingleChildScrollView(
				controller: _scrollController,
				physics: const ClampingScrollPhysics(),
				child: Column(
					children: const [
						
						// Next is the footer of the website.
						Footer()
				],
			)
			)
		);
	}
}