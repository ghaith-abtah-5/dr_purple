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

/// appointments

List<AppointmentData> appointmentDataList() {
  List<AppointmentData> list = [];
  list.add(
    AppointmentData(
      date: '10',
      month: 'February',
      doctor: 'Dr. Sedra Sedra',
      department: 'Cosmetologist',
      patient: 'Sedra Sedra',
      service: 'Filler',
    ),
  );
  list.add(
    AppointmentData(
      date: '12',
      month: 'February',
      doctor: 'Dr. Sedra Sedra',
      department: 'Cosmetologist',
      patient: 'Sedra Sedra ',
      service: 'Liposuction',
    ),
  );
  list.add(
    AppointmentData(
      date: '10',
      month: 'January',
      doctor: 'Dr. Sedra Sedra',
      department: 'Cosmetologist',
      patient: 'Sedra Sedra ',
      service: 'Filler',
    ),
  );
  list.add(
    AppointmentData(
      date: '12',
      month: 'January',
      doctor: 'Dr. Sedra Sedra',
      department: 'Cosmetologist',
      patient: 'Sedra Sedra ',
      service: 'Nose reshaping',
    ),
  );
  list.add(
    AppointmentData(
      date: '10',
      month: 'January',
      doctor: 'Dr. Sedra Sedra',
      department: 'Cosmetologist',
      patient: 'Sedra Sedra ',
      service: 'Facelift',
    ),
  );
  return list;
}

class AppointmentData {
  String service;
  String date;
  String month;
  String doctor;
  String patient;
  String department;

  AppointmentData({
    required this.service,
    required this.date,
    required this.month,
    required this.doctor,
    required this.patient,
    required this.department,
  });
}
/// hospital