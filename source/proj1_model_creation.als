module sudoku/project

open util/integer as integer

sig number 
{
	n1:Int, n2:Int, n3:Int, n4:Int, n5:Int, n6:Int, n7:Int, n8:Int, n9:Int
}

sig column 
{
	contents: set number
}

sig row 
{
	contents: set number
}

sig square9
{
	contents: set number
}

sig cell
{
	contents: set number
}

one sig board
{
	cells: number -> number -> set cell, 

	rows: number -> set row,
	columns: number -> set column,
	squares: number -> set square9
}

fact everyRowIsInABoard
{
	all r: row, b: board, n: number | r in b.rows[n]
}

fact everyColumnIsInABoard
{
	all c: column, b: board, n: number | c in b.columns[n]
}
sig temp
{
	y:Int
}
fact allNumbersBetweenOneAndNine
{ 
	all x: number | x.n1<=9 && x.n2<=9   &&  x.n3<=9  &&  x.n4 <= 9  && x.n5 <= 9  && x.n6 <= 9  &&
							 x.n7<=9  && x.n8<=9  &&  x.n9<=9 
}

fact numbersCantEqualEachother
{
	all x: number | x.n1 != x.n2 && x.n1 != x.n3 && x.n1 != x.n4 && x.n1 != x.n5 && x.n1 != x.n6 && x.n1 != x.n7
							&& x.n1 != x.n8 && x.n1 != x.n9
	
	all x: number | x.n2 != x.n3 && x.n2 != x.n4 && x.n2 != x.n5 && x.n2 != x.n6 && x.n2 != x.n7
							 && x.n2 != x.n8 && x.n2 != x.n9

	all x: number | x.n3 != x.n4 && x.n3 != x.n5 && x.n3 != x.n6 && x.n3 != x.n7
							&& x.n3 != x.n8 && x.n3 != x.n9

	all x: number |  x.n4 != x.n5 && x.n4 != x.n6 && x.n4 != x.n7 && x.n4 != x.n8 && x.n4 != x.n9
	
	all x: number | x.n5 != x.n6 && x.n5 != x.n7 && x.n5 != x.n8 && x.n5 != x.n9

	all x: number | x.n6 != x.n7 && x.n6 != x.n8 && x.n6 != x.n9

	all x: number | x.n7 != x.n8 && x.n7 != x.n9

	all x: number | x.n8!=x.n9
}

assert nineColumns
{
	all c: column | #c<=9
}

assert nineRows
{
	all r: row | #r<=9
}

assert eightyOneCells
{
	all c: cell | #c<=81
}

pred show () 
{
}

run show
