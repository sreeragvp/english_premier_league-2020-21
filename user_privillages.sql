CREATE USER MatchAnalyst@localhost IDENTIFIED BY 'MatchAnalyst';

GRANT EXECUTE
ON  epl4.*
TO MatchAnalyst@localhost;

CREATE USER DataEntry@localhost IDENTIFIED BY 'DataEntry';

GRANT INSERT,UPDATE
ON epl4.*
TO DataEntry@localhost;

CREATE USER JuniorDatabaseAdministrator@localhost IDENTIFIED BY 'JuniorDatabaseAdministrator';

GRANT CREATE,ALTER,DELETE,DROP
ON epl4.*
TO JuniorDatabaseAdministrator@localhost;




