import 'package:dr_purple/app/app_configurations/assets.dart';
import 'package:flutter/material.dart';

List<NotificationData> notificationDataList() {
  List<NotificationData> list = [];
  list.add(
    NotificationData(
      image: Image.asset(ImageAssets.doctorImage, fit: BoxFit.fill),
      title: 'an appointment has been canceled',
      time: '3m ago',
    ),
  );
  list.add(
    NotificationData(
      image: Image.asset(ImageAssets.doctorImage, fit: BoxFit.fill),
      title: 'an appointment has been canceled',
      time: '3m ago',
    ),
  );
  list.add(
    NotificationData(
      image: Image.asset(ImageAssets.doctorImage, fit: BoxFit.fill),
      title: 'Vitamins are essential to human health.',
      time: 'Today at 2.20 AM',
    ),
  );
  list.add(
    NotificationData(
      image: Image.asset(ImageAssets.doctorImage, fit: BoxFit.fill),
      title:
          'Hey Sedra, This email confirms your Service Name appointment on Appointment Date Time Client',
      time: 'Today at 11.20 AM',
    ),
  );
  list.add(
    NotificationData(
      image: Image.asset(ImageAssets.doctorImage, fit: BoxFit.fill),
      title:
          'Hey Sedra, This email confirms your Service Name appointment on Appointment Date Time Client',
      time: '3m ago',
    ),
  );
  list.add(
    NotificationData(
      image: Image.asset(ImageAssets.doctorImage, fit: BoxFit.fill),
      title: 'an appointment has been canceled',
      time: '3m ago',
    ),
  );
  list.add(
    NotificationData(
      image: Image.asset(ImageAssets.doctorImage, fit: BoxFit.fill),
      title: 'an appointment has been canceled',
      time: '3m ago',
    ),
  );
  list.add(
    NotificationData(
      image: Image.asset(ImageAssets.doctorImage, fit: BoxFit.fill),
      title: 'Vitamins are essential to human health.',
      time: 'Today at 2.20 AM',
    ),
  );
  list.add(
    NotificationData(
      image: Image.asset(ImageAssets.doctorImage, fit: BoxFit.fill),
      title:
          'Hey Sedra, This email confirms your Service Name appointment on Appointment Date Time Client',
      time: 'Today at 11.20 AM',
    ),
  );
  list.add(
    NotificationData(
      image: Image.asset(ImageAssets.doctorImage, fit: BoxFit.fill),
      title:
          'Hey Sedra, This email confirms your Service Name appointment on Appointment Date Time Client',
      time: '3m ago',
    ),
  );
  return list;
}

class NotificationData {
  Image image;
  String title;
  String time;

  NotificationData(
      {required this.image, required this.title, required this.time});
}
