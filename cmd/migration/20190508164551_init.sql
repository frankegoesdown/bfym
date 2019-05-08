-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';

-- roles
create table roles
(
  id           integer not null constraint roles_pk primary key,
  access_level integer not null,
  name         text
);

alter table roles owner to postgres;

create unique index roles_id_uindex on roles (id);

create unique index roles_access_level_uindex  on roles (access_level);

-- users
create table users
(
  id                   serial  not null constraint users_pk primary key,
  first_name           text,
  last_name            text,
  username             text,
  password             text,
  last_password_change timestamp,
  email                text,
  phone                text,
  fb_uid               text,
  active               boolean,
  address              text,
  created_at           timestamp default now() not null,
  updated_at           timestamp default now() not null,
  role_id              integer constraint users_role_id_fk references roles,
  deleted_at           timestamp
);

alter table users owner to postgres;

create unique index users_id_uindex on users (id);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';
-- +goose StatementEnd
