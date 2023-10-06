import 'package:counter_application/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Counter counter;

  setUp(() => counter = Counter());
  group("counter class", () {
    //setup instance of class or function

    test(
        'given coutner class when it is instantiated then the value of count should be',
        () {
      //set up
      final val = counter.count;

      //assert
      expect(val, 0);
    });

    test("when value is incremented from initial state, value should become 1",
        () {
      //instantiate method
      counter.increment();
      final val = counter.count;
      expect(val, 1);
    });

    test("When value is decremented from initial value, it should becoem -1",
        () {
      counter.decrement();
      final val = counter.count;
      expect(val, -1);
    });
  });
}
