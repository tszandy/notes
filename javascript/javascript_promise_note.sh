# define and run promise
const myPromise = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve("foo");
  }, 3000);
});

# define the action after the promise fulfill or reject.
myPromise.then((v)=>{console.log(v);});
myPromise.then(callback);


# Wait for all promises to be fulfilled, or for any to be rejected.
Promise.all()

# Promise.all() example
const promise1 = Promise.resolve(3);
const promise2 = 42;
const promise3 = new Promise((resolve, reject) => {
  setTimeout(resolve, 100, 'foo');
});

Promise.all([promise1, promise2, promise3]).then((values) => {
  console.log(values);
});
// Expected output: Array [3, 42, "foo"]

# Wait until all promises have settled (each may fulfill or reject).
Promise.allSettled()

# Promise.allSettled() example
const promise1 = Promise.resolve(3);
const promise2 = new Promise((resolve, reject) => setTimeout(reject, 100, 'foo'));
const promises = [promise1, promise2];

Promise.allSettled(promises).
  then((results) => results.forEach((result) => console.log(result.status)));


# Takes an iterable of Promise objects and, as soon as one of the promises in the iterable fulfills, returns a single promise that fulfills with the value from that promise.
Promise.any()
# Promise.any() example 
const promise1 = Promise.reject(0);
const promise2 = new Promise((resolve) => setTimeout(resolve, 100, 'quick'));
const promise3 = new Promise((resolve) => setTimeout(resolve, 500, 'slow'));

const promises = [promise1, promise2, promise3];

Promise.any(promises).then((value) => console.log(value));

# Wait until any of the promises is fulfilled or rejected. If the returned promise fulfills, it is fulfilled with the value of the first promise in the iterable that fulfilled. If it rejects, it is rejected with the reason from the first promise that was rejected.
Promise.race()
# Promise.race() example
const promise1 = new Promise((resolve, reject) => {
  setTimeout(resolve, 500, 'one');
});

const promise2 = new Promise((resolve, reject) => {
  setTimeout(reject, 100, 'two');
});

Promise.race([promise1, promise2]).then((value) => {console.log(`resolve ${value}`);},(reason)=>{console.log(`reject ${reason}`);});

# Returns a new Promise object that is rejected with the given reason.
Promise.reject()

# Returns a new Promise object that is resolved with the given value. 
Promise.resolve()

# Appends fulfillment and rejection handlers to the promise, and returns a new promise resolving to the return value of the called handler, or to its original settled value if the promise was not handled (i.e. if the relevant handler onFulfilled or onRejected is not a function).
Promise.prototype.then()
then(onFulfilled)
then(onFulfilled, onRejected)
then(
  (value) => { /* fulfillment handler */ },
  (reason) => { /* rejection handler */ },
)

# Appends a handler to the promise, and returns a new promise that is resolved when the original promise is resolved. The handler is called when the promise is settled, whether fulfilled or rejected.
Promise.prototype.finally()


# A thenable implements the .then() method
const aThenable = {
  then(onFulfilled, onRejected) {
    onFulfilled({
      // The thenable is fulfilled with another thenable
      then(onFulfilled, onRejected) {
        onFulfilled(42);
      },
    });
  },
};

Promise.resolve(aThenable); // A promise fulfilled with 42