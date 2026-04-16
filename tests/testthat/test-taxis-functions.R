test_that("filter_taxis filters by pickup_borough correctly", {
  res <- filter_taxis(taxis_reduit, pickup_borough = "Manhattan")
  expect_true(all(res$pickup_borough == "Manhattan"))
})

test_that("filter_taxis filters by payment correctly", {
  res <- filter_taxis(taxis_reduit, payment = "cash")
  expect_true(all(res$payment == "cash"))
})

test_that("filter_taxis filters by pickup_borough and payment correctly", {
  res <- filter_taxis(
    taxis_reduit,
    pickup_borough = "Manhattan",
    payment = "cash"
  )
  expect_true(all(res$pickup_borough == "Manhattan"))
  expect_true(all(res$payment == "cash"))
})

test_that("filter_taxis returns an error if data is not a data frame", {
  expect_error(
    filter_taxis(1:10, pickup_borough = "Manhattan"),
    "`data`"
  )
})

test_that("summarise_taxis_by_group returns a data frame with mean", {
  res <- summarise_taxis_by_group(
    taxis_reduit,
    group_var = "payment",
    value_var = "total",
    stat = "mean"
  )
  expect_true(is.data.frame(res))
  expect_true("summary_value" %in% names(res))
})

test_that("summarise_taxis_by_group works with median", {
  res <- summarise_taxis_by_group(
    taxis_reduit,
    group_var = "payment",
    value_var = "total",
    stat = "median"
  )
  expect_true(is.data.frame(res))
  expect_true("summary_value" %in% names(res))
})

test_that("summarise_taxis_by_group works with max", {
  res <- summarise_taxis_by_group(
    taxis_reduit,
    group_var = "payment",
    value_var = "total",
    stat = "max"
  )
  expect_true(is.data.frame(res))
  expect_true("summary_value" %in% names(res))
})

test_that("summarise_taxis_by_group returns an error if data is not a data frame", {
  expect_error(
    summarise_taxis_by_group(1:10, "payment", "total"),
    "`data`"
  )
})

test_that("summarise_taxis_by_group returns an error if group_var is invalid", {
  expect_error(
    summarise_taxis_by_group(taxis_reduit, "wrong_column", "total"),
    "`group_var`"
  )
})

test_that("summarise_taxis_by_group returns an error if value_var is invalid", {
  expect_error(
    summarise_taxis_by_group(taxis_reduit, "payment", "wrong_column"),
    "`value_var`"
  )
})

test_that("summarise_taxis_by_group returns an error if stat is invalid", {
  expect_error(
    summarise_taxis_by_group(taxis_reduit, "payment", "total", stat = "sum"),
    "`stat`"
  )
})

test_that("plot_taxis_summary returns a ggplot object", {
  p <- plot_taxis_summary(
    taxis_reduit,
    group_var = "payment",
    value_var = "total",
    stat = "mean"
  )
  expect_s3_class(p, "ggplot")
})

test_that("plot_taxis_summary works with median", {
  p <- plot_taxis_summary(
    taxis_reduit,
    group_var = "payment",
    value_var = "total",
    stat = "median"
  )
  expect_s3_class(p, "ggplot")
})

test_that("plot_taxis_summary works with max", {
  p <- plot_taxis_summary(
    taxis_reduit,
    group_var = "payment",
    value_var = "total",
    stat = "max"
  )
  expect_s3_class(p, "ggplot")
})
