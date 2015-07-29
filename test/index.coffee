ADT = require '../'
json = require './test.json'

root = new ADT json

console.log child = root.children 1
console.log root.root()
console.log child.name
console.log child.value
console.log child.parent()
console.log child.root()
console.log child.children()
console.log child.children().search 'value2-2'
