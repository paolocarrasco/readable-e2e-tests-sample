
Page = require("astrolabe").Page

module.exports = Page.create
  url: get: -> browser.baseUrl

  previewButton: get: -> element(By.id('preview'))
  previewDialog: get: -> element(By.id('preview_dialog'))
  rowCounterSection: get: -> element(By.id('preview_row_count'))
  attributeNameInput: get: -> element(By.id('schema_columns_attributes_0_name'))
  contentOfPreviewDialog: get: -> element(By.css('pre'))
  numberOfRowsToGenerate: get: -> element(By.id('num_rows'))

  checkPreviewContent: value: ->
    browser.switchTo().frame('preview_iframe')

  # mostrarIesAcreditadas: value: ->
  #   pagina = @
  #   pagina.botonMostrarIesAcreditadas.click()
