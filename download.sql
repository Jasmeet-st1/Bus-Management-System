create table bus_info(
    bus_id INT primary key,
    bus_name varchar(20),
    bus_type varchar(20),
    max_seat int
);

create table route_info (
    route_id varchar(6) primary key,
    source_loc varchar(20),
    destination_loc varchar(20)
);

create table bus_time_table (
    bus_id int,
    route_id varchar(6),
    source_departure_time varchar(10),
    destination_arrival_time varchar(10),
    fare int,
    foreign key(bus_id) references bus_info(bus_id),
    foreign key(route_id) references route_info(route_id)
);

insert into bus_info values(1,'prtc','ac',30);
insert into bus_info values(2,'prtc','non-ac',60);
insert into bus_info values(3,'prtc','non-ac slpr',40);
insert into bus_info values(4,'punbus','slpr',52);
insert into bus_info values(5,'prtc','ac slpr',48);
insert into bus_info values(6,'prtc','non-ac',36);
insert into bus_info values(7,'orbit','ac',65);
insert into bus_info values(8,'volvo','ac ',42);

insert into route_info values('r1','patiala','jammu');
insert into route_info values('r2','pathankot','bathinda');
insert into route_info values('r3','patiala','sirsa');
insert into route_info values('r4','amritsar','delhi');
insert into route_info values('r5','ludhiana','nangal');
insert into route_info values('r6','pathankot','ferozpur');
insert into route_info values('r7','bathinda','malerkotla');
insert into route_info values('r8','rajpura','fatehgarh sahib');
insert into route_info values('r9','patiala','delhi');
insert into route_info values('r10','patiala','rishikesh');
insert into route_info values('r11','chandigarh','delhi');

insert into bus_time_table values(1,'r2','07:40','13:50',250);
insert into bus_time_table values(2,'r1','07:42','09:33',125);
insert into bus_time_table values(3,'r3','21:44','04:50',90);
insert into bus_time_table values(4,'r4','11:40','19:36',390);
insert into bus_time_table values(5,'r5','12:35','16:35',200);
insert into bus_time_table values(6,'r6','01:12','05:21',190);
insert into bus_time_table values(8,'r8','22:40','23:50',45);
insert into bus_time_table values(7,'r7','13:45','19:30',125);
insert into bus_time_table values(8,'r4','16:36','02:20',40);
insert into bus_time_table values(7,'r3','10:26','17:05',80);
insert into bus_time_table values(6,'r2','19:25','01:10',320);
insert into bus_time_table values(5,'r8','18:20','22:44',90);
insert into bus_time_table values(4,'r1','23:12','06:48',180);
insert into bus_time_table values(3,'r4','08:00','01:15',70);
insert into bus_time_table values(2,'r3','06:40','07:55',245);
insert into bus_time_table values(1,'r5','09:40','11:55',154);
insert into bus_time_table values(1,'r9','09:40','17:55',154);
insert into bus_time_table values(2,'r10','22:40','04:55',240);
insert into bus_time_table values(8,'r11','20:40','04:55',600);


select route_info.source_loc,bus_time_table.source_departure_time,route_info.destination_loc,bus_time_table.destination_arrival_time,bus_info.bus_name,bus_info.bus_type,bus_time_table.fare,bus_info.max_seat from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id;

select route_info.source_loc,bus_time_table.source_departure_time,route_info.destination_loc,bus_time_table.destination_arrival_time,bus_info.bus_name,bus_info.bus_type,bus_time_table.fare,bus_info.max_seat from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id and to_number(substr(bus_time_table.source_departure_time,1,2))<8 and route_info.source_loc='pathankot';

select route_info.source_loc,bus_time_table.source_departure_time,route_info.destination_loc,bus_time_table.destination_arrival_time,bus_info.bus_name,bus_info.bus_type,bus_time_table.fare,bus_info.max_seat from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id and to_number(substr(bus_time_table.source_departure_time,1,2))>9 and route_info.source_loc='rajpura';

select route_info.source_loc,bus_time_table.source_departure_time,route_info.destination_loc,bus_time_table.destination_arrival_time,bus_info.bus_name,bus_info.bus_type,bus_time_table.fare,bus_info.max_seat from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id and route_info.source_loc='bathinda';

select route_info.source_loc,bus_time_table.source_departure_time,route_info.destination_loc,bus_time_table.destination_arrival_time,bus_info.bus_name,bus_info.bus_type,bus_time_table.fare,bus_info.max_seat from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id and to_number(substr(bus_time_table.source_departure_time,1,2))>11 and route_info.source_loc='patiala';

select route_info.source_loc,bus_time_table.source_departure_time,route_info.destination_loc,bus_time_table.destination_arrival_time,bus_info.bus_name,bus_info.bus_type,bus_time_table.fare,bus_info.max_seat from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id and bus_type='non-ac';

select route_info.source_loc,bus_time_table.source_departure_time,route_info.destination_loc,bus_time_table.destination_arrival_time,bus_info.bus_name,bus_info.bus_type,bus_time_table.fare,bus_info.max_seat from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id and source_loc='amritsar' and destination_loc='delhi';

select route_info.source_loc,bus_time_table.source_departure_time,route_info.destination_loc,bus_time_table.destination_arrival_time,bus_info.bus_name,bus_info.bus_type,bus_time_table.fare,bus_info.max_seat from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id and source_loc='patiala' and destination_loc='rishikesh' and bus_type='non-ac' and to_number(substr(bus_time_table.destination_arrival_time,1,2))<5;

select route_info.source_loc,bus_time_table.source_departure_time,route_info.destination_loc,bus_time_table.destination_arrival_time,bus_info.bus_name,bus_info.bus_type,bus_time_table.fare,bus_info.max_seat from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id and source_loc='chandigarh' and destination_loc='delhi' and bus_name='volvo';


-- ----------------------------------------------------------
-- List of all buses order by their departure time
select route_info.source_loc,bus_time_table.source_departure_time,route_info.destination_loc,bus_time_table.destination_arrival_time,bus_info.bus_name,bus_info.bus_type,bus_time_table.fare,bus_info.max_seat from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id order by to_number(substr(bus_time_table.source_departure_time,1,2));

-- List all buses in ascending order to their maximum seats
select * from bus_info order by max_seat;

-- No of buses originating from one city.
select route_info.source_loc,count(bus_time_table.bus_id) as "NO. of buses" from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id group by route_info.source_loc;

-- All buses from 'patiala' to 'sirsa' with sorting according to fare 
select route_info.source_loc,source_departure_time,route_info.destination_loc,destination_arrival_time,bus_info.bus_type,fare from bus_info,route_info,bus_time_table where bus_info.bus_id=bus_time_table.bus_id and route_info.route_id=bus_time_table.route_id and source_loc='patiala' and destination_loc='sirsa' order by fare;