import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp/providers/device/device_provider.dart';

class RegisterDeviceForm extends ConsumerStatefulWidget {
  final Function(bool success, String device)? onFinish;
  const RegisterDeviceForm({Key? key, this.onFinish}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegisterDeviceFormState();
}

class _RegisterDeviceFormState extends ConsumerState<RegisterDeviceForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController serialNumberInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Serial #"),
            // The validator receives the text that the user has entered.
            controller: serialNumberInput,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ref
                      .watch(deviceProvider.notifier)
                      .httpDevice
                      .commands
                      .registerDevice(serialNumberInput.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  widget.onFinish?.call(true, serialNumberInput.text);
                  context.router.popTop();
                  context.router.pushNamed('/devices');
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
