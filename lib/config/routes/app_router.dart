// Import necessary packages and files
import 'package:chat_gpt/config/routes/routes.dart';
import 'package:chat_gpt/core/observers/router_observer.dart';
import 'package:chat_gpt/features/splash/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Define the AppRouter class
class AppRouter {
  // Create a GoRouter instance
  final GoRouter router = GoRouter(
    // navigatorKey: navigatorKey,
    initialLocation: Routes.initialRoute,
    observers: [
      GoRouterObserver(), // Specify your observer here
    ],
    routes: [
      // Define routes using GoRoute
      GoRoute(
        path: Routes.initialRoute,
        builder: (context, state) {
          // Return the SplashScreen widget
          return const SplashScreen();
        },
      ),
    ],
  );

  // Define a static method for the "Un Found Route" page
  static Widget unFoundRoute() {
    return const Scaffold(
      body: Center(
        child: Text(
          "Un Found Route",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({Key? key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0, 1.5), // Start from bottom
                  end: Offset.zero, // End at the top
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        );
}
