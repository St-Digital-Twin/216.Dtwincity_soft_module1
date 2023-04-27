create table public.scenario
(
    id               serial
        primary key,
    long_name        varchar,
    description      varchar,
    unique_name      varchar
);

alter table public.scenario
    owner to postgres;

create unique index ix_scenario_unique_name
    on public.scenario (unique_name);

