import 'package:flutter/material.dart';
import 'package:movie_application/core/assets.dart';
import 'package:movie_application/core/extensions.dart';
import 'package:movie_application/model/bottom_nav_model.dart';
import 'package:movie_application/screens/dashboard_screen.dart';
import 'package:movie_application/screens/media_screen.dart';
import 'package:movie_application/screens/movies_listing_screen.dart';
import 'package:movie_application/screens/profile_screen.dart';

class BottomNavigationProvider extends ChangeNotifier {
  static final List<BottomNavModel> items = [
    BottomNavModel(
      label: BottomNavItems.dashboard.name.capitalize(),
      index: BottomNavItems.dashboard.index,
      image: AppAssets.dashboardIcon,
      route: const DashboardScreen(),
    ),
    BottomNavModel(
      label: BottomNavItems.profile.name.capitalize(),
      index: BottomNavItems.profile.index,
      image: AppAssets.youtubeIcon,
      route: const ProfileScreen(),
    ),
    BottomNavModel(
      label: BottomNavItems.media.name.capitalize(),
      index: BottomNavItems.media.index,
      image: AppAssets.mediaLibraryIcon,
      route: const MediaScreen(),
    ),
    BottomNavModel(
      label: BottomNavItems.list.name.capitalize(),
      index: BottomNavItems.list.index,
      image: AppAssets.listIcon,                
      route: const MoviesListingScreen(),            
    ),
  ];

  int selectedIndex = BottomNavItems.list.index;

  changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

enum BottomNavItems {
  dashboard,
  profile,

  media,
  list,
}
