create table public.unit
(
    id          serial
        primary key,
    long_name    varchar,
    description  varchar,
    unique_name  varchar,
    eng_name     varchar
);

alter table public.unit
    owner to postgres;

create unique index ix_unit_unique_name
    on public.unit (unique_name);

