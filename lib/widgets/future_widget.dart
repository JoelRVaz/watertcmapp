import 'package:flutter/material.dart';
import 'package:watertcmapp/widgets/custom_text.dart';


class FutureWidget<T> extends StatelessWidget {
  
  final Future<T> future;
  final Function(T data) data;
  final Function(dynamic data)? onError;
  final Function()? loading;

  const FutureWidget({ Key? key,
    required this.future,
    required this.data,
    this.onError,
    this.loading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("---------");
    return FutureBuilder<T>(
      future: future,
      builder:(context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          if (loading != null) {
            return loading!();
          } else {
          }
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return onError?.call(snapshot.error) ?? CustomText(text: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return data(snapshot.data as T);
        }     
        return const CustomText(text: 'text');
      }
    );
  }
}