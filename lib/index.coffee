# JSON Object to ADT
# implement Tree ADT
# author: ran <abbshr@outlook.com>

# Tree ADT
#
# struct ADT {
#   public:
#     name <string>,
#     value <string>,
#   private:
#     _parent <object>,
#     _children <object>,
#     _root <object>
# }

# operation
#
# .children() <Children>
# .children(index) <ADT>
# .parent() <ADT>
# .root() <ADT>
# .search(value) <Array>


util = require 'util'
Children = require './children'

module.exports = class ADT

  constructor: (json, @_root = @) ->
    @name = "root"
    @_parent = null
    if util.isString json
      @value = json
      @_children = null
    else
      @value = null
      @_children = []
      @_transfer json

  _transfer: (obj) ->
    children_arr =
    if util.isArray obj
      for v, i in obj
        node = new ADT v, @_root
        node.name = i
        node._parent = @
        node
    else
      for k, v of obj
        node = new ADT v, @_root
        node.name = k
        node._parent = @
        node

    @_children = new Children children_arr

  root: () ->
    @_root

  children: (i) ->
    if i?
      @_children?.from i
    else
      @_children

  parent: () ->
    @_parent

  search: (value) ->
    result = []
    if @value is value
      result.push @
    if @_children?
      result = result.concat @_children.search value
    else
      result
