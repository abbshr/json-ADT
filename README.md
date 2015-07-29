# json-ADT

针对复杂的json数据，转换成树ADT，增加ADT操作。

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

  # 访问数组结构
  children.from 1
  .children 2
  .children()

```

JSON data:

```json
{
  "key1": "value1",
  "key2": {
    "key2-1": {
      "key2-1-1": "value2-1-1"
    },
    "key2-2": "value2-2",
    "key2-3": [
      "value2-3-1",
      "value2-3-2",
      {
        "key2-3-3-1": "value2-3-3-1"
      }
    ]
  },
  "key3": "value3",
  "key4": {
    "key4-1": "value4-1",
    "key4-2": {
      "key4-2-1": "value4-2-1"
    }
  }
}

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
