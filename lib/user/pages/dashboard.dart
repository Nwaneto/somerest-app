import 'package:flutter/material.dart';
import 'package:somerest/user/data/post.dart';
import 'package:somerest/user/widgets/job_listing.dart';
import 'package:somerest/widgets/responsive.dart';

class UserHome extends StatefulWidget {
	@override
	UserHomeState createState() => UserHomeState();
}

class UserHomeState extends State<UserHome> {
	late List<SomerestPost> _posts;
	late String _userName;

	bool? _jobTypeFull = false;
	bool? _jobTypePartTime = false;
	bool? _jobTypeInternship = false;
	bool? _jobTypeRemote = false;
	bool? _jobTypeEvent = false;

	late Widget _popularJobs;

	@override
	void initState() {
		super.initState();
		_posts = List.empty(growable: true);
		_popularJobs = const Text("Nothing to show yet");
	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;

		return Container(
			width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width : screenSize.width * 0.82,
			margin: ResponsiveWidget.isSmallScreen(context) ? const EdgeInsets.only(left: 15, right: 15) : null,
			padding: const EdgeInsets.only(top: 40, bottom: 60),
			child: 

			ResponsiveWidget.isSmallScreen(context) 
			
			?

			Column(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				crossAxisAlignment: ResponsiveWidget.isSmallScreen(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
				children: [
					Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: [
							Container(
								alignment: Alignment.center,
								padding: const EdgeInsets.all(10),
								decoration: BoxDecoration(
									color: Colors.white,
									borderRadius: BorderRadius.circular(10),
									boxShadow: const [
										BoxShadow(
											blurRadius: 3,
											spreadRadius: 3,
											blurStyle: BlurStyle.outer

										),
									],
								),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										const Text(
											"Job Style",
											textAlign: TextAlign.start,
											style: TextStyle(
												fontWeight: FontWeight.w800,
												fontSize: 18
											),
										),

										const SizedBox(height: 20),

										Row(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												Checkbox(
													value: _jobTypeFull,
													onChanged: (value) {
														setState(() {
															_jobTypeFull = value;
														});
													}
												),

												// Just there as margin.
												const SizedBox(width: 5),

												const Text(
													'Full Time',
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: 14
													)
												),
											],
										),

										Row(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												Checkbox(
													value: _jobTypePartTime,
													onChanged: (value) {
														setState(() {
															_jobTypePartTime = value;
														});
													}
												),

												// Just there as margin.
												const SizedBox(width: 5),

												const Text(
													'Part Time',
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: 14
													)
												),
											],
										),

										Row(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												Checkbox(
													value: _jobTypeInternship,
													onChanged: (value) {
														setState(() {
															_jobTypeInternship = value;
														});
													}
												),

												// Just there as margin.
												const SizedBox(width: 5),

												const Text(
													'Internship',
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: 14
													)
												),
											],
										),

										Row(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												Checkbox(
													value: _jobTypeRemote,
													onChanged: (value) {
														setState(() {
															_jobTypeRemote = value;
														});
													}
												),

												// Just there as margin.
												const SizedBox(width: 5),

												const Text(
													'Remote',
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: 14
													)
												),
											],
										),

										Row(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												Checkbox(
													value: _jobTypeEvent,
													onChanged: (value) {
														setState(() {
															_jobTypeEvent = value;
														});
													}
												),

												// Just there as margin.
												const SizedBox(width: 5),

												const Text(
													'Event/Gig',
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: 14
													)
												),
											],
										),
									],
								)
							),

							Align(
								alignment: Alignment.centerRight,
								child: Container(
									width: screenSize.width * 0.25,
									padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10)
									),
									margin: const EdgeInsets.only(top: 20),
									child:TextButton(
										onPressed: () {

										},
										child: const Text(
											"Filter",
											textAlign: TextAlign.center,
											style: TextStyle(
												color: Colors.white,
												fontSize: 17
											),
										),
									)
								),
							),

							// Margin for the popular jobs indicator.
							const SizedBox(height: 120),

							// The actual popular jobs indicator.
							const Text(
								"Popular Jobs",
								style: TextStyle(
									fontSize: 19,
									fontWeight: FontWeight.w600
								),
							),

							Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(right: 5),
									width: 10,
									height: 10,
									decoration: BoxDecoration(
										color: Colors.green,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"UI/UX Design",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]),

							Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(right: 5),
									width: 10,
									height: 10,
									decoration: BoxDecoration(
										color: Colors.red,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Project Management",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]),

							Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(right: 5),
									width: 10,
									height: 10,
									decoration: BoxDecoration(
										color: Colors.yellow,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Fullstack Developer",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]),

							Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(right: 5),
									width: 10,
									height: 10,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Data Analysis",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]),

							// This is the margin for stuff right now.
							const SizedBox(height: 30),

							// Render the popular jobs widget here.
							_popularJobs
						],
					),

					Container(
						width: screenSize.width * 0.95,
						margin: const EdgeInsets.only(top: 40),
						padding: const EdgeInsets.all(10),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: [
								Container(
									padding: const EdgeInsets.all(11),
									decoration: BoxDecoration(
										color: const Color(0x33077bd7),
										borderRadius: BorderRadius.circular(10)
									),
									child: const Text(
										"Find Job/Job Title",
										textAlign: TextAlign.center,
										style: TextStyle(
											fontSize: 16
										),
									),
								),

								JobListing()
							],
						)
					)
				]
			)

			:			

			Row(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							Container(
								width: screenSize.width * 0.23,
								padding: const EdgeInsets.all(10),
								decoration: BoxDecoration(
									color: Colors.white,
									borderRadius: BorderRadius.circular(10),
									boxShadow: const [
										BoxShadow(
											blurRadius: 3,
											spreadRadius: 3,
											blurStyle: BlurStyle.outer

										),
									],
								),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										const Text(
											"Job Style",
											textAlign: TextAlign.start,
											style: TextStyle(
												fontWeight: FontWeight.w800,
												fontSize: 18
											),
										),

										const SizedBox(height: 20),

										Row(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												Checkbox(
													value: _jobTypeFull,
													onChanged: (value) {
														setState(() {
															_jobTypeFull = value;
														});
													}
												),

												// Just there as margin.
												const SizedBox(width: 5),

												const Text(
													'Full Time',
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: 14
													)
												),
											],
										),

										Row(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												Checkbox(
													value: _jobTypePartTime,
													onChanged: (value) {
														setState(() {
															_jobTypePartTime = value;
														});
													}
												),

												// Just there as margin.
												const SizedBox(width: 5),

												const Text(
													'Part Time',
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: 14
													)
												),
											],
										),

										Row(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												Checkbox(
													value: _jobTypeInternship,
													onChanged: (value) {
														setState(() {
															_jobTypeInternship = value;
														});
													}
												),

												// Just there as margin.
												const SizedBox(width: 5),

												const Text(
													'Internship',
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: 14
													)
												),
											],
										),

										Row(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												Checkbox(
													value: _jobTypeRemote,
													onChanged: (value) {
														setState(() {
															_jobTypeRemote = value;
														});
													}
												),

												// Just there as margin.
												const SizedBox(width: 5),

												const Text(
													'Remote',
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: 14
													)
												),
											],
										),

										Row(
											mainAxisAlignment: MainAxisAlignment.start,
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												Checkbox(
													value: _jobTypeEvent,
													onChanged: (value) {
														setState(() {
															_jobTypeEvent = value;
														});
													}
												),

												// Just there as margin.
												const SizedBox(width: 5),

												const Text(
													'Event/Gig',
													textAlign: TextAlign.start,
													style: TextStyle(
														fontSize: 14
													)
												),
											],
										),
									],
								)
							),

							Align(
								alignment: Alignment.centerRight,
								child: Container(
									padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10)
									),
									margin: const EdgeInsets.only(top: 20),
									child:TextButton(
										onPressed: () {

										},
										child: const Text(
											"Filter",
											textAlign: TextAlign.center,
											style: TextStyle(
												color: Colors.white,
												fontSize: 17
											),
										),
									)
								),
							),

							// Margin for the popular jobs indicator.
							const SizedBox(height: 70),

							// The actual popular jobs indicator.
							const Text(
								"Popular Jobs",
								style: TextStyle(
									fontSize: 19,
									fontWeight: FontWeight.w600
								),
							),

							Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(right: 5),
									width: 10,
									height: 10,
									decoration: BoxDecoration(
										color: Colors.green,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"UI/UX Design",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]),

							Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(right: 5),
									width: 10,
									height: 10,
									decoration: BoxDecoration(
										color: Colors.red,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Project Management",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]),

							Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(right: 5),
									width: 10,
									height: 10,
									decoration: BoxDecoration(
										color: Colors.yellow,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Fullstack Developer",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]),

							Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Container(
									margin: const EdgeInsets.only(right: 5),
									width: 10,
									height: 10,
									decoration: BoxDecoration(
										color: Colors.blue,
										borderRadius: BorderRadius.circular(10000)
									),
								),

								const Text(
									"Data Analysis",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 16,
									),
								)
							]),

							Align(
								alignment: Alignment.centerRight,
								child: TextButton(
									onPressed: () {

									},
									child: const Text("Filter"),
								)
							),

							// This is the margin for stuff right now.
							const SizedBox(height: 30),

							// Render the popular jobs widget here.
							_popularJobs
						],
					),

					Container(
						width: screenSize.width * 0.5,
						padding: const EdgeInsets.all(10),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: [
								Container(
									padding: const EdgeInsets.all(11),
									decoration: BoxDecoration(
										color: const Color(0x33077bd7),
										borderRadius: BorderRadius.circular(10)
									),
									child: const Text(
										"Find Job/Job Title",
										textAlign: TextAlign.center,
										style: TextStyle(
											fontSize: 16
										),
									),
								),

								JobListing()
							],
						)
					)
				]
			),
		);
	}
}