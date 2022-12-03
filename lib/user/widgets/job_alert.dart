// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:somerest/widgets/responsive.dart';

class JobAlert extends StatefulWidget {
	@override
	JobAlertState createState() => JobAlertState();
}

enum AlertFrequency {
	daily,
	weekly,
	monthly
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

	bool _showingDialog = false;
	AlertFrequency? _frequency = AlertFrequency.daily;

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
							onPressed: () async {
								if(_showingDialog) {
									return;
								}

								_showingDialog = true;
								await showFlash(
									context: context,
									builder: ((buildContext, buildController) {
										return Flash.dialog(
											controller: buildController,
											backgroundColor: const Color(0x55000000),
											child: Container(
												alignment: Alignment.center,
												child: Container(
													width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width * 0.9 : screenSize.width * 0.33,
													height: ResponsiveWidget.isSmallScreen(context) ? screenSize.height * 0.28 : screenSize.height * 0.33,
													padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
													decoration: BoxDecoration(
														borderRadius: BorderRadius.circular(10),
														color: Colors.white,
													),
													child: Column(
														mainAxisAlignment: MainAxisAlignment.start,
														crossAxisAlignment: CrossAxisAlignment.start,
														children: [
															Row(
																mainAxisAlignment: MainAxisAlignment.spaceBetween,
																children: [
																	const Text(
																		"Create your job alert",
																		style: TextStyle(
																			fontSize: 16
																		)
																	),


																	IconButton(
																		onPressed: buildController.dismiss, 
																		icon: const Icon(
																			Icons.cancel_outlined,
																			color: Colors.red
																		)
																	)
																],
															),

															const Divider(
																color: Colors.grey,
																thickness: 2,
															),

															const Text(
																"How often do you want to be notified?",
															),

															Row(
																mainAxisAlignment: MainAxisAlignment.spaceBetween,
																children: [
																	Row(
																		children: [
																			const Text("Daily "),
																			Checkbox(
																				value: _frequency == AlertFrequency.daily,
																				onChanged: (value) {
																					setState(() {
																					  _frequency = AlertFrequency.daily;
																					});
																				}  
																			),
																		],
																	),


																	Row(
																		children: [
																			const Text("Weekly "),
																			Checkbox(
																				value: _frequency == AlertFrequency.weekly,
																				onChanged: (value) {
																					setState(() {
																					  _frequency = AlertFrequency.weekly;
																					});
																				}  
																			),
																		],
																	),

																	Row(
																		children: [
																			const Text("Monthly "),
																			Checkbox(
																				value: _frequency == AlertFrequency.monthly,
																				onChanged: (value) {
																					setState(() {
																					  _frequency = AlertFrequency.daily;
																					});
																				}  
																			),
																		],
																	),
																],
															)
														],
													),
												),
											)
										);
									})
								);
								_showingDialog = false;
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