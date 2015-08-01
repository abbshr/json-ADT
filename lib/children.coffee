
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

{isNumber} = require 'util'

module.exports = class Children

  constructor: (@_arr = children_arr) ->
    @_cursor = 0

  parent: (level = 1) ->
    parent = @_arr[@_cursor]
    parent = parent?._parent for [1..level]
    parent

  raw: () ->
    @parent().raw()

  from: (index) ->
    @_cursor = if index >= @_arr.length
        @_arr.length - 1
      else if index < 0
        0
      else
        index
    @_arr[@_cursor]

  key: (name) ->
    child for child in @_arr when child.name is name

  current: () ->
    @_arr[@_cursor]

  next: () ->
    if @_cursor + 1 >= @_arr.length
      null
    else
      @_arr[++@_cursor]

  previous: () ->
    if @_cursor <= 0
      null
    else
      @_arr[--@_cursor]

  insertAfter: (pos, adt) ->
    @_cursor++ if @_cursor > pos
    @_arr.splice pos + 1, 0, adt

  insertBefore: (pos, adt) ->
    @_cursor++ if @_cursor >= pos
    @_arr.splice pos, 0, adt

  remove: (pos) ->
    @_cursor-- if @_cursor >= pos
    @_arr.splice pos, 1

  push: (adt) ->
    @_arr.push adt

  pop: () ->
    @_arr.pop()

  shift: () ->
    @_arr.shift()

  unshift: (adt) ->
    @_arr.unshift adt

  search: (value) ->
    result = []
    result = result.concat child.search value for child in @_arr
    result
