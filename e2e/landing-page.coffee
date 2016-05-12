describe 'Check landing page', ->

  beforeEach ->
    browser.get('/')

  it 'should show a preview of the default test data', ->
    defaultTextForNumberOfRows = 'showing first 100 rows'

    element(By.id('preview')).click()

    previewDialog = element(By.id('preview_dialog'))

    expect(previewDialog.isDisplayed()).toBe true
    expect(element(By.id('preview_row_count')).getText()).
        toBe defaultTextForNumberOfRows

  it 'should change the column name',->
    newColumnName = 'code'

    element(By.id('schema_columns_attributes_0_name')).
        sendKeys protractor.Key.CONTROL, 'a', protractor.Key.NULL, newColumnName

    element(By.id('preview')).click()
    browser.switchTo().frame('preview_iframe')

    expect(element(By.css('pre')).getText()).toMatch "^#{newColumnName}"

  it 'should generate the number of rows defined', (done) ->
    numberOfRows = 15

    element(By.id('num_rows')).
        sendKeys protractor.Key.CONTROL, 'a', protractor.Key.NULL, numberOfRows

    element(By.id('preview')).click()
    browser.switchTo().frame('preview_iframe')

    element(By.css('pre')).getText().then (txt) ->
      expect(txt.match(///\n///g,'').length).toBe numberOfRows
      done()
