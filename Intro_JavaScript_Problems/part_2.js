// Phase I: Callbacks

function titleize(arr, callback) => {
  const newArr = arr.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(newArr);
};

function printCallback(arr) => {
  arr.forEach(name => console.log(name));
};

titleize(["Mary", "Brian", "Leo"], printCallback);


// Phase II: Constructors, Prototypes, and this

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function() {
  let rand =  Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[rand]}`);
};

const cecil = new Elephant("Cecil", 500, ['jumping', 'stomping']);

cecil.trumpet();
console.log(cecil.height);
cecil.grow();
console.log(cecil.height);
console.log(cecil.tricks);
cecil.addTrick("Singing");
console.log(cecil.tricks);
cecil.play();