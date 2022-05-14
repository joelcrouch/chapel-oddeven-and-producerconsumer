// Oddven sort (data parallel version)
//
use Random;

//config const DEBUG : bool= true;
config const DEBUG : int =1;//true
config const WORST : int =1;// false;
config const N = 10 :uint;

proc getrand():uint {
  use Random;
  var rs =new RandomStream(uint);
  var val = rs.getNext();
  return val%1000;
}

proc print_array(a:[], it : uint){
  writeln("      ", a);
}

proc swap(inout x, inout y ){
  x<=>y;
}
// Initialize array with random uint(8) values
// (except if WORST flag is on, set array to the reverse of 1..N)

proc init_array(a:[]) {
  if(WORST == 1){
    a = [i in 1..N by -1] i;
  }
  else{
    forall(i) in 1..N{
      var randnumber =getrand();
      a[i]=randnumber;
    }
  }
  if(DEBUG ==1){//#ifdef DEBUG
    writef("Init: ");
    writeln(a);
  }
}

// Verify that array is sorted
// (if not sorted, show the violation pair of elements)

proc verify_array(a:[]) {
  // ... fill ...
  forall(i) in 1..N-1{
      if (a[i] > a[i+1]) {
      writef("FAILED: a[%i]=%i, a[%i]=%i\n", i, a[i], i+1, a[i+1]);
      }
  }
    writeln(N, " element array is sorted.");  
}



/*
iter oddeven_sort(a:[]){
  forall(t) in 1..N/2{
    for i in 2..N by 2 do 
      if (a[i] > a[i+1])
    swap(&(a[i]), &(a[i+1]);
     
    for i in 1..N by 2 do {
      if (a[i] > a[i+1])
	swap(&(a[i]), &(a[i+1]);
    }
    if(DEBUG == 1){//#ifdef DEBUG
//      writef("t=%i:  ", t);
      print_array(a, t);
    }
  }
}
*/

// Oddeven sort
// 
proc oddeven_sort(a:[]) {
  // ... fill ...
 /////thinkd about using a 
// iter evenThenOdds(N :int) see learn x in y
  
  forall(t) in 1..N+1 {
    
    forall(i) in 2..N-1 by 2 do
      if(a[i] > a[i+1]) then 
    swap(a[i], a[i+1]);
      else continue;
    
    forall(j) in 1..N-1 by 2 do
      if(a[j] > a[j+1]) then
    swap(a[j], a[j+1]);
      else continue; 
    
    if(DEBUG == 1){//#ifdef DEBUG
//      writef("t=%i:  ", t);
      print_array(a, t);
    }
  }
}

proc main() {
  var a: [1..N] uint;
  init_array(a);
  //print_array(a);
  oddeven_sort(a);
  verify_array(a);
}
