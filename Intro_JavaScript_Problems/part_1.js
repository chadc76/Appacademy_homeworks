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