import 'package:flutter/material.dart';
import 'package:flutter/physics.dart'; 

class SpringPageRoute extends PageRouteBuilder {
  final Widget page;

  SpringPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            
            const spring = SpringDescription(
              mass: 1,
              stiffness: 45,
              damping: 15,
            );
            final simulation = SpringSimulation(spring, 0, 1, 0);

            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), 
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linearToEaseOut,
                ),
              ),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 800),
        );
}