-- edit this bit

\set partition_start_date   '''' 2018-02-01 ''''
\set partition_end_date     '''' 2019-02-01 ''''
\set partition_interval     '''' 1 ' ' month ''''
\set target_schema          target


-- dont edit from here down
set search_path=:target_schema;

DROP TABLE if exists pidstat;

CREATE TABLE pidstat (
    cluster text,
    host  text,
    ts    timestamp,
    epoch integer,
    uid integer,
    procpid integer,
    cpu_usr numeric,
    cpu_sys numeric,
    cpu_guest numeric,
    cpu_total numeric,
    cpu_id integer,
    min_flt_per_sec numeric,
    max_flt_per_sec numeric,
    vsz integer,
    rss integer,
    mem_percent numeric,
    kb_rd_per_sec numeric,
    kb_wrt_per_sec numeric,
    kb_ccwr_per_sec numeric,
    command text
)
DISTRIBUTED RANDOMLY
PARTITION BY RANGE (ts) (START (:partition_start_date) END (:partition_end_date) EVERY (INTERVAL :partition_interval))
;


