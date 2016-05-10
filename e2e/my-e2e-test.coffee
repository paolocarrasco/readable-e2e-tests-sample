describe "Check landing page", ->

  beforeEach ->
    browser.get('/')

  it 'should have the name of the app as title', ->
    expect(browser.getTitle()).toMatch "Mockaroo - Random Data Generator"
