import 'package:flutter/material.dart';
import 'package:somerest/user/data/post.dart';

class JobListing extends StatefulWidget {
	@override
	JobListingState createState() => JobListingState();
}

class JobListingState extends State<JobListing> {
	late List<SomerestPost> _posts;
	late int _jobCount;
	late String _jobCountString;

	@override
	void initState() {
		super.initState();
		_posts = List.empty(growable: true);
		_jobCount = 0;
		_jobCountString = "0 jobs in Nigeria";
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
			child: Column(
				children: [
					Align(
						alignment: Alignment.centerLeft,
						child: Text(
						_jobCountString,
						textAlign: TextAlign.start,
						style: const TextStyle(
							fontWeight: FontWeight.w700
						)
					)),

					// ListView.builder(itemBuilder: buildList)
				],
			),
		);
	}
}