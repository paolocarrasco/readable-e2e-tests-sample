module.exports =
  selectAllAndPutOn: (element, text) ->
    element.sendKeys protractor.Key.CONTROL, 'a', protractor.Key.NULL, text
