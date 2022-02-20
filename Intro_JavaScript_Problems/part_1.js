const madLib = (verb, adjective, noun) => {
  console.log(`We shall ${verb.toUpperCase()} the ${adjective.toUpperCase() + ' ' + noun.toUpperCase()}.`);
};

madLib('make', 'best', 'guac');

const isSubstring = (searchString, subString) => {
  console.log(searchString.includes(subString));
};

isSubstring("time to program", "time");
isSubstring("Jump for joy", "joys");


// Phase II - JS Looping Constructs

const fizzBuzz = (array) => {
  let newArr = array.filter(
    num => {
      if ((num % 3 === 0 || num % 5 === 0) && num % 15 != 0){
        return num;
      };
    }
  )
  console.log(newArr);
};

fizzBuzz([1,3,4,5,9,10,12,15,30,60]);


const isPrime = (num) => {
  if (num < 2){ return false; }
  let i = 2;
  while (i < num ) {
    if (num % i == 0){
      return false;
    }
    i++
  }
  return true;
}

console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));


const sumOfNPrimes = (n) => {
  let primes = 0;
  let i = 1;
  let sum = 0;
  while (primes < n) {
    if (isPrime(i)){
      sum += i
      primes++
    }
    i++
  }
  console.log(sum);
};

sumOfNPrimes(0);
sumOfNPrimes(1);
sumOfNPrimes(4);