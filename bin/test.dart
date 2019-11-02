import 'main.dart';
import 'package:test/test.dart';

void main() {
  test("test case 1", () {
    expect(
        minesweeper([
          [0, 1, 0, 0],
          [0, 0, 1, 0],
          [0, 1, 0, 1],
          [1, 1, 0, 0],
        ]),
        [
          [1, 9, 2, 1],
          [2, 3, 9, 2],
          [3, 9, 4, 9],
          [9, 9, 3, 1],
        ]);
    expect(
        minesweeper([
          [0, 1, 0, 0],
          [0, 0, 1, 0],
          [0, 1, 0, 1],
        ]),
        [
          [1, 9, 2, 1],
          [2, 3, 9, 2],
          [1, 9, 3, 9],
        ]);
    expect(
        minesweeper([
          [0, 1, 0],
          [0, 0, 1, 0],
          [0, 1, 0, 1],
        ]),
        [
          [1, 9, 2],
          [2, 3, 9, 2],
          [1, 9, 3, 9],
        ]);

    expect(
        minesweeper([
          [0, 1, 0],
          [0, 0, 1, 0],
          [0, 1, 0],
        ]),
        [
          [1, 9, 2],
          [2, 3, 9, 1],
          [1, 9, 2],
        ]);
  });

//---------------------------
  test("test case 1", () {
    expect(splitEvenlyIfPossible([1, 2, 3, 4, 5, 6], 3), [
      [1, 2, 3],
      [4, 5, 6]
    ]);
    expect(splitEvenlyIfPossible([1, 2, 3, 4, 5, 6], 2), [
      [1, 2],
      [3, 4],
      [5, 6]
    ]);
    expect(splitEvenlyIfPossible([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 4), [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 10, 11]
    ]);
  });
}
