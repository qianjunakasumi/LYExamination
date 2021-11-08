import 'package:get/get.dart';

class AchievementController extends GetxController {
  late String id;
  late String name;
  late DateTime date;

  Rx<String> points = 'Loading'.obs;
  Rx<String> averagePoints = 'Loading'.obs;
  Rx<String> highestPoints = 'Loading'.obs;
  Rx<String> subjectPoints = 'Loading'.obs;
  Rx<String> point = 'Loading'.obs;
}
