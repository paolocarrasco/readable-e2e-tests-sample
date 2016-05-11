describe "Check landing page",->
  beforeEach ->
    browser.get('/')
  it 'should show a preview of the default test data',->
    element(By.id('preview')).click()
    prevDlg=element(By.id('preview_dialog'))
    expect(prevDlg.isDisplayed()).toBe(true)
    expect(element(By.id('preview_row_count')).getText()).toEqual 'showing first 100 rows'
  it 'should change the column name',->
    element(By.id('schema_columns_attributes_0_name')).sendKeys(protractor.Key.CONTROL,'a',protractor.Key.NULL, 'code')
    element(By.id('preview')).click()
    browser.switchTo().frame('preview_iframe')
    expect(element(By.css('pre')).getText()).toMatch('^code')

  it 'should generate the number of rows defined',(done)->
    element(By.id('num_rows')).sendKeys protractor.Key.CONTROL,'a',protractor.Key.NULL, '15'
    element(By.id('preview')).click()
    browser.switchTo().frame('preview_iframe')
    element(By.css('pre')).getText().then (txt)->
      expect(txt.match(///\n///g,'').length).toBe 15
      done()
