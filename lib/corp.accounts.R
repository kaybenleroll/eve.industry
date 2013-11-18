

read.wallet.transactions <- function(files) {

    read.file <- function(file) {
        walletID <- gsub('.*_(\\d{4})_\\d\\.xml', '\\1', file);

        node.lst <- t(sapply(getNodeSet(xmlRoot(xmlParse(file))[[2]], '//row'), xmlToList));

        if(dim(node.lst)[2] > 0) {
            iterfile.dt <- data.table(data.frame(t(sapply(getNodeSet(xmlRoot(xmlParse(file))[[2]], '//row'), xmlToList)), stringsAsFactors = FALSE));

            iterfile.dt[, walletID := walletID];
        } else {
            iterfile.dt <- NULL;
        }

        return(iterfile.dt);
    }

    wallet.dt <- data.table(file = files)[, read.file(.BY$file), by = file];
print(wallet.dt); print(str(wallet.dt));
    wallet.dt[, file    := NULL];
    wallet.dt[, date    := as.POSIXct(date)];
    wallet.dt[, amount  := as.numeric(amount)];
    wallet.dt[, balance := as.numeric(balance)];

    return(wallet.dt[order(date)]);
}
