import 'package:flutter/material.dart';
import 'package:somerest/user/data/post.dart';

class UserPreferences extends StatefulWidget {
	@override
	UserPreferencesState createState() => UserPreferencesState();
}

class UserPreferencesState extends State<UserPreferences> {
	List<SomerestPost> _posts = List.empty(growable: true);

	@override
	void initState() {
		super.initState();

	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Center(child: Text("Preferences"));
	}
}