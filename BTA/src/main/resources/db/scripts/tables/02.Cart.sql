begin
    execute immediate 'drop table cart';
    dbms_output.put_line('Table cart dropped');
exception
    when others then dbms_output.put_line('Table cart did not exist');
end;
/
begin
    execute immediate 'drop sequence cart_seq';
    dbms_output.put_line('Sequence cart_sql dropped');
exception
    when others then dbms_output.put_line('Sequence order_sql did not exist');
end;
/
create table cart
(
    id              number(19)  not null,
    customer_id     number(19)  not null,
    time            timestamp(20)     not null,
    status          number(1)       not null,
    constraint order_pk_id primary key (id),
    constraint customer_un_check_status check ( status in ('e', 'd')),
    constraint order_fk_customer_id foreign key (customer_id) references customer (id)
);

create sequence cart_seq
    minvalue 10000 maxvalue 9999999999999999999 cycle
    start with 10000 increment by 1000 cache 1000;
/