function fizzbuzz (){
	for (var i = 0; i < 101; i++){
		if (i % 3 == 0 && i % 5 == 0) {
		console.log("Fizzbuzz");
	} 	else if (i % 3 == 0) {
		console.log("Fizz");
	}
		else if (i % 5 == 0) { 
		console.log("Buzz");
	}
		if (i % 3 != 0 && i % 5 != 0) {
		console.log(i)
	}
}};