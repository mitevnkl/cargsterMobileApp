import 'package:booking_sdk/models/PhoneContactEntity.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:permission_handler/permission_handler.dart';

class PhoneCore {
  static Future<Iterable<PhoneContactEntity>> getContacts(String value) async {
    if (await Permission.contacts.request().isGranted) {
      // Get all contacts on device
      Iterable<Contact> contacts =
          await ContactsService.getContacts(query: value);
      // TODO remove limit of 10.
      Iterable<PhoneContactEntity> phoneContacts =
          contacts.map<PhoneContactEntity>((Contact contact) {
        return new PhoneContactEntity(
            contact.displayName,
            contact.phones.length > 0
                ? contact.phones.first.value.toString()
                : null);
      }).take(30);
      return phoneContacts;
    } else {
      throw new Exception('permission denied');
    }
  }

  static Future<void> sendSms(
      List<PhoneContactEntity> contacts, String smsText) async {
    List<String> recipients =
        contacts.map<String>((PhoneContactEntity contact) {
      return contact.phone;
    }).toList();

    String _result = await sendSMS(message: smsText, recipients: recipients)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}
