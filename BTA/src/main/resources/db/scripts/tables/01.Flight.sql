begin
    execute immediate 'drop table flight';
    dbms_output.put_line('Table flight dropped');
exception
    when others then dbms_output.put_line('Table flight did not exist');
end;
/
begin
    execute immediate 'drop sequence flight_seq';
    dbms_output.put_line('Sequence flight_sql dropped');
exception
    when others then dbms_output.put_line('Sequence flight_sql did not exist');
end;
/
create table flight
(
    flight_id         number(19)  not null,
    origin           varchar(50) not null,
    destination       varchar(50) not null,
    time                timestamp not null ,
    quantity              number not NULL ,
    price                number not null ,
    constraint flight_pk_id primary key (flight_id)
);

create sequence flight_seq
    minvalue 10000 maxvalue 9999999999999999999 cycle
    start with 10000 increment by 1000 cache 1000;
/