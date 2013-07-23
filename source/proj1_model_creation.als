module sudoku/project

// Run this. I think that it's closer to what we want
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

pred show () {}
run show
