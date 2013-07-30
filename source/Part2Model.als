abstract sig Digit {}
one sig One, Two, Three, Four, Five, Six, Seven, Eight, Nine extends Digit {}
 
sig Cell {content: Digit}
 
abstract sig Group {
  cells: set Cell
} {
  no disj c, c': cells | c.content = c'.content
}
 
abstract sig Row, Column, Matrix extends Group {}

one sig SudokuBoard extends Group {
	rows: set Row,
	columns: set Column,
	squares: set Matrix
} 
{
	rows = R0 + R1 + R2 + R3 + R4 + R5 + R6 + R7 + R8
	columns = C0 + C1 + C2 + C3 + C4 + C5 + C6 + C7 + C8
	squares = M11 + M14 + M17 + M41 + M44 + M47 + M71 + M74 + M77
}
/*
fact {
	SudokuBoard.cells = C00 + C01 + C02 + C03 + C04 + C05 + C06 + C07 + C08 + C10 + C11 + C12 + C13 + C14 + C15 + C16 + C17 + C18 + C20 + C21 + C22 + C23 + C24 + C25 + C26 + C27 + C28 + C30 + C31 + C32 + C33 + C34 + C35 + C36 + C37 + C38 + C40 + C41 + C42 + C43 + C44 + C45 + C46 + C47 + C48 + C50 + C51 + C52 + C53 + C54 + C55 + C56 + C57 + C58 + C60 + C61 + C62 + C63 + C64 + C65 + C66 + C67 + C68 + C70 + C71 + C72 + C73 + C74 + C75 + C76 + C77 + C78 + C80 + C81 + C82 + C83 + C84 + C85 + C86 + C87 + C88
}
*/

// Begin Added Asserts
// Begin Contents Assert
assert boardRowsContainAllCells {
	one board: SudokuBoard | board.rows.cells = Cell
}

assert boardColumnsContainAllCells {
	one board: SudokuBoard | board.columns.cells = Cell
}
assert boardSquaresContainAllCells {
	one board: SudokuBoard | board.squares.cells = Cell
}
// End Content Assert
// Begin Cell Assert
assert allCellsBelongToABoard {
//	all cell: Cell | one board: SudokuBoard | cell in board.cells
}
// End Cell Assert 
// End Added Asserts


one sig
C00, C01, C02, C03, C04, C05, C06, C07, C08,
C10, C11, C12, C13, C14, C15, C16, C17, C18,
C20, C21, C22, C23, C24, C25, C26, C27, C28,
C30, C31, C32, C33, C34, C35, C36, C37, C38,
C40, C41, C42, C43, C44, C45, C46, C47, C48,
C50, C51, C52, C53, C54, C55, C56, C57, C58,
C60, C61, C62, C63, C64, C65, C66, C67, C68,
C70, C71, C72, C73, C74, C75, C76, C77, C78,
C80, C81, C82, C83, C84, C85, C86, C87, C88 extends Cell {}
 
one sig R0, R1, R2, R3, R4, R5, R6, R7, R8 extends Row {}
one sig C0, C1, C2, C3, C4, C5, C6, C7, C8 extends Column {}
one sig M11, M14, M17, M41, M44, M47, M71, M74, M77 extends Matrix {}


 
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
 
  M11.cells = C00 + C01 + C02 + C10 + C11 + C12 + C20 + C21 + C22
  M14.cells = C03 + C04 + C05 + C13 + C14 + C15 + C23 + C24 + C25
  M17.cells = C06 + C07 + C08 + C16 + C17 + C18 + C26 + C27 + C28
  M41.cells = C30 + C31 + C32 + C40 + C41 + C42 + C50 + C51 + C52
  M44.cells = C33 + C34 + C35 + C43 + C44 + C45 + C53 + C54 + C55
  M47.cells = C36 + C37 + C38 + C46 + C47 + C48 + C56 + C57 + C58
  M71.cells = C60 + C61 + C62 + C70 + C71 + C72 + C80 + C81 + C82
  M74.cells = C63 + C64 + C65 + C73 + C74 + C75 + C83 + C84 + C85
  M77.cells = C66 + C67 + C68 + C76 + C77 + C78 + C86 + C87 + C88
}
 
assert EachCellBelongsToJustOneRow {
  all cell: Cell | one row: Row | cell in row.cells
}
//check EachCellBelongsToJustOneRow
 
assert EachCellBelongsToJustOneColumn {
  all cell: Cell | one column: Column | cell in column.cells
}
//check EachCellBelongsToJustOneColumn
 
assert EachCellBelongsToJustOneMatrix {
  all cell: Cell | one matrix: Matrix | cell in matrix.cells
}
//check EachCellBelongsToJustOneMatrix
 
// * 2 3 * * 8 * 5 *
// * 8 * 9 * * 4 7 *
// * * * 5 * * * * *
// * 9 1 * 3 * * * *
// * * * 8 * * 5 * 6
// * * * * * 4 * * *
// * * * * 6 * * * *
// 7 * 9 * 8 * * * 5
// 6 * * * * 2 3 * 8
fact {
  C01.content = Two
  C02.content = Three
  C05.content = Eight
  C07.content = Five
  C11.content = Eight
  C13.content = Nine
  C16.content = Four
  C17.content = Seven
  C23.content = Five
  C31.content = Nine
  C32.content = One
  C34.content = Three
  C43.content = Eight
  C46.content = Five
  C48.content = Six
  C55.content = Four
  C64.content = Six
  C70.content = Seven
  C72.content = Nine
  C74.content = Eight
  C78.content = Five
  C80.content = Six
  C85.content = Two
  C86.content = Three
  C88.content = Eight
}
 
pred show {}
run show
