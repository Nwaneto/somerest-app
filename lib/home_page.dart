import 'package:flutter/material.dart';
import 'package:somerest/responsive.dart';
import 'top_bar_contents.dart';

import 'menu_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
		appBar: ResponsiveWidget.isSmallScreen(context) ? 
        AppBar(
            iconTheme: const IconThemeData(color: Color(0xFF077bd7)),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: 
            const Text (
                "Somerest",
                style: TextStyle(
                    color: Color(0xFF077bd7),
                    fontWeight: FontWeight.w900,
                    fontSize: 26
                ),
            ),
        ) : 
        PreferredSize(
			preferredSize: Size(screenSize.width, 70),
			child: TopBarContents(),
		),
        drawer: const MenuDrawer(),
		body: SingleChildScrollView(
		controller: _scrollController,
		physics: const ClampingScrollPhysics(),
		child: Column(
		  children: [
			Stack(
			  children: [
				Container(
				  child: SizedBox(
					height: screenSize.height *.9,
					width: screenSize.width,
					child: Image.asset(
					  'assets/images/background.png',
					  fit: BoxFit.cover,
					),
				  ),
				),
			  ],
			),
		  ],
		),
	  ),
	);
	;
  }
}
