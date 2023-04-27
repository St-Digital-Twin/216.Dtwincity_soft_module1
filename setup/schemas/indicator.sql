create table public.indicator
(
    id                serial
        primary key,
    long_name          varchar,
    description        varchar,     
    code               varchar,
    unit_id integer
);

alter table public.indicator
    owner to postgres;

create unique index ix_indicator_code
    on public.indicator (code);

create index ix_indicator_description
    on public.indicator (description);

create index ix_indicator_fact_type
    on public.indicator (fact_type);

create index ix_indicator_long_name
    on public.indicator (long_name);

create index ix_indicator_short_name
    on public.indicator (short_name);


