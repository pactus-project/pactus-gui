import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:pactus_gui/src/core/di/locator.dart';
import 'package:pactus_gui/src/core/utils/storage_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  Future<void> prepareSharedPreferencesLocator() async {
    SharedPreferences.setMockInitialValues({});
    await setupSharedPreferences();
  }

  Future<void> cleanUpLocator() async {
    await GetIt.instance.reset();
  }

  group('StorageUtils Tests', () {
    test('save and load bool data', () async {
      await prepareSharedPreferencesLocator();
      StorageUtils.saveData('keyBool', true);
      final result = StorageUtils.getData<bool>('keyBool');
      expect(result, true);
      await cleanUpLocator();
    });

    test('save and load double data', () async {
      await prepareSharedPreferencesLocator();
      StorageUtils.saveData('keyDouble', 3.14);
      final result = StorageUtils.getData<double>('keyDouble');
      expect(result, 3.14);
      await cleanUpLocator();
    });

    test('save and load int data', () async {
      await prepareSharedPreferencesLocator();
      StorageUtils.saveData('keyInt', 42);
      final result = StorageUtils.getData<int>('keyInt');
      expect(result, 42);
      await cleanUpLocator();
    });

    test('save and load String data', () async {
      await prepareSharedPreferencesLocator();
      StorageUtils.saveData('keyString', 'Hello');
      final result = StorageUtils.getData<String>('keyString');
      expect(result, 'Hello');
      await cleanUpLocator();
    });

    test('save and load List<String> data', () async {
      await prepareSharedPreferencesLocator();
      StorageUtils.saveData('keyList', ['item1', 'item2']);
      final result = StorageUtils.getData<List<String>>('keyList');
      expect(result, ['item1', 'item2']);
      await cleanUpLocator();
    });

    // Error case: Retrieve non-existent key
    test('getData returns null for non-existent key', () async {
      await prepareSharedPreferencesLocator();
      final result = StorageUtils.getData<String>('nonExistentKey');
      expect(result, isNull);
      await cleanUpLocator();
    });

    // Error case: Retrieve value with incorrect type
    test('getData throws error for incorrect type', () async {
      SharedPreferences.setMockInitialValues({'keyInt': 42});
      await setupSharedPreferences();
      expect(
        () => StorageUtils.getData<String>('keyInt'),
        throwsA(isA<TypeError>()),
      );
      await cleanUpLocator();
    });

    // Error case: Save unsupported data type
    test('saveData throws error for unsupported type', () async {
      await prepareSharedPreferencesLocator();
      expect(
        () => StorageUtils.saveData('keyMap', {'key': 'value'}),
        throwsA(isA<AssertionError>()),
      );
      await cleanUpLocator();
    });
  });
}
