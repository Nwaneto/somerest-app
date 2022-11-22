import 'package:flutter/material.dart';
import 'package:somerest/pages/contact_page.dart';
import 'package:somerest/pages/home_page.dart';
import 'package:somerest/pages/services_page.dart';
import 'package:somerest/pages/about_page.dart';

class RouterGenerator {
	static Route<dynamic> generateRoute(RouteSettings settings) {
		final args = settings.arguments;

		switch(settings.name) {
			case "/about":
			case "\\about": {
				return MaterialPageRoute(builder: (_) => const AboutPage());
			}

			case "/services":
			case "\\services": {
				return MaterialPageRoute(builder: (_) => const ServicesPage());
			}

			case '/contact':
			case "\\contact": {
				return MaterialPageRoute(builder: (_) => const ContactPage());
			}

			default: {
				return MaterialPageRoute(builder: (_) => const HomePage());
			}
		}
	}
}