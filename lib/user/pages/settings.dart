import 'package:flutter/material.dart';
import 'package:somerest/user/data/post.dart';

class UserSettings extends StatefulWidget {
	@override
	UserSettingsState createState() => UserSettingsState();
}

class UserSettingsState extends State<UserSettings> {
	List<SomerestPost> _posts = List.empty(growable: true);

	@override
	void initState() {
		super.initState();

	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Center(child: Text("Settings"));
	}
}