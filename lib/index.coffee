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

class ADT

  constructor: (json, @_root = @) ->
    @name = "root"
    @_parent = null
    if util.isPrimitive json
      @value = json
      @_children = null
    else
      @value = null
      @_children = []
      @_transfer json

  _transfer: (obj) ->
    children_arr =
    if util.isArray obj
      @_createChildADT i, v for v, i in obj
    else
      @_createChildADT k, v for k, v of obj

    @_children = new Children children_arr

  _createChildADT: (k, v) ->
    node = new ADT v, @_root
    node.name = k
    node._parent = @
    node

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

module.exports = ADT
