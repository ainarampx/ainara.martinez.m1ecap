
#' @importFrom rlang .data .env
NULL

#' Filtrer les trajets de taxi
#'
#' Filtre le jeu de donnees `taxis_reduit` selon le borough de prise en charge
#' et le type de paiement.
#'
#' @param data Un data frame, generalement `taxis_reduit`.
#' @param pickup_borough Une chaine de caracteres ou `NULL`.
#' @param payment Une chaine de caracteres ou `NULL`.
#'
#' @return Un tibble / data frame filtre.
#' @export
filter_taxis <- function(data, pickup_borough = NULL, payment = NULL) {
  if (!is.data.frame(data)) {
    stop("`data` doit etre un data frame.")
  }

  res <- data

  if (!is.null(pickup_borough)) {
    res <- dplyr::filter(res, .data$pickup_borough == .env$pickup_borough)
  }

  if (!is.null(payment)) {
    res <- dplyr::filter(res, .data$payment == .env$payment)
  }

  return(res)
}

#' Résumer les donnees de taxi par groupe
#'
#' Calcule une statistique descriptive groupee pour une variable numerique.
#'
#' @param data Un data frame, generalement `taxis_reduit`.
#' @param group_var Nom de la variable de regroupement (chaine de caracteres).
#' @param value_var Nom de la variable numerique (chaine de caracteres).
#' @param stat Statistique a calculer : `"mean"`, `"median"` ou `"max"`.
#'
#' @return Un tibble avec une ligne par groupe.
#' @export
summarise_taxis_by_group <- function(data, group_var, value_var, stat = "mean") {
  if (!is.data.frame(data)) {
    stop("`data` doit etre un data frame.")
  }

  if (!group_var %in% names(data)) {
    stop("`group_var` n'est pas une colonne de `data`.")
  }

  if (!value_var %in% names(data)) {
    stop("`value_var` n'est pas une colonne de `data`.")
  }

  if (!stat %in% c("mean", "median", "max")) {
    stop("`stat` doit etre l'un des suivants : 'mean', 'median', 'max'.")
  }

  if (stat == "mean") {
    res <- data |>
      dplyr::group_by(.data[[group_var]]) |>
      dplyr::summarise(summary_value = mean(.data[[value_var]], na.rm = TRUE), .groups = "drop")
  } else if (stat == "median") {
    res <- data |>
      dplyr::group_by(.data[[group_var]]) |>
      dplyr::summarise(summary_value = stats::median(.data[[value_var]], na.rm = TRUE), .groups = "drop")
  } else {
    res <- data |>
      dplyr::group_by(.data[[group_var]]) |>
      dplyr::summarise(summary_value = max(.data[[value_var]], na.rm = TRUE), .groups = "drop")
  }

  names(res)[1] <- group_var
  return(res)
}

#' Visualiser le resume des taxis par groupe
#'
#' Cree un diagramme en barres a partir du resume groupe produit par
#' `summarise_taxis_by_group()`.
#'
#' @param data Un data frame, generalement `taxis_reduit`.
#' @param group_var Nom de la variable de regroupement (chaine de caracteres).
#' @param value_var Nom de la variable numerique (chaine de caracteres).
#' @param stat Statistique a calculer : `"mean"`, `"median"` ou `"max"`.
#'
#' @return Un objet ggplot.
#' @export
plot_taxis_summary <- function(data, group_var, value_var, stat = "mean") {
  summary_df <- summarise_taxis_by_group(
    data = data,
    group_var = group_var,
    value_var = value_var,
    stat = stat
  )

  ggplot2::ggplot(summary_df, ggplot2::aes(x = .data[[group_var]], y = .data$summary_value)) +
    ggplot2::geom_col() +
    ggplot2::labs(
      x = group_var,
      y = paste(stat, value_var),
      title = paste("Statistique", stat, "de", value_var, "par", group_var)
    ) +
    ggplot2::theme_minimal()
}
