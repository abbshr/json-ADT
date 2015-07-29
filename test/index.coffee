ADT = require '../'
json = require './test.json'

root = new ADT json

console.log root.name
console.log root.value
console.log root.root()
console.log root.parent()

children = root.children()

console.log children.previous()
console.log children.current()
console.log children.next()
