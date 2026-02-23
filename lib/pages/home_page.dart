import 'package:flutter/material.dart';
import '../widgets/connection_button.dart';
import '../widgets/server_card.dart';
import '../widgets/stats_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _isConnected = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _toggleConnection() {
    setState(() {
      _isConnected = !_isConnected;
      if (_isConnected) {
        _pulseController.repeat();
      } else {
        _pulseController.stop();
        _pulseController.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {},
        ),
        title: const Text(
          'V2rayZ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Connection status text
              Text(
                _isConnected ? 'Connected' : 'Disconnected',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _isConnected
                      ? const Color(0xFF4ADE80)
                      : colorScheme.onSurface.withAlpha(153),
                ),
              ),
              const SizedBox(height: 8),
              if (_isConnected)
                Text(
                  '00:12:34',
                  style: TextStyle(
                    fontSize: 13,
                    color: colorScheme.onSurface.withAlpha(102),
                  ),
                ),

              const SizedBox(height: 32),

              // Connection button
              ConnectionButton(
                isConnected: _isConnected,
                pulseController: _pulseController,
                onTap: _toggleConnection,
              ),

              const SizedBox(height: 40),

              // Server card
              const ServerCard(
                serverName: 'Tokyo - Server 01',
                serverFlag: '\u{1F1EF}\u{1F1F5}',
                protocol: 'VMess',
                ping: '42ms',
              ),

              const SizedBox(height: 12),

              // Stats
              const Row(
                children: [
                  Expanded(
                    child: StatsCard(
                      icon: Icons.arrow_downward_rounded,
                      label: 'Download',
                      value: '0.00',
                      unit: 'KB/s',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: StatsCard(
                      icon: Icons.arrow_upward_rounded,
                      label: 'Upload',
                      value: '0.00',
                      unit: 'KB/s',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Data usage card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.data_usage_rounded,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Data Used',
                        style: TextStyle(
                          color: colorScheme.onSurface.withAlpha(178),
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '0.00 MB',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF1A1A2E),
        indicatorColor: colorScheme.primary.withAlpha(38),
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.dns_outlined),
            selectedIcon: Icon(Icons.dns_rounded),
            label: 'Servers',
          ),
          NavigationDestination(
            icon: Icon(Icons.insert_chart_outlined_rounded),
            selectedIcon: Icon(Icons.insert_chart_rounded),
            label: 'Logs',
          ),
          NavigationDestination(
            icon: Icon(Icons.tune_outlined),
            selectedIcon: Icon(Icons.tune_rounded),
            label: 'Config',
          ),
        ],
        onDestinationSelected: (_) {},
      ),
    );
  }
}
