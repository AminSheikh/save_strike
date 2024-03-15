import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routing/app_router.dart';

class SaveStrikeApp extends ConsumerWidget {
  const SaveStrikeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return MaterialApp.router(
      title: 'SaveStrike',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: ref.read(appRouterProvider).config(),
    );
  }
}


