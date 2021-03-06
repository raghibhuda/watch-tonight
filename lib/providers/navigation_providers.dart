import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_tonight/models/screen.dart';
import 'package:watch_tonight/screens/first_screen.dart';
import 'package:watch_tonight/screens/pushed_screen.dart';
import 'package:watch_tonight/screens/root.dart';
import 'package:watch_tonight/screens/second_screen.dart';
import 'package:watch_tonight/screens/third_screen.dart';
import 'package:watch_tonight/views/exit_dialog.dart';

const FIRST_SCREEN = 0;
const SECOND_SCREEN = 1;
const THIRD_SCREEN = 2;

class NavigationProvider extends ChangeNotifier {
  static NavigationProvider of(BuildContext context) =>
      Provider.of<NavigationProvider>(context, listen: false);

  int _currentScreenIndex = FIRST_SCREEN;

  int get currentTabIndex => _currentScreenIndex;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print('Generating route: ${settings.name}');
    switch (settings.name) {
      case PushedScreen.route:
        return MaterialPageRoute(builder: (_) => PushedScreen());
      default:
        return MaterialPageRoute(builder: (_) => Root());
    }
  }

  final Map<int, Screen> _screens = {
    FIRST_SCREEN: Screen(
        title: 'First',
        child: FirstScreen(),
        initialRoute: FirstScreen.route,
        navigatorState: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case PushedScreen.route:
              return MaterialPageRoute(builder: (_) => PushedScreen());
            default:
              return MaterialPageRoute(builder: (_) => FirstScreen());
          }
        },
        scrollController: ScrollController()),
    SECOND_SCREEN: Screen(
        title: 'Second',
        child: SecondScreen(),
        initialRoute: SecondScreen.route,
        navigatorState: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            default:
              return MaterialPageRoute(builder: (_) => SecondScreen());
          }
        },
        scrollController: ScrollController()),
    THIRD_SCREEN: Screen(
        title: 'Third',
        child: ThirdScreen(),
        initialRoute: ThirdScreen.route,
        navigatorState: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            default:
              return MaterialPageRoute(builder: (_) => ThirdScreen());
          }
        },
        scrollController: ScrollController()),
  };

  List<Screen> get screens => _screens.values.toList();

  Screen get currentScreen => _screens[_currentScreenIndex];

  void setTab(int tab) {
    if (tab == currentTabIndex) {
      _scrollToStart();
    } else {
      _currentScreenIndex = tab;
      notifyListeners();
    }
  }

  void _scrollToStart() {
    if (currentScreen.scrollController != null &&
        currentScreen.scrollController.hasClients) {
      currentScreen.scrollController.animateTo(0,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  Future<bool> onWillPop(BuildContext context) async {
    final currentNavigatorState = currentScreen.navigatorState.currentState;

    if (currentNavigatorState.canPop()) {
      currentNavigatorState.pop();
      return false;
    } else {
      if (currentTabIndex != FIRST_SCREEN) {
        setTab(FIRST_SCREEN);
        notifyListeners();
        return false;
      } else {
        return await showDialog(
          context: context,
          builder: (context) => ExitAlertDialog(),
        );
      }
    }
  }
}
