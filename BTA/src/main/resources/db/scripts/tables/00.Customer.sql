begin
    execute immediate 'drop table customer';
    dbms_output.put_line('Table customer dropped');
exception
    when others then dbms_output.put_line('Table customer did not exist');
end;
/
begin
    execute immediate 'drop sequence customer_seq';
    dbms_output.put_line('Sequence customer_sql dropped');
exception
    when others then dbms_output.put_line('Sequence customer_sql did not exist');
end;
/
create table customer
(
    id         number(19)  not null,
    first_name varchar(50) not null,
    last_name  varchar(50) not null,
    email      varchar(30) not null ,
    password   varchar(50) not null ,
    phone_number long       not null,
    billing_address varchar(255) not null ,
    constraint customer_pk_id primary key (id)
);

create sequence customer_seq
    minvalue 10000 maxvalue 9999999999999999999 cycle
    start with 10000 increment by 1000 cache 1000;
/