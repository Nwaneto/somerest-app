// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:somerest/widgets/notification.dart';
import 'package:somerest/widgets/responsive.dart';

class JobAlert extends StatefulWidget {
	@override
	JobAlertState createState() => JobAlertState();
}

enum _AlertFrequency {
	daily,
	weekly,
	monthly
}

enum _JobType {
	partTime,
	fullTime,
	internship,
	event,
	remote
}


const Map _frequencyToTitle = {
	_AlertFrequency.daily: "Daily",
	_AlertFrequency.weekly: "Weekly",
	_AlertFrequency.monthly: "Monthly",
};

const Map _titleToFrequency = {
	"Daily": _AlertFrequency.daily,
	"Weekly": _AlertFrequency.weekly,
	"Monthly": _AlertFrequency.monthly,
};

const Map _typeToTitle = {
	_JobType.fullTime: "Full Time",
	_JobType.partTime: "Part Time",
	_JobType.internship: "Internship",
	_JobType.event: "Event",
	_JobType.remote: "Remote",
};

const Map _titleToType = {
	"Full Time": _JobType.fullTime,
	"Part Time": _JobType.partTime, 
	"Internship": _JobType.internship,
	"Event": _JobType.event,
	"Remote": _JobType.remote,
};


class _JobAlertDialogContents extends StatefulWidget {
	@override
	_JobAlertDialogState createState() => _JobAlertDialogState();
}


final TextEditingController _messageController = TextEditingController();
_AlertFrequency? _frequency = _AlertFrequency.daily;
_JobType? _jobType = _JobType.fullTime;
List _alerts = List.empty(growable: true);

class _JobAlertDialogState extends State<_JobAlertDialogContents> {
	@override 
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Column(
			children: [
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
									value: _frequency == _AlertFrequency.daily,
									onChanged: (value) {
										setState(() {
											_frequency = _AlertFrequency.daily;
										});
									}  
								),
							],
						),


						Row(
							children: [
								const Text("Weekly "),
								Checkbox(
									value: _frequency == _AlertFrequency.weekly,
									onChanged: (value) {
										setState(() {
											_frequency = _AlertFrequency.weekly;
										});
									}  
								),
							],
						),

						Row(
							children: [
								const Text("Monthly "),
								Checkbox(
									value: _frequency == _AlertFrequency.monthly,
									onChanged: (value) {
										setState(() {
											_frequency = _AlertFrequency.monthly;
										});
									}  
								),
							],
						),
					],
				),

				const SizedBox(height: 15),

				SizedBox(
					width: screenSize.width * 0.9,
					child: TextField(
						cursorColor: Colors.blue,
						controller: _messageController,
						decoration: const InputDecoration(
							labelText: "Job Title",
							hintText: "Required",
							hintStyle: TextStyle(
								color: Colors.red
							),
							border: OutlineInputBorder(
								borderRadius: BorderRadius.all(
									Radius.circular(10)
								),

								borderSide: BorderSide(
									color: Colors.blue,
									width: 1.0,
								)
							)
						),
					)
				),

				const SizedBox(height: 20),

				const Text(
					"Select Job Type",
				),

				Column(
					children: [
						Row(
							children: [
								Checkbox(
									value: _jobType == _JobType.fullTime,
									onChanged: (value) {
										setState(() {
											_jobType = _JobType.fullTime;
										});
									}  
								),
								const Text("Full Time "),
							],
						),


						Row(
							children: [
								Checkbox(
									value: _jobType == _JobType.partTime,
									onChanged: (value) {
										setState(() {
											_jobType = _JobType.partTime;
										});
									}  
								),
								const Text("Part Time "),
							],
						),

						Row(
							children: [
								Checkbox(
									value: _jobType == _JobType.internship,
									onChanged: (value) {
										setState(() {
											_jobType = _JobType.internship;
										});
									}  
								),
								const Text("Internship "),
							],
						),

						Row(
							children: [
								Checkbox(
									value: _jobType == _JobType.remote,
									onChanged: (value) {
										setState(() {
											_jobType = _JobType.remote;
										});
									}  
								),
								const Text("Remote "),
							],
						),

						Row(
							children: [
								Checkbox(
									value: _jobType == _JobType.event,
									onChanged: (value) {
										setState(() {
											_jobType = _JobType.event;
										});
									}  
								),
								const Text("Event/Gig  "),
							],
						),
					],
				),
			],
		);
