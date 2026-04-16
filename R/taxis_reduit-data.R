#' Jeu de donnees des trajets de taxi
#'
#' Jeu de donnees reduit construit a partir du jeu de donnees open data disponible a l'adresse suivante :#' https://github.com/mwaskom/seaborn-data/blob/master/taxis.csv
#'
#' @format Un data frame avec 3733 observations et 14 variables :
#' \describe{
#'   \item{pickup}{Date et heure de prise en charge}
#'   \item{dropoff}{Date et heure de dépose}
#'   \item{passengers}{Nombre de passagers}
#'   \item{distance}{Distance du trajet}
#'   \item{fare}{Montant de la course}
#'   \item{tip}{Pourboire}
#'   \item{tolls}{Montant des péages}
#'   \item{total}{Montant total}
#'   \item{color}{Couleur du taxi}
#'   \item{payment}{Type de paiement}
#'   \item{pickup_zone}{Zone de prise en charge}
#'   \item{dropoff_zone}{Zone de dépose}
#'   \item{pickup_borough}{Arrondissement de prise en charge}
#'   \item{dropoff_borough}{Arrondissement de dépose}
#' }
#' @source \url{https://github.com/mwaskom/seaborn-data/blob/master/taxis.csv}
"taxis_reduit"
