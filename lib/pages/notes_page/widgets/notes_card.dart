import 'package:flutter/material.dart';
import 'package:watertcmapp/models/Note.dart';
import 'package:watertcmapp/widgets/custom_text/custom_text.dart';

class DeviceCard extends StatelessWidget {
  final Note note;
  const DeviceCard({Key? key, 
    required this.note
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(66, 22, 22, 22),
      child: InkWell(
        child: CustomText(text: note.title, size: 17),
        onTap: () {

        },
      ),
    );
  }
}
