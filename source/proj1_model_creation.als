module sudoku/project1

sig Board {}

abstract sig ValidObj {}
sig Row extends ValidObj {} // Indexed by Column
sig Column extends ValidObj {} // Indexed by Row {(n1, n1), (n1,n2)}
sig Square9 extends ValidObj {} // Indexed by Column, Row
sig Cell extends ValidateObj{} // Indexed by Column, Row

sig ValidValue extend ValidObj {} // set is all ValidObj - row - column - square

pred show () {}
run show
