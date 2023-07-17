import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../providers/bottom_navigation_provider.dart';
import '../providers/movie_provider.dart';
import '../providers/authentication_provider.dart';

class AppProviders {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => BottomNavigationProvider()),
    ChangeNotifierProvider(create: (_) => MovieProvider()),
    ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
  ];
}
