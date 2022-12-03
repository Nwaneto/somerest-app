import 'package:flutter/material.dart';
import 'package:somerest/user/data/post.dart';

class ApplicationTab extends StatefulWidget {
	@override
	ApplicationTabState createState() => ApplicationTabState();
}

class ApplicationTabState extends State<ApplicationTab> {
	@override
	void initState() {
		super.initState();
	}

	Widget buildList(BuildContext context, int count) {
		return Container(
			decoration: BoxDecoration(),
		);
	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;

		return Container(
			margin: const EdgeInsets.only(top: 20),
			width: screenSize.width * 0.5,
			child: 	Row()
		);
	}
}