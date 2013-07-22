module sudoku/project1

sig Board {}

sig ValidVals {
  val: Int
  }

abstract sig ValidObj {
  valide_values: ValidVals
  }


sig Row extends ValidObj {} // Indexed by Column
sig Column extends ValidObj {} // Indexed by Row {(n1, n1), (n1,n2)}
sig Square9 extends ValidObj {} // Indexed by Column, Row
sig Cell extends ValidateObj{} // Indexed by Column, Row



pred show () {}
run show
