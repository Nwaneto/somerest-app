import 'package:flutter/material.dart';
import 'package:somerest/pages/contact_page.dart';
import 'package:somerest/pages/find_a_job.dart';
import 'package:somerest/pages/home_page.dart';
import 'package:somerest/pages/request_meeting.dart';
import 'package:somerest/pages/services_page.dart';
import 'package:somerest/pages/about_page.dart';
import 'package:somerest/services/background_checks.dart';
import 'package:somerest/services/branding.dart';
import 'package:somerest/services/event_planning.dart';
import 'package:somerest/services/ict.dart';
import 'package:somerest/services/project_management.dart';
import 'package:somerest/services/recruitment.dart';
import 'package:somerest/subs/login.dart';
import 'package:somerest/subs/meet_ceo.dart';
import 'package:somerest/subs/submit_resume.dart';

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

			// Each service in turn.
			case "/services/recruitment": {
				return MaterialPageRoute(builder: (_) => const Recruitment());
			}

			case "/services/project": {
				return MaterialPageRoute(builder: (_) => const ProjectManagement());
			}

			case "/services/ict": {
				return MaterialPageRoute(builder: (_) => const ICT());
			}

			case "/services/checks": {
				return MaterialPageRoute(builder: (_) => const BackgroundChecks());
			}

			case "/services/branding": {
				return MaterialPageRoute(builder: (_) => const Branding());
			}

			case "/services/events": {
				return MaterialPageRoute(builder: (_) => const EventPlanning());
			}

			case '/contact':
			case "\\contact": {
				return MaterialPageRoute(builder: (_) => const ContactPage());
			}

			case "/request_meeting":
			case "\\request_meeting": {
				return MaterialPageRoute(builder: (_) => const RequestMeeting());
			}

			case "/submit_cv":
			case "\\submit_cv": {
				return MaterialPageRoute(builder: (_) => const SubmitResume());
			}

			case "/login":
			case "\\login": {
				return MaterialPageRoute(builder: (_) => const Login());
			}

			case "/ceo":
			case "\\ceo": {
				return MaterialPageRoute(builder: (_) => const MeetCEO());
			}

			case "/find_a_job": {
				return MaterialPageRoute(builder: (_) => const FindJob());
			}

			default: {
				return MaterialPageRoute(builder: (_) => const HomePage());
			}
		}
	}
}