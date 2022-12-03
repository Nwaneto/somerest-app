import 'package:flutter/material.dart';
import 'package:somerest/user/data/post.dart';
import 'package:somerest/widgets/responsive.dart';

class UserApplication extends StatefulWidget {
	@override
	UserApplicationState createState() => UserApplicationState();
}

class UserApplicationState extends State<UserApplication> {
	final List<SomerestPost> _posts = List.empty(growable: true);
	late Widget _applicationListing; 

	int _selectedTab = 0;
	final List _selectedFilter = [
		false,
		false,
		false,
		false
	];

	@override
	void initState() {
		super.initState();
		_applicationListing = const Center(child: Text("Nothing to show yet"));
	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Container(
			width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width : screenSize.width*0.82,
			padding: const EdgeInsets.only(left: 10, right: 20),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					const SizedBox(height: 10),

					const Text(
						"Application",
						style: TextStyle(
							fontSize: 19,
							fontWeight: FontWeight.w800
						),
					),

					const SizedBox(height: 30),

					Row(
						mainAxisAlignment: MainAxisAlignment.start,
						children: [

							// Application
							TextButton(
								onPressed: () {
									setState(() {
									  _selectedTab = 0;
									});
								},

								child: SizedBox(
									width: ResponsiveWidget.isSmallScreen(context) ? 70 : 100,
									child: Column(
										children: [
											Align(
												alignment: Alignment.centerLeft,
												child: Text(
													"Application",
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : 14,
														color: _selectedTab == 0 ? Colors.blue : Colors.black
													),
												)
											),

											Divider(
												color: _selectedTab == 0 ? Colors.blue : const Color(0x55000000),
												thickness: 5,
											),
										],
									),
								),
							),
							const SizedBox(width: 5),


							// Saved Jobs
							TextButton(
								onPressed: () {
									setState(() {
									  _selectedTab = 1;
									});
								},

								child: SizedBox(
									width: ResponsiveWidget.isSmallScreen(context) ? 70 : 100,
									child: Column(
										children: [
											Align(
												alignment: Alignment.centerLeft,
												child: Text(
													"Saved Jobs",
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : 14,
														color: _selectedTab == 1 ? Colors.blue : Colors.black
													),
												)
											),

											Divider(
												color: _selectedTab == 1 ? Colors.blue : const Color(0x55000000),
												thickness: 5,
											),
										],
									),
								),
							),
							const SizedBox(width: 5),


							// Upcoming Review.
							TextButton(
								onPressed: () {
									setState(() {
									  _selectedTab = 2;
									});
								},

								child: SizedBox(
									width: ResponsiveWidget.isSmallScreen(context) ? 110 : 150,
									child: Column(
										children: [
											Align(
												alignment: Alignment.centerLeft,
												child: Text(
													"Upcoming Review",
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : 14,
														color: _selectedTab == 2 ? Colors.blue : Colors.black
													),
												)
											),

											Divider(
												color: _selectedTab == 2 ? Colors.blue : const Color(0x55000000),
												thickness: 5,
											),
										],
									),
								),
							)
						],
					),

					const SizedBox(height: 30),

					Container(
						margin: const EdgeInsets.only(left: 10, bottom: 30),
						padding: EdgeInsets.only(top: 10, bottom: 10, left: ResponsiveWidget.isSmallScreen(context) ? 10 : 20, right: ResponsiveWidget.isSmallScreen(context) ? 10 : 20),
						decoration: const BoxDecoration(
							color: Color(0x55077bd7)
						),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Text(
									"Want your application to stand out?",
									style: TextStyle(
										fontSize: ResponsiveWidget.isSmallScreen(context) ? 10.5 : 16
									),
								),

								TextButton(
									onPressed: () {
										
									},

									child: Text(
										"Complete your profile",
										style: TextStyle(
											fontSize: ResponsiveWidget.isSmallScreen(context) ? 10.5 : 16
										)
									)
								)
							]
						)
					),

					_selectedTab == 0 ?

					Padding(
						padding: const EdgeInsets.only(left: 10, right: 10),
						child: 
						ResponsiveWidget.isSmallScreen(context)
						?

						Column(
							mainAxisAlignment: ResponsiveWidget.isSmallScreen(context) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
							children: [
								const Text("Filter By"),
								const SizedBox(height: 10),

								TextButton(
									onPressed: () {
										setState(() {
											_selectedFilter[0] = !_selectedFilter[0];
										});
									},
									
									child: Container(
										padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
										decoration: BoxDecoration(
											border: Border.all(color: Colors.blue),
											borderRadius: BorderRadius.circular(10),
											color: _selectedFilter[0] ? Colors.blue : Colors.white
										),
										child: Row(
											mainAxisAlignment: MainAxisAlignment.spaceBetween,
											children: [
												Text(
													"Incomplete Application",
													style: TextStyle(
														fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : 16,
														color: _selectedFilter[0] ? Colors.white : Colors.blue
													),
												),

												const SizedBox(width: 10),

												Container(
													padding: const EdgeInsets.only(left: 5, right: 5),
													decoration: BoxDecoration(
														color: _selectedFilter[0] ? Colors.white : Colors.blue,
														borderRadius: BorderRadius.circular(10)
													),
													child: Text(
														"0",
														style: TextStyle(
															color: _selectedFilter[0] ? Colors.blue : Colors.white
														),
													),
												)
											]
										)
									),
								),
								const SizedBox(height: 10),

								TextButton(
									onPressed: () {
										setState(() {
											_selectedFilter[1] = !_selectedFilter[1];
										});
									},
									
									child: Container(
										padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
										decoration: BoxDecoration(
											border: Border.all(color: Colors.blue),
											borderRadius: BorderRadius.circular(10),
											color: _selectedFilter[1] ? Colors.blue : Colors.white
										),
										child: Row(
											mainAxisAlignment: MainAxisAlignment.spaceBetween,
											children: [
												Text(
													"Jobs Applied",
													style: TextStyle(
														fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : 16,
														color: _selectedFilter[1] ? Colors.white : Colors.blue
													),
												),

												const SizedBox(width: 10),

												Container(
													padding: const EdgeInsets.only(left: 5, right: 5),
													decoration: BoxDecoration(
														color: _selectedFilter[1] ? Colors.white : Colors.blue,
														borderRadius: BorderRadius.circular(10)
													),
													child: Text(
														"0",
														style: TextStyle(
															color: _selectedFilter[1] ? Colors.blue : Colors.white
														),
													),
												)
											]
										)
									),
								),
								const SizedBox(height: 10),

								TextButton(
									onPressed: () {
										setState(() {
											_selectedFilter[2] = !_selectedFilter[2];
										});
									},
									
									child: Container(
										padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
										decoration: BoxDecoration(
											border: Border.all(color: Colors.blue),
											borderRadius: BorderRadius.circular(10),
											color: _selectedFilter[2] ? Colors.blue : Colors.white
										),
										child: Row(
											mainAxisAlignment: MainAxisAlignment.spaceBetween,
											children: [
												Text(
													"Shortlist Jobs",
													style: TextStyle(
														fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : 16,
														color: _selectedFilter[2] ? Colors.white : Colors.blue
													),
												),

												const SizedBox(width: 10),

												Container(
													padding: const EdgeInsets.only(left: 5, right: 5),
													decoration: BoxDecoration(
														color: _selectedFilter[2] ? Colors.white : Colors.blue,
														borderRadius: BorderRadius.circular(10)
													),
													child: Text(
														"0",
														style: TextStyle(
															color: _selectedFilter[2] ? Colors.blue : Colors.white
														),
													),
												)
											]
										)
									),
								),
								const SizedBox(height: 10),
							],
						)

						:
	
						Row(
							mainAxisAlignment: ResponsiveWidget.isSmallScreen(context) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
							children: [
								const Text("Filter By: "),

								TextButton(
									onPressed: () {
										setState(() {
											_selectedFilter[0] = !_selectedFilter[0];
										});
									},
									
									child: Container(
										padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
										decoration: BoxDecoration(
											border: Border.all(color: Colors.blue),
											borderRadius: BorderRadius.circular(10),
											color: _selectedFilter[0] ? Colors.blue : Colors.white
										),
										child: Row(
											children: [
												Text(
													"Incomplete Application",
													style: TextStyle(
														fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : 16,
														color: _selectedFilter[0] ? Colors.white : Colors.blue
													),
												),

												const SizedBox(width: 10),

												Container(
													padding: const EdgeInsets.only(left: 5, right: 5),
													decoration: BoxDecoration(
														color: _selectedFilter[0] ? Colors.white : Colors.blue,
														borderRadius: BorderRadius.circular(10)
													),
													child: Text(
														"0",
														style: TextStyle(
															color: _selectedFilter[0] ? Colors.blue : Colors.white
														),
													),
												)
											]
										)
									),
								),
								SizedBox(width: ResponsiveWidget.isSmallScreen(context) ? 0 : 50),

								TextButton(
									onPressed: () {
										setState(() {
											_selectedFilter[1] = !_selectedFilter[1];
										});
									},
									
									child: Container(
										padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
										decoration: BoxDecoration(
											border: Border.all(color: Colors.blue),
											borderRadius: BorderRadius.circular(10),
											color: _selectedFilter[1] ? Colors.blue : Colors.white
										),
										child: Row(
											children: [
												Text(
													"Jobs Applied",
													style: TextStyle(
														fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : 16,
														color: _selectedFilter[1] ? Colors.white : Colors.blue
													),
												),

												const SizedBox(width: 10),

												Container(
													padding: const EdgeInsets.only(left: 5, right: 5),
													decoration: BoxDecoration(
														color: _selectedFilter[1] ? Colors.white : Colors.blue,
														borderRadius: BorderRadius.circular(10)
													),
													child: Text(
														"0",
														style: TextStyle(
															color: _selectedFilter[1] ? Colors.blue : Colors.white
														),
													),
												)
											]
										)
									),
								),
								SizedBox(width: ResponsiveWidget.isSmallScreen(context) ? 0 : 50),

								TextButton(
									onPressed: () {
										setState(() {
											_selectedFilter[2] = !_selectedFilter[2];
										});
									},
									
									child: Container(
										padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
										decoration: BoxDecoration(
											border: Border.all(color: Colors.blue),
											borderRadius: BorderRadius.circular(10),
											color: _selectedFilter[2] ? Colors.blue : Colors.white
										),
										child: Row(
											children: [
												Text(
													"Shortlist Jobs",
													style: TextStyle(
														fontSize: ResponsiveWidget.isSmallScreen(context) ? 12 : 16,
														color: _selectedFilter[2] ? Colors.white : Colors.blue
													),
												),

												const SizedBox(width: 10),

												Container(
													padding: const EdgeInsets.only(left: 5, right: 5),
													decoration: BoxDecoration(
														color: _selectedFilter[2] ? Colors.white : Colors.blue,
														borderRadius: BorderRadius.circular(10)
													),
													child: Text(
														"0",
														style: TextStyle(
															color: _selectedFilter[2] ? Colors.blue : Colors.white
														),
													),
												)
											]
										)
									),
								),
								SizedBox(width: ResponsiveWidget.isSmallScreen(context) ? 0 : 50),
							],
						),
					)
					
					: const SizedBox(),

					const SizedBox(height: 50),

					_applicationListing,

					const SizedBox(height: 20),
				],
			),
		);
	}
}