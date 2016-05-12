page = require('./landing-page.coffee')

describe 'Check landing page', ->

  beforeEach ->
    browser.get('/')

  describe 'preview of the default test data', ->
    defaultTextForNumberOfRows = 'showing first 100 rows'

    When ->
      page.previewButton.click()

    Then ->
      expect(page.previewDialog.isDisplayed()).toBe true
    And ->
      expect(page.rowCounterSection.getText()).toBe defaultTextForNumberOfRows

  describe 'changing of the column name', ->
    newColumnName = 'code'

    Given ->
      page.attributeNameInput.
          sendKeys protractor.Key.CONTROL, 'a', protractor.Key.NULL, newColumnName

    When ->
      page.previewButton.click()

    Then ->
      page.checkPreviewContent()
      textFoundInPreviewPanel = page.contentOfPreviewDialog.getText()
      expect(textFoundInPreviewPanel).toMatch "^#{newColumnName}"

  describe 'generation of the number of rows defined', ->
    numberOfRows = 15

    Given ->
      page.numberOfRowsToGenerate.
          sendKeys protractor.Key.CONTROL, 'a', protractor.Key.NULL, numberOfRows

    When ->
      page.previewButton.click()

    Then (done) ->
      page.checkPreviewContent()
      page.contentOfPreviewDialog.getText().then (content) ->
        numberOfRowsInPreview = content.match(///\n///g,'').length
        expect(numberOfRowsInPreview).toBe numberOfRows
        done()
