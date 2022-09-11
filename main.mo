import Array "mo:base/Array";
import Int "mo:base/Int";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
  
  func unwrap(arr : [Int]) : [Int] {
      let n = arr.size();
      if (n < 2) {
          arr;
      } else {
          let result: [var Int] = Array.thaw(arr); 
          quicksort(result, 0, n - 1);
          return Array.freeze(result); 
      };
  };
  
  func quicksort(arr : [var Int],l : Nat,r : Nat ) {
  	var temp:Int = arr[l];   
	var p:Nat = l;
	var i:Nat = l;
	var j:Nat = r;
    while(i < j){   
        while(j >= p and arr[j] >= temp and j > 0){
         j -= 1;
        };
        if(j >= p){
        arr[p] := arr[j];
        p:=j;
        };
        while(i <= p and arr[i] <= temp){
         i += 1;
        };
        if(i <= p){
        arr[p] := arr[i];
        p:=i;
        };
    };
        arr[p] := temp;
        if (p-l:Int > 1){
           quicksort(arr,l,p-1);
        };
        if (r-p:Int > 1){
            quicksort(arr,p+1,r);
        };
};


  
  public func qsort(arr : [Int]) : async [Int] {
    unwrap(arr);
  };

};