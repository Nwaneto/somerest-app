import 'package:flutter/material.dart';

class NotificationHelper {
	static void showError(BuildContext context, String message) {
		ScaffoldMessenger.of(context).showSnackBar(
			SnackBar(
				duration: const Duration(seconds: 5),
				behavior: SnackBarBehavior.floating,
				backgroundColor: Colors.transparent,
				elevation: 0,
				content: Container(
					padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
					height: 100,
					decoration: BoxDecoration(
						color: Colors.red,
						borderRadius: BorderRadius.circular(10),
					),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							const Text(
								"An Error Occurred!",
								style: TextStyle(
									fontSize: 18,
									fontWeight: FontWeight.w600,
									color: Colors.white
								)
							),

							Text(
								message,
								maxLines: 4,
								style: const TextStyle(
									fontSize: 13,
									color: Colors.white,
									overflow: TextOverflow.ellipsis
								),
							),
						],
					)
				)
			)
		);
	}


	static void showSuccessful(BuildContext context, String message) {
		ScaffoldMessenger.of(context).showSnackBar(
			SnackBar(
				duration: const Duration(seconds: 5),
				behavior: SnackBarBehavior.floating,
				backgroundColor: Colors.transparent,
				elevation: 0,
				content: Container(
					padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
					height: 100,
					decoration: BoxDecoration(
						color: Colors.green,
						borderRadius: BorderRadius.circular(10),
					),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							const Text(
								"Operation Successful",
								style: TextStyle(
									fontSize: 18,
									fontWeight: FontWeight.w600,
									color: Colors.white
								)
							),

							Text(
								message,
								maxLines: 4,
								style: const TextStyle(
									fontSize: 13,
									color: Colors.white,
									overflow: TextOverflow.ellipsis
								),
							),
						],
					)
				)
			)
		);
	}
}
