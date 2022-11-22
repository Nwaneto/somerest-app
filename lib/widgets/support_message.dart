import "package:flutter/material.dart";
import 'package:somerest/widgets/responsive.dart';

class SupportMessageWidget extends StatefulWidget {
  const SupportMessageWidget({super.key});

	@override
	SupportMessageState createState() => SupportMessageState();
}

class SupportMessageState extends State<SupportMessageWidget> {
	final TextEditingController _messageController = TextEditingController();
	final TextEditingController _nameController = TextEditingController();
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _subjectController = TextEditingController();
	
	@override
	Widget build(BuildContext context) {
		final screenSize = MediaQuery.of(context).size;

		return Container(
			margin: const EdgeInsets.only(top: 30, bottom: 30, left: 20,  right: 20),
			width: screenSize.width * 0.95,
			padding: ResponsiveWidget.isSmallScreen(context) ? const EdgeInsets.only(top: 10, bottom: 10, left:  20, right: 20) : const EdgeInsets.only(top: 10, bottom: 10, left:  50, right: 50),
			decoration: BoxDecoration(
				border: Border.all(
					color: Colors.blueGrey,
					width: 2,
				),
				borderRadius: const BorderRadius.all(Radius.circular(10)),
			),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: ResponsiveWidget.isLargeScreen(context)
					? 
					
					[
						const Text("Leave a message",
							textAlign: TextAlign.start,
							style: TextStyle(
								color: Colors.black,
								fontSize: 18,
								fontWeight: FontWeight.w700
							)
						),

						Container(
							margin: const EdgeInsets.only(top: 40),
							child: Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
								SizedBox(
									width: screenSize.width * 0.43,
									child: TextField(
										cursorColor: Colors.blue,
										controller: _nameController,
										decoration: const InputDecoration(
											labelText: "Name",
											hintText: "Required",
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

								SizedBox(
									width: screenSize.width * 0.43,
									child: TextField(
										cursorColor: Colors.blue,
										controller: _emailController,
										decoration: const InputDecoration(
											labelText: "Email",
											hintText: "Required",
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
								)
							],
							)
						),


						// The subject field
						Container(
							margin: const EdgeInsets.only(top: 20),
							width: screenSize.width * 0.9,
							child: TextField(
								cursorColor: Colors.blue,
								controller: _subjectController,
								decoration: const InputDecoration(
									labelText: "Subject",
									hintText: "Required",
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

						// The Message Body
						Container(
							margin: const EdgeInsets.only(top: 20),
							height: screenSize.height * 0.25,
							width: screenSize.width * 0.9,
							child: TextField(
								maxLines: 12,
								cursorColor: Colors.blue,
								controller: _messageController,
								decoration: const InputDecoration(
									labelText: "Your Message",
									hintText: "Required",
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

						Container(
							padding: const EdgeInsets.all(10),
							margin: const EdgeInsets.only(top: 30),
							decoration: const BoxDecoration(
								color: Colors.blue,
								borderRadius: BorderRadius.all(Radius.circular(10))
							),
							child: TextButton(
								onPressed: () {
									var name = _nameController.text;
									var email = _emailController.text;
									var subject = _subjectController.text;
									var message = _messageController.text;

									// After everything, reorder the state of the widget
									setState(() {
										_nameController.text = "";
										_emailController.text = "";
										_subjectController.text = "";
										_messageController.text = "";
									});
								},
						
								child: const Text(
									"Submit",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 18,
										color: Colors.white
									)
								)
							),
						)
					]

					// For smaller screens
					: [
						const Text("Leave a message",
							textAlign: TextAlign.start,
							style: TextStyle(
								color: Colors.black,
								fontSize: 18,
								fontWeight: FontWeight.w700
							)
						),
						
						Container (
							margin: const EdgeInsets.only(top: 30),
							width: screenSize.width * 0.9,
							child: TextField(
								cursorColor: Colors.blue,
								controller: _nameController,
								decoration: const InputDecoration(
									labelText: "Name",
									hintText: "Required",
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

						Container(
							margin: const EdgeInsets.only(top: 15),
							width: screenSize.width * 1,
							child: TextField(
								cursorColor: Colors.blue,
								controller: _emailController,
								decoration: const InputDecoration(
									labelText: "Email",
									hintText: "Required",
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

						Container(
							margin: const EdgeInsets.only(top: 15),
							width: screenSize.width * 0.9,
							child: TextField(
								cursorColor: Colors.blue,
								controller: _subjectController,
								decoration: const InputDecoration(
									labelText: "Subject",
									hintText: "Required",
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

						// The Message Body
						Container(
							margin: const EdgeInsets.only(top: 15),
							height: screenSize.height * 0.25,
							width: screenSize.width * 0.9,
							child: TextField(
								maxLines: 12,
								cursorColor: Colors.blue,
								controller: _messageController,
								decoration: const InputDecoration(
									labelText: "Your Message",
									hintText: "Required",
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

						Container(
							padding: const EdgeInsets.all(10),
							margin: const EdgeInsets.only(top: 30),
							decoration: const BoxDecoration(
								color: Colors.blue,
								borderRadius: BorderRadius.all(Radius.circular(10))
							),
							child: TextButton(
								onPressed: () {
									var name = _nameController.text;
									var email = _emailController.text;
									var subject = _subjectController.text;
									var message = _messageController.text;

									// After everything, reorder the state of the widget
									setState(() {
										_nameController.text = "";
										_emailController.text = "";
										_subjectController.text = "";
										_messageController.text = "";
									});
								},
						
								child: const Text(
									"Submit",
									textAlign: TextAlign.start,
									style: TextStyle(
										fontSize: 18,
										color: Colors.white
									)
								)
							),
						)
					],
			)
		);
	}

}