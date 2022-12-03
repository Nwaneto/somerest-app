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
			width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width : screenSize.width*0.82,
			padding: const EdgeInsets.only(left: 10, right: 20),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Container(
						padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
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
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: [
											Text(
												"$position. " + current['jobTitle'] + " | " + current['jobType']  + ' | ' + current['frequency'],
											),

											Row(
												children: [
													Text(
														current['enabled'] ? "Active" : "Paused"
													),

													const SizedBox(width: 3),

													Switch(
														value: current['enabled'],
														activeColor: Colors.red,
														onChanged: (value) {
															setState(() {
																current['enabled'] = !current['enabled'];  
															});
													}),

													const SizedBox(width: 3),

													IconButton(
															onPressed: () {

															},
															icon: const Icon(Icons.edit
														)
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