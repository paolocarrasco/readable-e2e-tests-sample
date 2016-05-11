describe "Check landing page",->
  beforeEach ->
    browser.get('/')
  it 'should show a preview of the default test data',->
    element(By.id('preview')).click()
    prevDlg=element(By.id('preview_dialog'))
    expect(prevDlg.isDisplayed()).toBe(true)
  it 'should change the column name',->
    element(By.id('schema_columns_attributes_0_name')).sendKeys(protractor.Key.CONTROL,'a',protractor.Key.NULL, 'code')
    element(By.id('preview')).click()
    browser.switchTo().frame('preview_iframe')
    expect(element(By.css('pre')).getText()).toMatch('^code')
