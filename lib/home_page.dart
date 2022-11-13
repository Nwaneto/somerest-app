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
			preferredSize: Size(screenSize.width, 60),
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
					width: screenSize.width,
					height: screenSize.height * 0.7,
					alignment: Alignment.center,
					padding: const EdgeInsets.all(40),
					decoration: const BoxDecoration(
						color: Colors.blueGrey,
						borderRadius: BorderRadius.only(
							bottomLeft: Radius.elliptical(400, 250),
							bottomRight: Radius.elliptical(1500, 400)
						)
					),
					child:  Column(children: [
						Container (
							margin: EdgeInsets.only(top: screenSize.height*.2),	
							child: const Text(
								'Welcome to Somerest Consulting Limited',
								textAlign: TextAlign.center,
								style: TextStyle(
									fontWeight: FontWeight.w400,
									color: Colors.white,
									fontSize: 25 
								),
							)
						),

						Container(
							margin: const EdgeInsets.only(top: 10),
							width: screenSize.width*0.5,
							decoration: const BoxDecoration(

							),
							child: const Text(
							'One of Nigeria’s leading consulting firm. We have been providing solution through the services we offer to our clients for over a decade and more',
							textAlign: TextAlign.center,
							style: TextStyle(
								color: Colors.white,
								fontSize: 16 
							),
						),
						)
					]),
				),
			  ],
			),

			Container(
				margin: const EdgeInsets.only(top: 50),
				child: Column(children: [
					const Text (
						'Somerest Consulting Limited',
						style: TextStyle(
							fontWeight: FontWeight.w900,
							fontSize: 23,
						),
					),
					Container(width: 200,
						margin: const EdgeInsets.only(bottom: 10),
						child: const Divider(
						thickness: 3,
						color: Colors.blue,
						)
					),
					SizedBox(
						width: screenSize.width*0.9,
						child: const Text (
					"""SOMEREST commenced business operation in the year 2002 as an ICT and project management firm and later expanded business to cover Recruitment/outsourcing, branding and Event Planning services with an emphasis on business supports services consultancy. Over the past years, we have consolidated the business by providing excellent service to our clients.""",
					style: TextStyle(
						fontWeight: FontWeight.w400,
						fontSize: 16,
						wordSpacing: 1
					),
					textAlign: TextAlign.left,
					),),

					Container(
						width: 100,
						margin: EdgeInsets.only(top: 5, left: screenSize.width*0.8),
						padding: const EdgeInsets.all(5),
						alignment: Alignment.center,
						decoration: BoxDecoration(
							color: Colors.blue,
							borderRadius: BorderRadius.circular(10)
						),
						child: TextButton(
							onPressed: () {},
							child: const Text(
								'Read More',
								textAlign: TextAlign.center,
								style: TextStyle(
									color: Colors.white
								),
							)
						)
					),
					
					Container(
						margin: const EdgeInsets.only(top: 10),
						child: const Text(
							'Discover Our Services',
							style: TextStyle(
								fontSize: 20,
								fontWeight: FontWeight.w900
							),
						)
					),

					const SizedBox(
						width: 100,
						child: Divider(
							thickness: 3,
							color: Colors.blue,
						))
					],)
			)
		  ],
		),
	  ),
	);
  }
}
