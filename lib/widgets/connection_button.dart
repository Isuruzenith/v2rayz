import 'package:flutter/material.dart';

class ConnectionButton extends StatelessWidget {
  final bool isConnected;
  final AnimationController pulseController;
  final VoidCallback onTap;

  const ConnectionButton({
    super.key,
    required this.isConnected,
    required this.pulseController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final connectedColor = const Color(0xFF4ADE80);
    final disconnectedColor = Theme.of(context).colorScheme.primary;
    final activeColor = isConnected ? connectedColor : disconnectedColor;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 160,
        height: 160,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Pulse ring (only when connected)
            if (isConnected)
              AnimatedBuilder(
                animation: pulseController,
                builder: (context, child) {
                  return Container(
                    width: 160 + (pulseController.value * 30),
                    height: 160 + (pulseController.value * 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: connectedColor
                            .withAlpha((100 * (1 - pulseController.value)).toInt()),
                        width: 2,
                      ),
                    ),
                  );
                },
              ),

            // Outer glow
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: activeColor.withAlpha(51),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),

            // Outer ring
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: activeColor.withAlpha(76),
                  width: 3,
                ),
              ),
            ),

            // Inner circle
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    activeColor,
                    activeColor.withAlpha(178),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: activeColor.withAlpha(76),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                isConnected
                    ? Icons.power_settings_new_rounded
                    : Icons.power_settings_new_rounded,
                color: Colors.white,
                size: 44,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
