import 'package:flutter/material.dart';
import 'package:somerest/user/data/post.dart';

class UserLogout extends StatefulWidget {
	@override
	UserLogoutState createState() => UserLogoutState();
}

class UserLogoutState extends State<UserLogout> {
	List<SomerestPost> _posts = List.empty(growable: true);

	@override
	void initState() {
		super.initState();

	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Center(child: Text("Logout"));
	}
}