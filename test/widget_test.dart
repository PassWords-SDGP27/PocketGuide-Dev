// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';


void main() {
  // Get sum of all elements of an array
  int getSumOfArray(List<int> arr) {
    int res = 0;
    for (var i=0; i<arr.length; i++) {
      res += arr[i];
    }
    return res;
  }
  test('Get sum of array - success', () {
    int expectedValue = 15;
    int actualValue = getSumOfArray([1, 2, 3, 4, 5]);
    expect(expectedValue, actualValue);
  });
}