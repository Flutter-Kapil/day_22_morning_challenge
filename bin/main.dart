// Challenge 1
// Write test cases for the challenges including boundary conditions

// Challenge 2
// Minesweeper Number of Neighbouring Mines
// Create a function that takes an array representation of a Minesweeper board,
// and returns another board where the value of each cell is the amount of its neighbouring mines.
// Examples
//  The input may look like this:
//
//  [
//    [0, 1, 0, 0],
//    [0, 0, 1, 0],
//    [0, 1, 0, 1],
//    [1, 1, 0, 0],
//  ]
//  The 0 represents an empty space . The 1 represents a mine.
//
//  You will have to replace each mine with a 9 and each empty space with the
//  number of adjacent mines, the output will look like this:
//
//  [
//    [1, 9, 2, 1],
//    [2, 3, 9, 2],
//    [3, 9, 4, 9],
//    [9, 9, 3, 1],
//  ]
List<List> minesweeper(List<List> board) {
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      if (board[i][j] == 1) {
        board[i][j] = 9;
      }
    }
  }
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      if (board[i][j] == 0) {
        nearby9(i, j, board);
      }
    }
  }
  return board;
}

void nearby9(int i, int j, List<List> board) {
  try {
    for (int offsetX = -1; offsetX < 2; offsetX++) {
      for (int offsetY = -1; offsetY < 2; offsetY++) {
        if (i + offsetX < 0 ||
//            i + offsetX >= board[i].length ||
            i + offsetX >= board.length ||
            j + offsetY < 0 ||
            j + offsetY >= board[i + offsetX].length) {
          //do nothing, basically skip those values
        } else if (board[i + offsetX][j + offsetY] == 9) {
          board[i][j] = board[i][j] + 1;
        }
      }
    }
  } catch (e) {
    print(e);
  }
}

// Challenge 3
// Group in Order
// Create a function that groups an array of numbers based on a size parameter. The size represents the maximum length of each sub-array.
//
//  [1, 2, 3, 4, 5, 6], 3
//  [[1, 3, 5], [2, 4, 6]]
/// Divide array into groups of size 3.
//
//  [1, 2, 3, 4, 5, 6], 2
//  [[1, 4], [2, 5], [3, 6]]
/// Divide array into groups of size 2.
//
//  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 4
//  [[1, 4, 7, 10], [2, 5, 8, 11], [3, 6, 9]]
/// "Leftover" arrays are okay.
List<List> splitEvenlyIfPossible(List initialList, int splitInto) {
  int len = initialList.length;

  for (int i = splitInto; i > 1; i--) {
    if (len % i == 0) {
      return divideList(initialList, i);
    }
  }
  return divideList(initialList, splitInto);
}

List<List> divideList(List initialList, int x) {
  int len = initialList.length;
  List<List> finalList = [];

  for (var i = 0; i < len; i += x) {
    int end = (i + x < len) ? i + x : len;
    finalList.add(initialList.sublist(i, end));
  }
  return finalList;
}

main() {
  print(minesweeper([
    [0, 1, 0],
    [0, 0, 1, 0],
    [0, 1, 0],
    [1, 1, 0, 0]
  ]));
  print(splitEvenlyIfPossible([1, 2, 3, 4, 5, 6, 7, 8], 3));
}
