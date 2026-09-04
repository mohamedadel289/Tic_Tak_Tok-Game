# Tic_Tak_Tok-Game

وصف قصير
مشروع لعبة Tic-Tac-Toe مع مكونات native (C++/CMake) وواجهة/جزء Dart/Flutter. هذا الريبو يحتوي على الكود المصدر، إعدادات البناء، وتعليمات التشغيل.

Prerequisites / المتطلبات
- CMake >= 3.15
- Compiler لـ C++ (g++/clang++)
- (اختياري) Flutter SDK لو واجهة Dart/Flutter موجودة: https://flutter.dev

البناء (Native C++ / CMake)
1. افتح طرفية في جذر المشروع.
2. قم بإنشاء مجلد build وبناء المشروع:
   mkdir -p build
   cd build
   cmake .. -DCMAKE_BUILD_TYPE=Release
   cmake --build . -- -j$(nproc)
3. لتشغيل الاختبارات (إن وُجدت):
   ctest --output-on-failure

تشغيل واجهة Dart / Flutter (إن وُجدت)
1. تأكد من تثبيت Flutter:
   flutter --version
2. من جذر المشروع (المجلد الذي يحتوي على pubspec.yaml):
   flutter pub get
   flutter run     # لتشغيل على محاكي/جهاز متصل
   flutter build apk   # مثال لبناء Android

هيكل مقترح للمجلدات
- /src            -> كود C++ الرئيسي
- /cpp_lib        -> أي مكتبات/Native code
- /flutter_app    -> مشروع Flutter (إن وُجد)
- /docs           -> توثيق إضافي، صور، أمثلة

المساهمة
- رجاءً افتح issue قبل العمل على ميزة كبيرة.
- اتبع قواعد الكود والـ formatting الموجودة في المشروع.

الرخصة
أضف LICENSE حسب اختيارك (مثلاً MIT أو Apache-2.0). هذا الملف مؤقت — حدده عند الإضافة.

Contact
- @mohamedadel289
