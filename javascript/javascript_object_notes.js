const object_1 = {a:"a",b:"b"}


Object.entries(object_1).forEach(([key,value])=>{
    console.log(`key:${key}`);
    console.log(`value:${value}`);
    console.log()}
)

// get key list
Object.keys(object_1)

// get value list
Object.values(object_1)