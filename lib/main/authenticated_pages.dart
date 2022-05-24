import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticatedPages extends ConsumerStatefulWidget {
  const AuthenticatedPages({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthenticatedPagesState();
}

class _AuthenticatedPagesState extends ConsumerState<AuthenticatedPages> {

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}