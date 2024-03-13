import '/core/constants/app_constants.dart';
import '/core/utils/shared_storage.dart';
import 'package:flutter_fcm/flutter_fcm.dart';
import 'package:permission_handler/permission_handler.dart';


import '/features/notification/repository/notification_repository.dart';

class Messaging {
  static String? token;

  static Future<void> onNotificationReceived(RemoteMessage message) async {
    await Firebase.initializeApp();

    print('Handling a message ${message.messageId}');
  }

  static initFCM() async {
    print("jjjjjjjjjjjjjjjjj");
    print(Messaging.token);

    try {
     // Permission.notification.status.isGranted;
      await Permission.notification.request();

/*      print(await Permission.notification.status.isGranted );
      print(await Permission.notification.status.isRestricted);
      print(await Permission.notification.status.isDenied);
      print(await Permission.notification.status.isLimited);
      print(await Permission.notification.status.isPermanentlyDenied);
      print(await Permission.notification.status.isProvisional);*/
      await await FCM.initializeFCM(
        onNotificationReceived: onNotificationReceived,
        withLocalNotification: true,
        onNotificationPressed: (Map<String?, dynamic>? data) {
          // Notifications notification = Notifications.fromFCM(data);
          // NotificationMiddleware.forward(notification);
        },
        onTokenChanged: (String? token) {
          Messaging.token = token;

          if (SharedStorage.hasToken()) {
            SharedStorage.writeFcmToken(token);
            NotificationRepository.uploadNotificationsToken(Messaging.token);
          }
          print("==================================");
          print("token");
          print(token);
          print("==================================");
        },
        // TODO add this icon to android/app/src/main/res/drawable/ic_launcher.png
        icon: 'ic_launcher',
        navigatorKey: Keys.navigatorKey,
      );
    } catch (e) {
      print("eeeeeeeeeeeeeeeeee");
      print(e);
    }
  }
}
