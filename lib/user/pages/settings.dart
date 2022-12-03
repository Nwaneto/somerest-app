import 'package:flutter/material.dart';
import 'package:somerest/user/tabs/settings/change_password.dart';
import 'package:somerest/user/tabs/settings/support.dart';
import 'package:somerest/widgets/responsive.dart';

class UserSettings extends StatefulWidget {
	@override
	UserSettingsState createState() => UserSettingsState();
}

class UserSettingsState extends State<UserSettings> {
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
				return ChangePassword();
			}

			default: {
				return UserSupport();
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
						"Settings",
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
									  _currentTab = _switchTo(0);
									});
								},

								child: SizedBox(
									width: ResponsiveWidget.isSmallScreen(context) ? 110 : 160,
									child: Column(
										children: [
											Align(
												alignment: Alignment.centerLeft,
												child: Text(
													"Change Password",
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
									  _currentTab = _switchTo(1);
									});
								},

								child: SizedBox(
									width: ResponsiveWidget.isSmallScreen(context) ? 70: 110,
									child: Column(
										children: [
											Align(
												alignment: Alignment.centerLeft,
												child: Text(
													"Support",
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

					// Something like this
					_currentTab
				]
			)
		);
	}
}