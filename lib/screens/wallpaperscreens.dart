import 'package:flutter_cached_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:merawall/controller/controller_model_api_data.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class wallpaperscreen extends StatefulWidget {
  const wallpaperscreen({super.key});

  get currentPhoto => currentPhoto.urls;



  @override
  State<wallpaperscreen> createState() => _wallpaperscreenState();
}

//colorplate: https://colorhunt.co/palette/d2ff7273ec8b54c39215b392
class _wallpaperscreenState extends State<wallpaperscreen> {
  UnsplashApiData unsplashApiData = Get.put(UnsplashApiData());
    Future<void> setwallpaper() async {
      int location = WallpaperManager.BOTH_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(widget.currentPhoto.urls);
      bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "MeraWall",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffD2FF72),
              letterSpacing: 1),
        )),
        backgroundColor: Colors.black38,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Obx(() => Container(
              child:  UnsplashApiData.isDataLoaded.value == true
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              childAspectRatio: 2 / 3,
                              mainAxisSpacing: 2),
                      itemCount: UnsplashApiData.photos.length,
                      itemBuilder: (context, index) {
                        var currentPhoto = UnsplashApiData.photos[index];
                        return Card(
                          elevation: 2,
                          child: Stack( // Use Stack for overlapping widgets
                            children: [
                              Image.network(
                                currentPhoto.urls['small']!,
                                fit: BoxFit.fill,
                                width: double.infinity, // Ensure image fills card width
                                height: double.infinity, // Ensure image fills card height
                              ),
                              Positioned( // Position button within the card
                                bottom: 10, // Adjust position as needed (e.g., bottom, right)
                                right: 10, // Adjust position as needed (e.g., bottom, right)
                                child: ElevatedButton(
                                  onPressed: () {
                                    setwallpaper();
                                    // Handle button press action (e.g., navigate, show details)
                                    print('Button pressed for ${currentPhoto.id}');
                                  },
                                  child: Text('Set'), // Button text
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black54, // Customize button appearance
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                  : Center(child: CircularProgressIndicator()
              ),

              ),
            ),
            ),

          ],
        ),
      ),
    );
  }
}
