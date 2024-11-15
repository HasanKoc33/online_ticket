import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CapitalizeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";

  // Split the string into words
  List<String> words = value.split(" ");

  // Capitalize each word and join them with a space
  String capitalized = words.map((word) {
    if (word.isEmpty) return "";
    return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
  }).join(" ");

  return capitalized;
}

class PhoneTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text
        .replaceAll(RegExp(r'[^\d]'), ''); // Remove non-digit characters
    String formattedText = '';
    int selectionIndex = newValue.selection.end;

    if (newText.isEmpty) {
      return newValue.copyWith(
          text: '', selection: TextSelection.collapsed(offset: 0));
    }

    if (newText.length > 0) {
      formattedText += '(';
      if (selectionIndex >= 1) selectionIndex++;
    }
    if (newText.length > 3) {
      formattedText += newText.substring(0, 3) + ') ';
      if (selectionIndex > 3) selectionIndex += 2;
    } else {
      formattedText += newText;
      if (newText.length == 3) {
        formattedText += ') ';
        if (selectionIndex > 2) selectionIndex += 2;
      }
    }

    if (newText.length > 3) {
      int remainingLength = newText.length - 3;
      int segment1Length = remainingLength >= 3 ? 3 : remainingLength;
      formattedText += newText.substring(3, 3 + segment1Length);
      if (segment1Length == 3) {
        formattedText += ' ';
        if (selectionIndex > 6) selectionIndex++;
      }
      if (newText.length > 6) {
        int segment2Length = newText.length - 6;
        int segment2RemainingLength = segment2Length >= 2 ? 2 : segment2Length;
        formattedText += newText.substring(6, 6 + segment2RemainingLength);
        if (segment2RemainingLength == 2 && newText.length > 8) {
          formattedText += ' ';
          if (selectionIndex > 8) selectionIndex++;
        }
        if (newText.length > 8) {
          formattedText += newText.substring(8);
        }
      }
    }

    if (selectionIndex > formattedText.length) {
      selectionIndex = formattedText.length;
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