;	}
} 

class JobAlertState extends State<JobAlert> {
	int _selectedTab = 0;
	
	final List _selectedFilter = [
		false,
		false,
		false,
		false
	];

	bool _showingDialog = false;

	void _addAlert() {
		String title = _messageController.text;
		String type = _typeToTitle[_jobType];
		String frequency = _frequencyToTitle[_frequency];

		// No more input.
		_messageController.clear();

		if(title.isEmpty) {
			NotificationHelper.showError(context, "Job Title is required when creating your job alert! It is the title you want to get employed at eg. Chief Executive Officer");
		}

		setState(() {
			_alerts.add({
				"id": 9,
				"jobTitle": title,
				"jobType": type,
				"frequency": frequency,
				"enabled": true
			});
		});
	}

	@override
	void initState() {
		super.initState();
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
													width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width * 0.9 : screenSize.width * 0.42,
													height: 400,
													padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
													decoration: BoxDecoration(
														borderRadius: BorderRadius.circular(10),
														color: Colors.white,
													),
													child: 

													Column(
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


																	Row(children: [
																		TextButton(
																			onPressed: () {
																				_addAlert();
																				buildController.dismiss();
																				_frequency = _AlertFrequency.daily;
																				_jobType = _JobType.fullTime;
																				_messageController.clear();
																			},
																			child: const Text("Finish")
																		),

																		SizedBox(width: ResponsiveWidget.isSmallScreen(context) ? 0 : 20),

																		IconButton(
																			onPressed: () {
																				buildController.dismiss();
																				_frequency = _AlertFrequency.daily;
																				_jobType = _JobType.fullTime;
																				_messageController.clear();
																			}, 
																			icon: const Icon(
																				Icons.cancel_outlined,
																				color: Colors.red
																			)
																		)
																	],)
																],
															),

															_JobAlertDialogContents(),
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
															Container(
																width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width * 0.49 : null,
																child: Text(
																current['jobTitle'],
																
																textAlign: TextAlign.start,
																style: const TextStyle(
																	fontSize: 12,
																	overflow: TextOverflow.ellipsis
																),
															)
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
																onPressed: () async {
																	if(_showingDialog) {
																		return;
																	}

																	_showingDialog = true;
																	await showFlash(
																		context: context,
																		builder: ((buildContext, buildController) {
																			_frequency = _titleToFrequency[current['frequency']];
																			_jobType = _titleToType[current['jobType']];

																			return Flash.dialog(
																				controller: buildController,
																				backgroundColor: const Color(0x55000000),
																				child: Container(
																					alignment: Alignment.center,
																					child: Container(
																						width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width * 0.9 : screenSize.width * 0.42,
																						height: 400,
																						padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
																						decoration: BoxDecoration(
																							borderRadius: BorderRadius.circular(10),
																							color: Colors.white,
																						),
																						child: 

																						Column(
																							mainAxisAlignment: MainAxisAlignment.start,
																							crossAxisAlignment: CrossAxisAlignment.start,
																							children: [
																								Row(
																									mainAxisAlignment: MainAxisAlignment.spaceBetween,
																									children: [
																										const Text(
																											"Edit a job alert",
																											style: TextStyle(
																												fontSize: 16
																											)
																										),


																										Row(children: [
																											TextButton(
																												onPressed: () {
																													setState(() {
																														current['frequency'] = _frequencyToTitle[_frequency];
																														current['jobType'] = _typeToTitle[_jobType];
																														current['jobTitle'] = _messageController.text;
																													});

																													buildController.dismiss();
																													_frequency = _AlertFrequency.daily;
																													_jobType = _JobType.fullTime;
																													_messageController.clear();
																												},
																												child: const Text("Save")
																											),

																											IconButton(
																												onPressed: () {
																													buildController.dismiss();
																													_frequency = _AlertFrequency.daily;
																													_jobType = _JobType.fullTime;
																													_messageController.clear();
																												}, 
																												icon: const Icon(
																													Icons.cancel_outlined,
																													color: Colors.red
																												)
																											)
																										],)
																									],
																								),

																								_JobAlertDialogContents(),
																							],
																						),
																					),
																				)
																			);
																		})
																	);
																	_showingDialog = false;
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