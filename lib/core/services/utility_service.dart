import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';
import 'package:paytex/shared/utils/dims.dart';
import 'package:paytex/shared/utils/styles.dart';

import '../../shared/utils/color.dart';

class UtilitiesService {
  bool isValidEmail(String email) {
    if (email == null || email.isEmpty) {
      return false;
    }

    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool validateEmailStructure(String? value) {
    //allows _ as part of special character
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[a-zA-Z0-9_\-=@,\.;]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value!);
  }

  bool isPreviousDay(DateTime d1, DateTime d2) {
    final DateTime prevDay = d2.subtract(const Duration(days: 1));
    return isSameDay(d1, prevDay);
  }

  bool isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  static String timeAgoNew(DateTime date, {bool numericDates = true}) {
    if (date == null) {
      return 'Invalid date';
    }

    final DateTime date2 = DateTime.now();
    final Duration difference = date2.difference(date);

    if ((difference.inDays / 365).floor() >= 2) {
      return 'm ${(difference.inDays / 365).floor()} years ago';
    } else if ((difference.inDays / 365).floor() >= 1) {
      return numericDates ? 'l 1 year ago' : 'l Last year';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return 'k ${(difference.inDays / 365).floor()} months ago';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return numericDates ? 'j 1 month ago' : 'j Last month';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return 'i ${(difference.inDays / 7).floor()} weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return numericDates ? 'h 1 week ago' : 'h Last week';
    } else if (difference.inDays >= 2) {
      return 'g ${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return numericDates ? 'f 1 day ago' : 'f Yesterday';
    } else if (difference.inHours >= 2) {
      return 'e ${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return numericDates ? 'd 1 hour ago' : 'd An hour ago';
    } else if (difference.inMinutes >= 2) {
      return 'c ${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return numericDates ? 'b 1 minute ago' : 'b A minute ago';
    } else if (difference.inSeconds >= 3) {
      return 'a2 ${difference.inSeconds} seconds ago';
    } else {
      return 'a1 Just now';
    }
  }

  static String timeAgo(DateTime date, {bool numericDates = true}) {
    if (date == null) {
      return 'Invalid date';
    }

    final DateTime date2 = DateTime.now();
    final Duration difference = date2.difference(date);

    if ((difference.inDays / 365).floor() >= 2) {
      return 'm ${(difference.inDays / 365).floor()} years ago';
    } else if ((difference.inDays / 365).floor() >= 1) {
      return numericDates ? 'l 1 year ago' : 'l Last year';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return 'k ${(difference.inDays / 365).floor()} months ago';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return numericDates ? 'j 1 month ago' : 'j Last month';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return 'i ${(difference.inDays / 7).floor()} weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return numericDates ? 'h 1 week ago' : 'h Last week';
    } else if (difference.inDays >= 2) {
      return 'g ${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return numericDates ? 'f 1 day ago' : 'f Yesterday';
    } else if (difference.inHours >= 2) {
      return 'e ${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return numericDates ? 'd 1 hour ago' : 'd An hour ago';
    } else if (difference.inMinutes >= 2) {
      return 'c ${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return numericDates ? 'b 1 minute ago' : 'b A minute ago';
    } else if (difference.inSeconds >= 3) {
      return 'a2 ${difference.inSeconds} seconds ago';
    } else {
      return 'a1 Just now';
    }
  }

  static DateTime toDateTime(dynamic data) {
    try {
      if (data == null) {
        return null!;
      } else if (data is String) {
        return DateTime.parse(data);
      } else if (data is DateTime) {
        return data;
      } else if (data is int) {
        return DateTime.fromMillisecondsSinceEpoch(data);
      } else {
        // print(data);
        return null!;
      }
    } catch (e) {
      // print(e);

      return null!;
    }
  }

  String formatDate(DateTime date, [String? fmt, bool custom = false]) {
    if (custom) {
      final DateTime today = DateTime.now();
      final DateTime yesterday =
          DateTime(today.year, today.month, today.day - 1);
      final DateTime tomorrow =
          DateTime(today.year, today.month, today.day + 1);

      if (isSameDay(date, today)) {
        return 'Today';
      } else if (isSameDay(date, yesterday)) {
        return 'Yesterday';
      } else if (isSameDay(date, tomorrow)) {
        return 'Tomorrow';
      } else {
        return intl.DateFormat(fmt ?? 'dd-MMM-yyyy').format(date);
      }
    } else {
      return intl.DateFormat(fmt ?? 'dd-MMM-yyyy').format(date);
    }
  }

  int getAge(DateTime date) {
    final DateTime now = DateTime.now();

    return now.year - date.year;
  }

  List<List<T>> chunks<T>(List<T> arr, int size) {
    final List<List<T>> chunks = <List<T>>[];

    for (int i = 0; i < arr.length; i += size) {
      chunks.add(arr.sublist(i, i + size > arr.length ? arr.length : i + size));
    }
    return chunks;
  }

  static Widget progress(
      {String? text,
      required Color color,
      required double size,
      required double parentHeight}) {
    return Container(
      height: parentHeight,
      child: Center(
        child: text == null
            ? Container(
                width: Dims.dx(size ?? 100),
                height: Dims.dx(size ?? 100),
                child: const CircularProgressIndicator(),
              )
            : Styles.bold(text, color: color),
      ),
    );
  }

  static Widget progressImg({required double s}) {
    return Center(
      child: Image.asset(
        'assets/images/progress.gif',
        width: s,
      ),
    );
  }

  static void removeFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  String capitaliseFirstLetters(String value) {
    return value.toLowerCase().split(' ').map((String word) {
      final String leftText =
          (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  static String getInitials(String firstName, String lastName) {
    String initials = "";
    initials += firstName.substring(0, 1);
    initials += lastName.substring(0, 1);

    return initials.toUpperCase();
  }

  static String getSingleInitial(String firstName) {
    String initials = "";
    initials += firstName.substring(0, 1);
    // initials += lastName.substring(0, 1);

    return initials.toUpperCase();
  }

  static Future<dynamic> selectDate(BuildContext context, bool endDate) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: endDate ? DateTime(2150) : DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white12,
              onSurface: textGrayScaleBlueColor,
            ),
            // dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );
    debugPrint("seer check==== ${picked?.toIso8601String()}");
    if (picked != null) {
      debugPrint("seer check ${picked.toIso8601String()}");

      return picked;
      // return dateFormatter(picked.toIso8601String());
      // return picked.toString();
      return picked.toString();
    }
    return null;
  }

  static String dateFormatter(String date) {
    var formatter = DateFormat('yyyy-MM-dd');
    DateTime dateTime = formatter.parse(date);
    String formatted = formatter.format(dateTime);
    var reformatDate = formatted.split("-");
    debugPrint("seer check $formatted -- $reformatDate");
    String formattedDate =
        reformatDate[2] + "/" + reformatDate[1] + "/" + reformatDate[0];

    // print(formattedDate);
    return formattedDate;
  }

  ///formats large figures(eg 5000 -> 5k
  static String formatFigure({required double largeFigure}) {
    String formattedNumber = NumberFormat.compact().format(largeFigure);
    return formattedNumber;
  }
}
