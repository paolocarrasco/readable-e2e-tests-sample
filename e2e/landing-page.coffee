
Page = require("astrolabe").Page

module.exports = Page.create
  url: get: -> browser.baseUrl

  previewButton: get: -> element(By.id('preview'))
  previewDialog: get: -> element(By.id('preview_dialog'))
  rowCounterSection: get: -> element(By.id('preview_row_count'))
  contentOfPreviewDialog: get: -> element(By.css('pre'))
  numberOfRowsToGenerate: get: -> element(By.id('num_rows'))
  attributeNameInput: value: (position) ->
    element(By.id("schema_columns_attributes_#{position}_name"))

  checkPreviewContent: value: ->
    browser.switchTo().frame('preview_iframe')

  withColumnName: value: (position, columnName) ->
    page = @
    page.attributeNameInput(position).
        sendKeys protractor.Key.CONTROL, 'a', protractor.Key.NULL, columnName

  withNumberOfRowsToGenerate: value: (rows) ->
    page = @
    page.numberOfRowsToGenerate.
        sendKeys protractor.Key.CONTROL, 'a', protractor.Key.NULL, rows
