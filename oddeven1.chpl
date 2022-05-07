// Oddven sort (data parallel version)
//
use Random;
config const DEBUG = true;
config const WORST = false;
config const N = 10;

proc getrand():int {
  use Random;
  var rs =new RandomStream(uint);
  var val = rs.getNext();
  return val;
}

proc print_array(a:[]){
  forall i in 1..N do
    writef("%3i ", a[i]);
  writeln();
}

//done up to here 4/7
// Initialize array with random uint(8) values
// (except if WORST flag is on, set array to the reverse of 1..N)
proc init_array(a:[]) {
  // ... fill ...
  if DEBUG then
    writeln("Init: ", a); 
}

// Verify that array is sorted
// (if not sorted, show the violation pair of elements)
proc verify_array(a:[]) {
  // ... fill ...
  writeln(N, " element array is sorted.");  
}

// Oddeven sort
// 
proc oddeven_sort(a:[]) {
  // ... fill ...
}

proc main() {
  var a: [1..N] uint(8);
  init_array(a);
  oddeven_sort(a);
  verify_array(a);
}
