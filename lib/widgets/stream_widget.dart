import 'package:flutter/material.dart';
import 'package:watertcmapp/widgets/custom_text.dart';



class StreamWidget<T> extends StatelessWidget {
  final Function(dynamic data)? onError;
  final Function(dynamic data) data;
  final Stream<T> stream;
  final Function()? loading;

  const StreamWidget(
      {Key? key,
      required this.onError,
      required this.data,
      required this.stream,
      this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (
        BuildContext context,
        AsyncSnapshot<T> snapshot,
      ) {
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
