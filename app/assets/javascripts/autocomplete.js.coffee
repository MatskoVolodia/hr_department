class Autocomplete
  constructor: (input, url, ransackAttribute, preselectUrl) ->
    @input        = $(input)
    @url          = url
    @ransack      = ransackAttribute
    @preselectUrl = preselectUrl

  init: ->
    @input.select2(
      multiple: true
      ajax:
        url: @url
        dataType: 'json'
        delay: 200
        data: (params) =>
          q:
            "#{@ransack}": params.term
        processResults: (data) ->
          results: data
        cache: true
    )

    @loadPreselected() if @preselectUrl

  loadPreselected: ->
    $.ajax(
      type: 'GET'
      url: @preselectUrl
    ).then (data) =>
      for item in data
        option = new Option(item.text, item.id, true, true)
        @input.append(option).trigger('change')
        @input.trigger(
          type: 'select2:select'
          params:
            data: item
        )

window.HRDepartment ?= {}
window.HRDepartment.Autocomplete = Autocomplete