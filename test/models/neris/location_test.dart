import 'package:tailboard_app/models/neris/location.dart';
import 'package:test/test.dart';

void main() {
  group('address number', () {
    test('number only', () {
      const Location a = Location(id: '1', anNumber: 123, snStreetName: 'Main', snPostType: 'St');
      expect(a.renderAddressNumber(), '123');
    });
    test('prefix', () {
      const Location a = Location(id: '1',
        anPrefix: 'A', anNumber: 19,
        snStreetName: 'Calle 117',
      );
      expect(a.renderAddressNumber(), 'A19');
    });
  });

  group('street name', () {
    test('name only', () {
      const Location a = Location(id: '1', anNumber: 123, snStreetName: 'Main', snPostType: 'St');
      expect(a.renderStreetName(), 'Main St');
    });
  });
}