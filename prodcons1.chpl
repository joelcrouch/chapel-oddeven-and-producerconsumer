// A producer-consumer program using the cqueue module 
//
// Version 1: Base version: single producer and single consumer
//

use cqueue;

config const numItems = 32;
var lock$ : sync bool;

proc getrand(): int {
  use Random;
  var rs =new RandomStream(int);
  var val = rs.getNext();
  return val%1000;
}

proc producer() { 
  // ... fill ...
  forall(i) in 1..numItems {
    var randomNumber : int = getrand();  
   // lock$.writeXF(true); //lock  no locks required?  
    var idx = cqueue.add(randomNumber);  
    writef("Producer added %i to index %i\n", randomNumber, idx);
    if(i==numItems){
      writeln("Producer done.");
    }
  }
}
proc consumer() { 
  // ... fill ...
  forall(i) in 1..numItems {  
    var pair = cqueue.remove();
    writef("Consumer removed %i from %i.\n", pair[1], pair[0]); 
    if(i == numItems){
      writeln("Consumer Done!");
    }
  }
}

proc main() {
  cobegin {
    producer();
    consumer();
  }
} 
