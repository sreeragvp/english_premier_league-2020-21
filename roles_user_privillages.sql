-- creating roles

CREATE ROLE epl4_stats,
	    epl4_dev,
            epl4_data_entry;

-- creating grants 

GRANT EXECUTE 
ON epl4.*
TO epl4_stats;

GRANT ALL
ON epl4.*
TO epl4_dev;

GRANT INSERT, UPDATE
ON epl4.*
TO epl4_data_entry;

-- creating users

CREATE USER IF NOT EXISTS developer_1@localhost IDENTIFIED  BY 'developer';
CREATE USER IF NOT EXISTS data_entry@localhost IDENTIFIED  BY 'dataentry';
CREATE USER IF NOT EXISTS match_analyst@localhost IDENTIFIED  BY 'matchanalyst';

-- granting roles to users

GRANT epl4_dev
TO developer_1@localhost;

GRANT epl4_stats
TO match_analyst@localhsot;

GRANT epl4_data_entry
TO match_analyst@localhost;








