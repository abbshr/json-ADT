# JSON Object to ADT
# implement Tree ADT
# author: ran <abbshr@outlook.com>

# Tree ADT
#
# struct {
#   name <string>,
#   value <string>,
#   _parent <object>,
#   _children <object>,
#   _root <object>
#   _raw <object>
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


util = require 'util'
Children = require './children'

module.exports = class ADT

  constructor: (json, @_root = @) ->
    @name = "root"
    @_parent = null
    @_raw = json
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

  raw: () ->
    @_raw

  children: (i) ->
    switch
      when not i? then @_children
      when util.isString i then @_children.key i
      when util.isNumber i then @_children.from i

  parent: (level = 1) ->
    parent = @
    parent = parent?._parent for [0..level - 1]
    parent

  search: (value) ->
    result = []
    if @value is value
      result.push @
    if @_children?
      result = result.concat @_children.search value
    else
      result
