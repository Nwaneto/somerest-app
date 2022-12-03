import 'package:flutter/material.dart';
import 'package:somerest/widgets/responsive.dart';

class JobPreferences extends StatefulWidget {
	@override
	JobPreferencesState createState() => JobPreferencesState();
}

class JobPreferencesState extends State<JobPreferences> {
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
					
				]
			)
		);
	}
}