# Example preprocessing script.
data.connection     <- dbConnect(dbDriver("SQLite"), dbname="data/noautoload/staticdump_sqlite.db");
static.dbconnection <- data.connection;

item.dt <- get.item.data();
name.dt <- get.name.data();
