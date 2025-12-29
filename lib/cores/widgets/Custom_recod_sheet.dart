import 'package:azkaar/features/azkarr/presentation/views/widgets/custom_recordRow.dart';
import 'package:flutter/material.dart';

class RecordSheet extends StatefulWidget {
  final int c1, c2, c3, c4, c5;
  final VoidCallback onDelete;

  const RecordSheet({
    super.key,
    required this.c1,
    required this.c2,
    required this.c3,
    required this.c4,
    required this.c5,
    required this.onDelete,
  });

  @override
  State<RecordSheet> createState() => _RecordSheetState();
}

class _RecordSheetState extends State<RecordSheet> {
  late int s1, s2, s3, s4, s5;

  @override
  void initState() {
    super.initState();
    s1 = widget.c1;
    s2 = widget.c2;
    s3 = widget.c3;
    s4 = widget.c4;
    s5 = widget.c5;
  }

  void deleteAll() {
    setState(() {
      s1 = s2 = s3 = s4 = s5 = 0;
    });
    widget.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: deleteAll,
                    child: const Icon(Icons.delete),
                  ),
                  const Spacer(),
                  const Text("سجل التسبيحات", style: TextStyle(fontSize: 20)),
                ],
              ),
              const SizedBox(height: 10),

              RecordRow(count: s1, name: ":استغفر الله"),
              RecordRow(count: s2, name: ":الحمد الله"),
              RecordRow(count: s3, name: ":سبحان الله"),
              RecordRow(count: s4, name: ":الله اكبر"),
              RecordRow(count: s5, name: ":لا اله الا الله"),

              const Divider(),

              Row(
                children: [
                  Text(
                    "${s1 + s2 + s3 + s4 + s5}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    ":اجمالي التسبيحات",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text("Close"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
