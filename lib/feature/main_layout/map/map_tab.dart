import 'package:event_app/core/resources/colors_manager.dart';
import 'package:event_app/providers/map_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    MapTabProvider provider = Provider.of<MapTabProvider>(context);
    return ChangeNotifierProvider(
      create: (context)=>MapTabProvider(),
      child: Scaffold(
        body: Column(
          children: [
           Expanded(child: GoogleMap(
             mapType: MapType.hybrid,
             markers: provider.markers,
               initialCameraPosition: provider.cameraPosition,
               onMapCreated: (controller) {
                 provider.mapController = controller;
               },

           )
           )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)
          ),

          onPressed: (){
            provider.getUserLocation();
          },
          backgroundColor: ColorsManager.grey,
          foregroundColor: ColorsManager.darkBlue,
        child: Icon(Icons.gps_fixed),
        ),
      ),
    );
  }
}
