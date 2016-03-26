# tetris data

scripts for backing up, archiving, and releasing [tetris](https://tomhummel.com/2011/01/01/tetris-primer/) data

### backup

    export MYSQL_HOST=host
    export MYSQL_DB=db
    export MYSQL_USER=user
    export MYSQL_PASS=pass

    date
    > Sat Mar 26 11:49:53 PDT 2016

    make sql

    ls -lh dist/
    > dist/2016-03-26.sql

### archiving

    make tar
    make zip

    ls dist/
    > 2016-03-26.sql 2016-03-26.sql.tar.gz 2016-03-26.sql.zip

### release
