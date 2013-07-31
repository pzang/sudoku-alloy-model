
// nine possible numbers for a sudoku cell
abstract sig number {}
one sig n1, n2, n3, n4, n5, n6, n7, n8, n9 extends number {}
 
sig cell {content: number}  

//a non-format specific grouping of cells 
abstract sig group 
{
  cells: set cell
} 
 
abstract sig row, column, square9 extends group {}

// A board consists rows, columns and 3x3 square9s
// each row, column or square 9 has 9 members because it is a 9x9 board
one sig board extends group 
{
	rows: set row,
	columns: set column,
	squares: set square9
} 
{
	rows = R0 + R1 + R2 + R3 + R4 + R5 + R6 + R7 + R8
	columns = C0 + C1 + C2 + C3 + C4 + C5 + C6 + C7 + C8
	squares = s11 + s14 + s17 + s41 + s44 + s47 + s711 + s74 + s77
}

// Begin Added Asserts


// Begin Contents Assert

//all cells must be accounted for in the set of all rows
assert boardRowsContainAllCells 
{
	one board: board | board.rows.cells = cell
}

// all cells must be accounted for in the set of all columns
assert boardColumnsContainAllCells 
{
	one board: board | board.columns.cells = cell
}

//All cells must be accounted for in the set of all square9's
assert boardSquaresContainAllCells 
{
	one board: board | board.squares.cells = cell
}

// End Content Assert

//Every cell in a board must belong to a row, column and square9
assert noStrayBoardCells 
{
	one board: board | board.squares.cells = board.rows.cells and board.squares.cells = board.columns.cells
}

// End cell Assert 
// End Added Asserts

// Each cell in the board referenced by row i and column j
// cell[i][j] = cij
one sig
C00, C01, C02, C03, C04, C05, C06, C07, C08,
C10, C11, C12, C13, C14, C15, C16, C17, C18,
C20, C21, C22, C23, C24, C25, C26, C27, C28,
C30, C31, C32, C33, C34, C35, C36, C37, C38,
C40, C41, C42, C43, C44, C45, C46, C47, C48,
C50, C51, C52, C53, C54, C55, C56, C57, C58,
C60, C61, C62, C63, C64, C65, C66, C67, C68,
C70, C71, C72, C73, C74, C75, C76, C77, C78,
C80, C81, C82, C83, C84, C85, C86, C87, C88 extends cell {}
 
one sig R0, R1, R2, R3, R4, R5, R6, R7, R8 extends row {}
one sig C0, C1, C2, C3, C4, C5, C6, C7, C8 extends column {}
one sig s11, s14, s17, s41, s44, s47, s711, s74, s77 extends square9 {}


 //Define which cells go into which row, column and square9
fact {
  R0.cells = C00 + C01 + C02 + C03 + C04 + C05 + C06 + C07 + C08
  R1.cells = C10 + C11 + C12 + C13 + C14 + C15 + C16 + C17 + C18
  R2.cells = C20 + C21 + C22 + C23 + C24 + C25 + C26 + C27 + C28
  R3.cells = C30 + C31 + C32 + C33 + C34 + C35 + C36 + C37 + C38
  R4.cells = C40 + C41 + C42 + C43 + C44 + C45 + C46 + C47 + C48
  R5.cells = C50 + C51 + C52 + C53 + C54 + C55 + C56 + C57 + C58
  R6.cells = C60 + C61 + C62 + C63 + C64 + C65 + C66 + C67 + C68
  R7.cells = C70 + C71 + C72 + C73 + C74 + C75 + C76 + C77 + C78
  R8.cells = C80 + C81 + C82 + C83 + C84 + C85 + C86 + C87 + C88
 
  C0.cells = C00 + C10 + C20 + C30 + C40 + C50 + C60 + C70 + C80
  C1.cells = C01 + C11 + C21 + C31 + C41 + C51 + C61 + C71 + C81
  C2.cells = C02 + C12 + C22 + C32 + C42 + C52 + C62 + C72 + C82
  C3.cells = C03 + C13 + C23 + C33 + C43 + C53 + C63 + C73 + C83
  C4.cells = C04 + C14 + C24 + C34 + C44 + C54 + C64 + C74 + C84
  C5.cells = C05 + C15 + C25 + C35 + C45 + C55 + C65 + C75 + C85
  C6.cells = C06 + C16 + C26 + C36 + C46 + C56 + C66 + C76 + C86
  C7.cells = C07 + C17 + C27 + C37 + C47 + C57 + C67 + C77 + C87
  C8.cells = C08 + C18 + C28 + C38 + C48 + C58 + C68 + C78 + C88
 
  s11.cells = C00 + C01 + C02 + C10 + C11 + C12 + C20 + C21 + C22
  s14.cells = C03 + C04 + C05 + C13 + C14 + C15 + C23 + C24 + C25
  s17.cells = C06 + C07 + C08 + C16 + C17 + C18 + C26 + C27 + C28
  s41.cells = C30 + C31 + C32 + C40 + C41 + C42 + C50 + C51 + C52
  s44.cells = C33 + C34 + C35 + C43 + C44 + C45 + C53 + C54 + C55
  s47.cells = C36 + C37 + C38 + C46 + C47 + C48 + C56 + C57 + C58
  s711.cells = C60 + C61 + C62 + C70 + C71 + C72 + C80 + C81 + C82
  s74.cells = C63 + C64 + C65 + C73 + C74 + C75 + C83 + C84 + C85
  s77.cells = C66 + C67 + C68 + C76 + C77 + C78 + C86 + C87 + C88
}

