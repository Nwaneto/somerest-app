import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:somerest/widgets/responsive.dart';

class SomerestMaps extends StatefulWidget {
	const SomerestMaps({super.key});

	@override
	SomerestMapsState createState() => SomerestMapsState();
}

class SomerestMapsState extends State<SomerestMaps> {
	late GoogleMapController mapController;
	List<Marker> _markers = [];
	bool showMaps = true;

	@override
	Widget build(BuildContext context) {
		var screenSize = MediaQuery.of(context).size;

		return Padding(
			padding: const EdgeInsets.all(20),
			child: 
			
			// If the map can be show right now.
			showMaps
			
			?

			Container(
				height: ResponsiveWidget.isSmallScreen(context) ? screenSize.height * 0.7 : screenSize.height * 0.8,
				width: ResponsiveWidget.isSmallScreen(context) ? screenSize.width * 0.9 : screenSize.width * 0.45,
				decoration: BoxDecoration(
					borderRadius: BorderRadius.circular(10)
				),
				child: GoogleMap(
					rotateGesturesEnabled: true,
					zoomGesturesEnabled: true,
					scrollGesturesEnabled: true,
					markers: Set<Marker>.of(_markers),
					mapType: MapType.terrain,
					initialCameraPosition: const CameraPosition(
						target: LatLng(59.948600, 11.010630),
					),

					onMapCreated: ((controller) {
						setState(() {
						  mapController = controller;
						});
					}),
				),
			)

			:

			const CircularProgressIndicator(
				color: Colors.blue
			)
		);
	}

	@override
	void initState() {
		super.initState();

		_markers.add(const Marker(
			markerId: MarkerId("myLocation"),
			position: LatLng(59.948600, 11.010630)
		));

		if(_markers.isNotEmpty) {
			setState(() {
			  showMaps = true;
			});
		}
	}
}