import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

void mesaj(BuildContext context, String mes, {Color? color}) {
  Fluttertoast.showToast(msg: mes, toastLength: Toast.LENGTH_LONG, backgroundColor: color ?? Theme.of(context).colorScheme.primary, timeInSecForIosWeb: 1);
}

void mesajj(String mes, {Color? color}) {
  Fluttertoast.showToast(msg: mes, toastLength: Toast.LENGTH_LONG, backgroundColor: color ?? Colors.blue, timeInSecForIosWeb: 1);
}

void hataMesaji(String mes) {
  Fluttertoast.showToast(msg: mes, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red, timeInSecForIosWeb: 1);
}

Future<void> bildiri(BuildContext context, String mes) async {
  await showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      content: Text(
        mes,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
      ),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("TAMAM"))
      ],
    ),
    barrierDismissible: true,
  );
}

Future<void> hataBildiri(BuildContext context, String mes) async {
  await showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      content: Column(
        children: [
          const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 50,
          ),
          Text(
            mes,
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("TAMAM"))
      ],
    ),
    barrierDismissible: true,
  );
}

Future<void> bildiriProgres(BuildContext context, String mes) async {
  await showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      content: Column(
        children: [
          Text(
            mes,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          )
        ],
      ),
    ),
    barrierDismissible: false,
  );
}

Future<bool> bildiriCevap(BuildContext context, String mes) async {
  return await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          content: Text(
            mes,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("HAYIR")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text("EVET"))
          ],
        ),
        barrierDismissible: true,
      ) ??
      false;
}
