
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';


class AsyncWidget<T> extends StatelessWidget {

  final AsyncValue<T> asyncValue;
  final Widget Function(T data) onData;
  final Widget Function(Object error, StackTrace? stack)? onError;
  final Widget Function()? loading;

  const AsyncWidget({ Key? key,
    required this.asyncValue,
    required this.onData,
    this.onError,
    this.loading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      data: (data) => onData(data), 
      error: (error, stack) => 
        onError?.call(error, stack) ?? CustomText(text: error.toString()),
      loading: () => loading?.call() ?? const Center(child: CircularProgressIndicator())
    );
  }
}