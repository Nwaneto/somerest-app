import 'package:flutter/material.dart';
import 'package:somerest/user/widgets/job_alert.dart';
import 'package:somerest/user/widgets/job_preferences.dart';
import 'package:somerest/widgets/responsive.dart';

class UserPreferences extends StatefulWidget {
	@override
	UserPreferencesState createState() => UserPreferencesState();
}

class UserPreferencesState extends State<UserPreferences> {
	late Widget _currentTab;

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
		_currentTab = _switchTo(0);
	}

	Widget _switchTo(int i) {
		switch(i) {
			case 0: {
				return JobAlert();
			}

			default: {
				return JobPreferences();
			}
		}
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
						"Preferences",
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
													"Job Alerts",
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
									width: ResponsiveWidget.isSmallScreen(context) ? 110 : 160,
									child: Column(
										children: [
											Align(
												alignment: Alignment.centerLeft,
												child: Text(
													"Job Preferences",
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
						]
					),

					const Padding(
						padding: EdgeInsets.only(left: 10),
						child: Divider(
							color: Color(0x55000000)
						),
					),

					const SizedBox(height: 20),

					_switchTo(_selectedTab)
				]
			)
		);
	}
}