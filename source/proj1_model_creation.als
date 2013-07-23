module sudoku/project

abstract sig number {}
one sig n1, n2, n3, n4, n5, n6, n7, n8, n9 extends number {}

sig column 
{
	contents: set number
}

sig row 
{
	contents: set number
}

sig cell
{
	contents: set number
}

one sig board
{
	cells: set cell,

	rows: number -> row,
	columns: number -> column
}

fact everyRowIsInABoard
{
	all r: row, b: board, n: number | r in b.rows[n]
}
fact everyRowIsUnique
{
	one b: board | some n, n': number | b.rows[n] = b.rows[n'] implies n = n'
}



fact everyColumnIsInABoard
{
	all c: column, b: board, n: number | c in b.columns[n]
}

pred show () 
{
}

