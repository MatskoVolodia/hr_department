class Autocomplete
  constructor: (input, url, ransackAttribute) ->
    @input   = $(input)
    @url     = url
    @ransack = ransackAttribute

  init: ->
    @input.select2({
      ajax: {
        url: @url
        dataType: 'json'
        delay: 200
        data: (params) =>
          q:
            "#{@ransack}": params.term
        processResults: (data) ->
          results: data
        cache: true
      }
    })

window.HRDepartment ?= {}
window.HRDepartment.Autocomplete = Autocomplete