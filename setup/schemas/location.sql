create table public.location
(
    id            serial
        primary key,
    long_name      varchar,
    description    varchar,
    oktmo          varchar
        unique,
    okato         varchar,
    long_name_eng  varchar,
    stage          varchar,
    type           varchar,
    latitude   real,
    longitude  real
);

alter table public.location
    owner to postgres;

create index ix_location_oktmo
    on public.location (oktmo);

create index ix_location_long_name
    on public.location (long_name);

