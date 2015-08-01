# json-ADT

[![npm version](https://badge.fury.io/js/node-adt.svg)](http://badge.fury.io/js/node-adt)

针对复杂的json数据, 转换成易于编程操作的Tree ADT.

JSON是一种易于表达的数据结构, 但纯粹的JSON Object即便是在JavaScript中操作起来也略有不便. 例如庞大的JSON配置文件, 从中提取需要的值并找出其关联父节点和子节点等要求是比较困难的, 但如果将原始数据结构转换成ADT, 就得到了丰富的操作方法, 如搜索, 查询, 插入, 更新, 删除等等.

## install

```sh
  npm install node-adt
```

## usage

```coffee
  ADT = require 'node-adt'
  json = require 'test.json'

  # 每个json解析后都对应一个根节点
  root = new ADT json

  # 根节点默认name为"root"
  root.name

  # 值默认为null
  root.value

  # 所有ADT实例都有一个指向根节点的指针
  root.root()

  # 获取root adt的父节点(为null)
  root.parent()

  # 获取root adt的子节点, 返回Children类型的值, 是一个ADT列表
  children = root.children()

  # children中游标指向当前节点的前一个节点(adt)
  children.previous()

  # 当前游标指向的节点
  children.current()

  # 游标的下一个节点
  children.next()

  # children的父节点
  children.parent()

  # 直接访问索引编号为1的子节点(同时更新游标)
  children.from 1
  # 或
  root.children 1
  # 或者根据键名访问节点
  root.children "key2-1"

  # 访问数组结构
  # node-adt将数组结构视为一系列键为索引值的子节点
  arr = children.from 1
  .children 2
  .children()

  # 调用.raw返回当前ADT对应的原始JSON
  root.raw()
  # 对Children也可以调用raw方法
  children.raw()

  # 可以调用parent传入层级作为参数, 向上回溯几个parent (祖先节点)
  arr.parent 3

  # 限定在Children或ADT作用域内, 按值搜索节点, 返回值是'value2-2'的所有节点
  children.search 'value2-2'
  root.search 'value2-2'

  # 切换到root的第二个子节点, 将不会搜索到"value1"对应的节点
  children.from 1
  .search 'value1'
  # => []

```

上文示例JSON data:

```json
{
  "key1": "value1",
  "key2": {
    "key2-1": {
      "key2-1-1": 2,
      "key2-1-2": 0
    },
    "key2-2": "value2-2",
    "key2-3": [
      "value2-3-1",
      "value2-3-2",
      {
        "key2-3-3-1": "value2-2"
      }]
  },
  "key3": "value3",
  "key4": {
    "key4-1": "value4-1",
    "key4-2": {
      "key4-2-1": "value2-2",
      "key4-2-2": true
    }
  },
  "key5": null
}
```

## run example

```sh
  npm test
```

## API

```coffee
# Tree ADT
#
# struct {
#   public:
#     name <string>,
#     value <string>,
#   private:
#     _parent <object>,
#     _children <object>,
#     _root <object>
#     _raw <object>
# }

# operation
#
# .children() <Children>
# .children(number) <ADT>
# .children(string) [<ADT>]
# .parent() <ADT>
# .parent(level) <ADT>
# .root() <ADT>
# .raw() <JSON Object>
# .search(value) <Array>

# children operation
#
# .from(index) <ADT>
# .key(name) [<ADT>]
# .parent() <ADT>
# .parent(level) <ADT>
# .raw() <JSON object>
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
# .search(value) <Array>
```
