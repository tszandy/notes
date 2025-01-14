let mySet = new Set();
let mySetWithValues = new Set([1, 2, 3, 4]);


add(value)	Adds a value to the Set.	mySet.add(5);
delete(value)	Removes a value from the Set.	mySet.delete(3);
has(value)	Checks if a value exists in the Set.	mySet.has(2); // true
clear()	Removes all elements from the Set.	mySet.clear();
size	Returns the number of elements in the Set.	mySet.size; // 4

for (let value of mySet) {
    console.log(value);
}

mySet.forEach(value => console.log(value));

let arrayFromSet = [...mySet];
console.log(arrayFromSet);

console.log([...mySet.keys()]);   // [1, 2, 3]
console.log([...mySet.values()]); // [1, 2, 3]
console.log([...mySet.entries()]); // [[1, 1], [2, 2], [3, 3]]

# union
let setA = new Set([1, 2, 3]);
let setB = new Set([3, 4, 5]);
let union = new Set([...setA, ...setB]);
console.log(union); // Set {1, 2, 3, 4, 5}

# intersection
let intersection = new Set([...setA].filter(x => setB.has(x)));
console.log(intersection); // Set {3}

# difference
let difference = new Set([...setA].filter(x => !setB.has(x)));
console.log(difference); // Set {1, 2}

# isSubset
let isSubset = [...setA].every(x => setB.has(x));
console.log(isSubset); // false

# Removing duplicates from an array:
let arr = [1, 2, 2, 3];
let uniqueArr = [...new Set(arr)];
console.log(uniqueArr); // [1, 2, 3]

