import 'package:flutter/material.dart';
import 'package:somerest/user/data/post.dart';

class UserHome extends StatefulWidget {
	@override
	UserHomeState createState() => UserHomeState();
}

class UserHomeState extends State<UserHome> {
	List<SomerestPost> _posts = List.empty(growable: true);

	@override
	void initState() {
		super.initState();

	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Center(child: Text("Dashoboard"));
	}
}