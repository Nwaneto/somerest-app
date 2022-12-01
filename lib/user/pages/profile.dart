import 'package:flutter/material.dart';
import 'package:somerest/user/data/post.dart';

class UserProfile extends StatefulWidget {
	@override
	UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
	List<SomerestPost> _posts = List.empty(growable: true);

	@override
	void initState() {
		super.initState();

	}

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;
		return Center(child: Text("Profile"));
	}
}