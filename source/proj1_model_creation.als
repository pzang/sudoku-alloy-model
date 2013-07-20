module sudoku/project1

sig Board {}

abstract sig ValidateObj {}
sig Row extends ValidateObj {}
sig Column extends ValidateObj {}
sig Square9 extends ValidateObj {}
sig Cell extends ValidateObj{}

sig Player {}

abstract sig Notification {}
sig InvalideMove extends Notification {}
abstract sig Errors extends Notification {}

abstract sig ValidValue {}
sig ValidCellValue extends ValidValue {}

abstract sig ValidObjValue {}
sig ValidColumnVal extends ValidObjValue {}
sig ValidRowVal extends ValidObjValue {}
sig ValidSquareVal extends ValidObjValue {}

pred show () {}
run show
