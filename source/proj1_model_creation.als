module sudoku/project

abstract sig number {}
one sig n1, n2, n3, n4, n5, n6, n7, n8, n9 extends number {}

abstract sig subContainer 
{
	contents: set number,
	cells: set cell
}
	
sig column, row, square9 extends subContainer {}

sig cell
{
	contents: set number,
}

one sig board
{
	cells: number -> number -> set cell,

	rows: number -> set row,
	columns: number -> set column,
	squares: number -> set square9
}


fact everyRowColSqrAreInABoard
{
	all r: row, b: board, n: number | r in b.rows[n]
	all c: column, b: board, n: number | c in b.columns[n]
	all s: square9, b: board, n: number | s in b.squares[n]
}

fact cellInCorrectPlace
{
	all c: cell, r: row, b: board, n: number, m: number  |
		(c = b.cells[m][n]  and r = b.rows[m] )=> c in r.cells 
	all c: cell, co: column, b: board,m: number | some n: number |
		(c = b.cells[m][n] and co = b.columns[n] ) => c in co.cells


}


fact cellContentValidation
{
	all c: cell, r: row, co: column, s: square9 | 
	 (c in r.cells && c in co.cells && c in s.cells) => (c.contents = (r.contents & co.contents & s.contents))

}


pred show (r: row, co: column, s: square9, cc: cell, nn: number) 
{
	some n: number | n in r.contents and n in co.contents and n not in cc.contents
	some c, ce:cell |  c in r.cells and ce in r.cells
	some c: cell | c in co.cells and c not in r.cells
	some c: cell | c in co.cells and c in r.cells and c in s.cells
}

run show 
