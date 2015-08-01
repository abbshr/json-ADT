# JSON Object to ADT
# implement Tree ADT
# author: ran <abbshr@outlook.com>

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
# .root() <ADT>
# .raw() <JSON Object>
# .search(value) <Array>


{isString, isNumber, isPrimitive, isArray} = require 'util'
Children = require './children'

class ADT

  constructor: (json, @_root = @) ->
    @name = "root"
    @_parent = null
    @_raw = json

    if isPrimitive json
      @value = json
      @_children = null
    else
      @value = null
      @_transfer json

  _transfer: (obj) ->
    children_arr =
    if isArray obj
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

  raw: () ->
    @_raw

  children: (i) ->
    switch
      when not i? then @_children
      when isString i then @_children?.key i
      when isNumber i then @_children?.from i

  parent: (level = 1) ->
    parent = @
    parent = parent?._parent for [1..level]
    parent

  search: (value) ->
    result = []
    if @value is value
      result.push @
    if @_children?
      result = result.concat @_children.search value
    else
      result

module.exports = ADT
