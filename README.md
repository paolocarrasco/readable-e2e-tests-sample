# E2E sample tests

(Generated with [PageBoy Generator](https://github.com/mranosa/generator-pageboy)).

We will create readable E2E tests for the [Mockaroo](https://www.mockaroo.com/) application.

## Usage

- Run Tests: `npm test`

## Generators for more tests

Available generators:

* E2E
    - [pageboy](#app) (aka [pageboy:app](#app))
    - [pageboy:route](#route)
    - [pageboy:spec](#spec)
    - [pageboy:po](#pageobject)

### Route
Generates a new route.

Example:
```bash
yo pageboy:route myRoute
[?] What is the url of your route? www/app/myRoute
[?] What is the spec name? mySpec
```

Produces:

    www/app/myRoute/myRoute.po.js
    www/app/myRoute/myRoute.mySpec.spec.js

### Spec
Generates a jasmine spec.

Example:
```bash
yo pageboy:spec mySpec
[?] Where would you like to create this spec? www/app
```

Produces:

    www/app/app.mySpec.spec.js

### PageObject
Generates a page object.

Example:
```bash
yo pageboy:po myPo
[?] Where would you like to create this pageobject? www/app
```

Produces:

    www/app/myPo.po.js
