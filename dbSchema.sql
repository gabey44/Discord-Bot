

CREATE TABLE IF NOT EXISTS discord_users(

user_id bigint not null unique primary key ,
username varchar(33) not null ,
discriminator varchar(4) not null,
user_nick varchar(33)

);


GRANT SELECT, INSERT, UPDATE ON discord_users TO testbot;
GRANT SELECT, INSERT, UPDATE ON score TO testbot;
GRANT SELECT, INSERT, UPDATE ON ping_events TO testbot;

CREATE TABLE IF NOT EXISTS score(

user_id bigint primary key references discord_users not null,
total integer default 0,
daily_score integer default 0,
aether_wins smallint default 0,
aether_attempts smallint default 0,
aether_burns smallint default 0,
aether_gains integer default 0

);


CREATE TABLE IF NOT EXISTS ping_events(

ping_id serial primary key,
start_time time not null ,
end_time time,
active bool not null,
first_user bigint references discord_users

);