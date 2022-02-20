// Phase I: Callbacks

const titleize = (arr, callback) => {
  const newArr = arr.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(newArr);
};

const printCallback = (arr) => {
  arr.forEach(name => console.log(name));
};

titleize(["Mary", "Brian", "Leo"], printCallback);