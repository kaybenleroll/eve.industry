# Example preprocessing script.
data.connection     <- dbConnect(dbDriver("SQLite"), dbname="data/noautoload/staticdump_sqlite.db");
static.dbconnection <- data.connection;

item.dt <- get.item.data();
name.dt <- get.name.data();

market.item.dt <- item.dt[!is.na(marketGroupID)];

idlist.asteroid <- market.item.dt[categoryName == 'Asteroid']$typeID;
idlist.material <- market.item.dt[categoryName == 'Material']$typeID;
idlist.pi       <- market.item.dt[categoryName == 'Planetary Commodities']$typeID;
idlist.ship     <- market.item.dt[categoryName == 'Ship']$typeID;

idlist.gas      <- market.item.dt[groupName == 'Harvestable Cloud']$typeID;
idlist.posfuel  <- market.item.dt[groupName == 'Fuel Block']$typeID;


idlist.t2mods   <- construction.t2mods$typeID;

idlist.marketdata <- c(idlist.asteroid, idlist.material, idlist.pi, idlist.ship, idlist.gas, idlist.t2mods);

idlist.buyitems   <- c(idlist.asteroid, idlist.material, idlist.pi, idlist.gas);
idlist.sellitems  <- c(idlist.posfuel);
