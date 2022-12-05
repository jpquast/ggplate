.onAttach <- function(libname, pkgname) {
  if (.Platform$OS.type == "unix") {
    packageStartupMessage(
      "\U1F4CA Welcome to ggplate version ",
      utils::packageVersion("ggplate"),
      "! \U1F4C8
                            \n\U1F58D Have fun plotting your data! \U1F4BB"
    )
  }
  if (.Platform$OS.type == "windows") {
    packageStartupMessage(
      "Welcome to ggplate version ",
      utils::packageVersion("ggplate"), "!
                            \nHave fun plotting your data!"
    )
  }
}
