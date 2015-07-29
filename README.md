# json-ADT

针对复杂的json数据，转换成树ADT，增加便捷操作。

## install

```sh
  npm install node-adt
```

## usage

```coffee
  ADT = require 'node-adt'
  json = require 'test.json'

  root = new ADT json

  console.log root.name
  console.log root.value
  console.log root.root()
  console.log root.parent()

  children = root.children()

  console.log children.previous()
  console.log children.current()
  console.log children.next()

```

## run example

```sh
  npm test
```

## TODO

+ 增加搜索功能

## API

```coffee
# Tree ADT
#
# struct {
#   name <string>,
#   value <string>,
#   _parent <object>,
#   _children <object>,
#   _root <object>
# }

# operation
#
# .children()
# .parent()
# .root()

# children operation
#
# .from(index) <ADT>
# .current() <ADT>
# .next() <ADT>
# .previous() <ADT>
# .insertAfter(position, adt)
# .insertBefore(position, adt)
# .remove(position)
# .push(adt)
# .pop()
# .shift()
# .unshift(adt)
```
