const madLib = (verb, adjective, noun) => {
  console.log(`We shall ${verb.toUpperCase()} the ${adjective.toUpperCase() + ' ' + noun.toUpperCase()}.`);
};

madLib('make', 'best', 'guac');

const isSubstring = (searchString, subString) => {
  console.log(searchString.includes(subString));
};

isSubstring("time to program", "time");
isSubstring("Jump for joy", "joys");