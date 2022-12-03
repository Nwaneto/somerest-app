import 'package:flutter/material.dart';
import 'package:somerest/user/data/post.dart';

class UserNotifications extends StatefulWidget {
	@override
	UserNotificationsState createState() => UserNotificationsState();
}

class UserNotificationsState extends State<UserNotifications> {
	List<SomerestPost> _posts = List.empty(growable: true);

	@override
	void initState() {
		super.initState();

	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Center(child: Text("Application"));
	}
}