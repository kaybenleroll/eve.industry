# Example preprocessing script.
data.connection     <- dbConnect(dbDriver("SQLite"), dbname="data/noautoload/staticdump_sqlite.db");
static.dbconnection <- data.connection;

item.dt <- get.item.data();
name.dt <- get.name.data();

market.item.dt <- item.dt[!is.na(marketGroupID)];

extra.items <- c('Spatial Attunement Unit');

idlist.extras     <- item.dt[typeName %in% extra.items]$typeID;

idlist.asteroid   <- market.item.dt[categoryName == 'Asteroid']$typeID;
idlist.material   <- market.item.dt[categoryName == 'Material']$typeID;
idlist.pi         <- market.item.dt[categoryName == 'Planetary Commodities']$typeID;
idlist.pi.p0      <- market.item.dt[categoryName == 'Planetary Resources']$typeID;
idlist.ship       <- market.item.dt[categoryName == 'Ship']$typeID;
idlist.commodity  <- market.item.dt[categoryName == 'Commodity']$typeID;
idlist.subsystem  <- market.item.dt[categoryName == 'Subsystem']$typeID;
idlist.relics     <- market.item.dt[categoryName == 'Ancient Relics']$typeID;

idlist.gas        <- market.item.dt[groupName == 'Harvestable Cloud']$typeID;
idlist.posfuel    <- market.item.dt[groupName == 'Fuel Block']$typeID;
idlist.datacore   <- market.item.dt[groupName == 'Datacores']$typeID;
idlist.decryptor  <- market.item.dt[grep('Decryptor', groupName)]$typeID;



idlist.t2mods   <- construction.t2mods$typeID;

idlist.marketdata <- c(idlist.asteroid, idlist.material, idlist.pi, idlist.pi.p0, idlist.ship, idlist.gas, idlist.t2mods, idlist.datacore, idlist.decryptor, idlist.commodity, idlist.extras, idlist.subsystem, idlist.relics);

idlist.buyitems   <- c(idlist.asteroid, idlist.material, idlist.pi, idlist.pi.p0, idlist.gas, idlist.datacore, idlist.decryptor, idlist.commodity, idlist.extras, idlist.subsystem, idlist.relics);
idlist.sellitems  <- c(idlist.posfuel, idlist.subsystem);


idlist.marketdata <- sort(unique(idlist.marketdata));
idlist.buyitems   <- sort(unique(idlist.buyitems));
idlist.sellitems  <- sort(unique(idlist.sellitems));
