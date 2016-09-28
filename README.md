# tetris data

Tools for backing up, archiving, and releasing [tetris](https://tomhummel.com/2011/01/01/tetris-primer/) data

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

### archive

    make tar
    make zip

    ls dist/
    > 2016-03-26.sql 2016-03-26.sql.tar.gz 2016-03-26.sql.zip

### release

    currently manual via github web

### semver

- **major**: schema changes
- **minor**: changes/updates/repairs to existing data
- **patch**: added new data

### database diff'ing

    # install mysql utils
    sudo apt-get install mysql-utilities

    # create and load two databases

    mysql -uroot -proot

    mysql> create database `t2007_03_24`;
    mysql> use t2007_03_24;
    mysql> source /tetris-data/dist/2007-03-24.sql;

    mysql> create database `t2016_03_26`;
    mysql> use t2016_03_26;
    source /tetris-data/dist/2016-03-26.sql;

    mysql> exit

    # compare
    mysqldbcompare --server1=root:root@localhost --server2=root:root@localhost t2007_03_24:t2007_03_26 -vv --run-all-tests
