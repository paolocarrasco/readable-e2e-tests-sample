describe 'Check landing page', ->

  beforeEach ->
    browser.get('/')

  describe 'preview of the default test data', ->
    defaultTextForNumberOfRows = 'showing first 100 rows'

    When -> element(By.id('preview')).click()

    Then ->
      previewDialog = element(By.id('preview_dialog'))
      expect(previewDialog.isDisplayed()).toBe true
    And ->
      textFoundForNumberOfRows = element(By.id('preview_row_count')).getText()
      expect(textFoundForNumberOfRows).toBe defaultTextForNumberOfRows

  describe 'changing of the column name', ->
    newColumnName = 'code'

    Given ->
      element(By.id('schema_columns_attributes_0_name')).
          sendKeys protractor.Key.CONTROL, 'a', protractor.Key.NULL, newColumnName

    When -> element(By.id('preview')).click()

    Then ->
      browser.switchTo().frame('preview_iframe')
      textFoundInPreviewPanel = element(By.css('pre')).getText()
      expect(textFoundInPreviewPanel).toMatch "^#{newColumnName}"

  describe 'generation of the number of rows defined', ->
    numberOfRows = 15

    Given ->
      element(By.id('num_rows')).
          sendKeys protractor.Key.CONTROL, 'a', protractor.Key.NULL, numberOfRows

    When -> element(By.id('preview')).click()

    Then (done) ->
      browser.switchTo().frame('preview_iframe')
      element(By.css('pre')).getText().then (txt) ->
        numberOfRowsInPreview = txt.match(///\n///g,'').length
        expect(numberOfRowsInPreview).toBe numberOfRows
        done()
