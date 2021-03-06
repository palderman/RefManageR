context("BibEntry")

## unloadNamespace("RefManageR")
## library(RefManageR)

test_that("BibEntry function parses LaTeX-style name fields", {
  bib <- BibEntry(bibtype = "Article", key = "mclean2014",
                  title = "An Article Title",
                  editora = "Smith, Bob",
                  author = "McLean, Mathew W. and Ruppert, David and Wand, Matt P.",
                  journaltitle = "The Journal Title",date = "2014-02-06",
                  pubstate = "forthcoming")  
  expect_equal(length(bib$author$family), 3L)
  expect_equal(length(bib$author[[3]]$given), 2L)
  expect_equal(bib$editora$given, "Bob")
})

test_that("BibEntry still works if latexToUtf8 hangs", {
  bib <- BibEntry(bibtype = "Article", key = "mclean2014",
                  title = "An Article Title",
                  editora = "Smith, Bob",
                  author = "Abad, Mar{\\'\\i}a J. F. and Balboa, Mar{\\a'\\i}a A",
                  journaltitle = "The Journal Title",date = "2014-02-06",
                  pubstate = "forthcoming")
  expect_output(print(bib))
  expect_equal(length(bib$author$family), 2L)
})
