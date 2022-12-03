// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:somerest/widgets/responsive.dart';

class JobAlert extends StatefulWidget {
	@override
	JobAlertState createState() => JobAlertState();
}

class JobAlertState extends State<JobAlert> {
	late List _alerts;
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
		_alerts = List.empty(growable: true);
		_alerts.add({
			"id": 0,
			"jobTitle": "Customer Services Officer",
			"jobType": "Full Time",
			"frequency": "Weekly",
			"enabled": false
		});
	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Container(
			margin: const EdgeInsets.only(bottom: 50),
			width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width : screenSize.width*0.82,
			padding: EdgeInsets.only(left: 10, right: ResponsiveWidget.isSmallScreen(context) ? 0 : 20),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Container(
						padding: EdgeInsets.only(top: 5, bottom: 5, left: ResponsiveWidget.isSmallScreen(context) ? 10 : 20, right: ResponsiveWidget.isSmallScreen(context) ? 10 : 20),
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(10),
							color: Colors.blue
						),
						child: TextButton(
							onPressed: () {

							},

							child: const Text(
								"Create job alert",
								style: TextStyle(
									color: Colors.white
								),
							)
						),
					),

					const SizedBox(height: 30),

					ListView.builder(
						physics: const NeverScrollableScrollPhysics(),
						shrinkWrap: true,
						itemCount: _alerts.length,
						itemBuilder: (context, index) {
							final current = _alerts[index];
							final position = index+1;

							return Card(
								margin: const EdgeInsets.only(top: 10, bottom: 10),
								child: Container(
									padding: const EdgeInsets.all(10),
									decoration: BoxDecoration(
										color: Colors.white,
										borderRadius: BorderRadius.circular(10),
									),
									child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: [
											Row(
												mainAxisAlignment: MainAxisAlignment.start,
												children: [
													Text(
														"$position.  ",
													),

													ResponsiveWidget.isSmallScreen(context)

													?

													Column(
														crossAxisAlignment: CrossAxisAlignment.start,
														children: [
															Text(
																current['jobTitle'],
																textAlign: TextAlign.start,
																style: const TextStyle(
																	fontSize: 12
																),
															),

															Text(
																current['jobType'],
																textAlign: TextAlign.start,
																style: const TextStyle(
																	fontSize: 12
																),
															),

															Text(
																current['frequency'],
																textAlign: TextAlign.start,
																style: const TextStyle(
																	fontSize: 12
																),
															),
														],
													)

													:

													Text(
														current['jobTitle'] + " | " + current['jobType']  + ' | ' + current['frequency']
													)
												],
											),

											Row(
												children: [
													ResponsiveWidget.isSmallScreen(context)

													?

													const SizedBox()

													:
													
													Text(
														current['enabled'] ? "Active" : "Paused",
														style: TextStyle(
															fontSize: ResponsiveWidget.isSmallScreen(context) ? 10 : null,
														)
													),

													SizedBox(width: ResponsiveWidget.isSmallScreen(context) ? 0 : 3),

													Row(
														children: [
															Switch(
																value: current['enabled'],
																activeColor: Colors.red,
																onChanged: (value) {
																	setState(() {
																		current['enabled'] = !current['enabled'];  
																	});
															}),

															IconButton(
																	onPressed: () {

																	},
																	icon: const Icon(Icons.edit
																)
															)
														],
													)
												],
											)
										],
									),
								)
							);
						}
					)
				]
			)
		);
	}
}