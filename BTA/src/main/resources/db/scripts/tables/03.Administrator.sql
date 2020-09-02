begin
    execute immediate 'drop table Administrator';
    dbms_output.put_line('Table Administrator dropped');
exception
    when others then dbms_output.put_line('Table Administrator did not exist');
end;
/
begin
    execute immediate 'drop sequence Administrator_seq';
    dbms_output.put_line('Sequence customer_sql dropped');
exception
    when others then dbms_output.put_line('Sequence customer_sql did not exist');
end;
/
create table Administrator
(
    id         number(19)  not null,
    first_name varchar(50) not null,
    last_name  varchar(50) not null,
    email      varchar(30) not null ,
    password   varchar(50) not null ,
    phone_number number       not null,
    constraint administrator_pk_id primary key (id)
);

create sequence Administrator_seq
    minvalue 10000 maxvalue 9999999999999999999 cycle
    start with 10000 increment by 1000 cache 1000;
/