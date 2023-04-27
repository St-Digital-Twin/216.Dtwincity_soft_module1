create table public.okved
(
    id                   serial
        primary key,
    okved                varchar
        unique,
    
    lvl1                 varchar,
    lvl2                 varchar,
    short_name           varchar,
    long_name            varchar,
    description          varchar
    
    
   
);

alter table public.okved
    owner to postgres;

