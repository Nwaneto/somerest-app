import 'package:flutter/material.dart';
import 'package:somerest/widgets/responsive.dart';

class JobPreferences extends StatefulWidget {
	@override
	JobPreferencesState createState() => JobPreferencesState();
}

bool _autoApply = false;

class JobPreferencesState extends State<JobPreferences> {
	@override
	void initState() {
		super.initState();

	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Container(
			width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width : screenSize.width*0.82,
			padding: const EdgeInsets.only(left: 10, right: 10),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					ListTile(
						title: Text(
							"Enable auto-apply for 5 days",
							textAlign: TextAlign.start,
							style: TextStyle(
								fontSize: ResponsiveWidget.isSmallScreen(context) ? 14:  19
							),
						),
						subtitle: Text(
							"For the next 5 days our system would automatically match you with jobs that fit your career profile and preferences with a confidence interval of at least 80% and apply to these jobs for you.",
							textAlign: TextAlign.start,
							style: TextStyle(
								fontSize: ResponsiveWidget.isSmallScreen(context) ? 11:  16
							),
						),
						trailing: Switch(
							value: _autoApply,
							activeColor: Colors.red,
							onChanged: (value) {
								setState(() {
									_autoApply = !_autoApply;  
								});
						}),
					),

					const SizedBox(height: 80)
				]
			)
		);
	}
}