//Make sure that each group only has one instance of a number n1-n9
fact UniqueNumbersInGroup
{
	all c, c': cell | some r: row | c in r.cells and c' in r.cells => c.content != c'.content
	all c, c': cell | some col: column | c in col.cells and c' in col.cells => c.content != c'.content
	all c, c': cell | some s: square9 | c in s.cells and c' in s.cells => c.content != c'.content
} 

//Makes sure that a cell is in exactly 1 row
assert EachCellBelongsToJustOneRow 
{
  all cell: cell | one row: row | cell in row.cells
}

//Makes sure that a cell is in exactly  1 column
assert EachCellBelongsToJustOneColumn 
{
  all cell: cell | one column: column | cell in column.cells
}
 
//Makes sure that a cell is in exactly 1 Square9
assert EachCellBelongsToJustOneMatrix 
{
  all cell: cell | one square9: square9 | cell in square9.cells
}

// One possible game of sudoku, full
pred Game1 
{	
	C00.	content = n1
	C01.	content = n3
	C02.	content = n6
	C03.	content = n5
	C04.	content = n2
	C05.	content = n7
	C06.	content = n4
	C07.	content = n8
	C08.	content = n9
	C10.	content = n7
	C11.	content = n8
	C12.	content = n2
	C13.	content = n4
	C14.	content = n9
	C15.	content = n6
	C16.	content = n3
	C17.	content = n1
	C18.	content = n5
	C20.	content = n4
	C21.	content = n9
	C22.	content = n5
	C23.	content = n3
	C24.	content = n1
	C25.	content = n8
	C26.	content = n7
	C27.	content = n2
	C28.	content = n6
	C30.	content = n2
	C31.	content = n7
	C32.	content = n4
	C33.	content = n1
	C34.	content = n3
	C35.	content = n9
	C36.	content = n5
	C37.	content = n6
	C38.	content = n8
	C40.	content = n9
	C41.	content = n5
	C42.	content = n3
	C43.	content = n6
	C44.	content = n8
	C45.	content = n2
	C46.	content = n1
	C47.	content = n4
	C48.	content = n7
	C50.	content = n6
	C51.	content = n1
	C52.	content = n8
	C53.	content = n7
	C54.	content = n5
	C55.	content = n4
	C56.	content = n2
	C57.	content = n9
	C58.	content = n3
	C60.	content = n3
	C61.	content = n6
	C62.	content = n7
	C63.	content = n8
	C64.	content = n4
	C65.	content = n1
	C66.	content = n9
	C67.	content = n5
	C68.	content = n2
	C70.	content = n8
	C71.	content = n4
	C72.	content = n9
	C73.	content = n2
	C74.	content = n7
	C75.	content = n5
	C76.	content = n6
	C77.	content = n3
	C78.	content = n1
	C80.	content = n5
	C81.	content = n2
	C82.	content = n1
	C83.	content = n9
	C84.	content = n6
	C85.	content = n3
	C86.	content = n8
	C87.	content = n7
	C88.	content = n4
}
 
// another different full game of sudoku
pred Game2
 {
	C00.content = n6
	C01.content = n7
	C02.content = n4
	C03.content = n8
	C04.content = n3
	C05.content = n9
	C06.content = n1
	C07.content = n2
	C08.content = n5
	C10.content = n1
	C11.content = n8
	C12.content = n5
	C13.content = n6
	C14.content =	 n4
	C15.content = n2
	C16.content = n7
	C17.content = n9
	C18.content = n3
	C20.content = n3
	C21.content = n2
	C22.content = n9
	C23.content = n5
	C24.content = n1
	C25.content = n7
	C26.content = n6
	C27.content = n4
	C28.content = n8
	C30.content = n7
	C31.content = n1
	C32.content = n3
	C33.content = n9
	C34.content = n6
	C35.content = n5
	C36.content = n4
	C37.content = n8
	C38.content = n2
	C40.content = n9
	C41.content = n5
	C42.content = n6
	C43.content = n2
	C44.content = n8
	C45.content = n4
	C46.content = n3
	C47.content = n7
	C48.content = n1
	C50.content = n8
	C51.content = n4
	C52.content = n2
	C53.content = n3
	C54.content = n7
	C55.content = n1
	C56.content = n9
	C57.content = n5
	C58.content = n6
	C60.content = n5
	C61.content = n3
	C62.content = n7
	C63.content = n4
	C64.content = n2
	C65.content = n6
	C66.content = n8
	C67.content = n1
	C68.content = n9
	C70.content = n2
	C71.content = n6
	C72.content = n1
	C73.content = n7
	C74.content = n9
	C75.content = n8
	C76.content = n5
	C77.content = n3
	C78.content = n4
	C80.content = n4
	C81.content = n9
	C82.content = n8
	C83.content = n1
	C84.content = n5
	C85.content = n3
	C86.content = n2
	C87.content = n6
	C88.content = n7
}

//get the value of a cell
fun cellValue (b: board, c: cell): number 
{
	cell.content
}

// A partial game of sudoku with some solutions missing
// much like you would see in the newspaper
pred partialGame 
{
  C01.content = n2
  C02.content = n3
  C05.content = n8
  C07.content = n5
  C11.content = n8
  C13.content = n9
  C16.content = n4
  C17.content = n7
  C23.content = n5
  C31.content = n9
  C32.content = n1
  C34.content = n3
  C43.content = n8
  C46.content = n5
  C48.content = n6
  C55.content = n4
  C64.content = n6
  C70.content = n7
  C72.content = n9
  C74.content = n8
  C78.content = n5
  C80.content = n6
  C85.content = n2
  C86.content = n3
  C88.content = n8
}

pred solvePuzzle 
{
}

pred validCells
{
}

 assert solve {
	partialGame and solvePuzzle => validCells
}

pred show 
{
	partialGame

}
run partialGame for 9

