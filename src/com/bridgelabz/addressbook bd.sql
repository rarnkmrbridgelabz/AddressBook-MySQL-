UC-1-Ability to create a AddressBook Service DB;
create database addressbook;
show databases;
use addressbook;

UC-2-Ability to create a AddressBook Table with first and last names, address, city,state, zip, phone number and email as its attributes;
create table addressbooktable (
id int primary key auto_increment,
firstname varchar(50),
lastname varchar(50),
address varchar(200),
city varchar(50),
state varchar(50),
zip int,
phonenumber varchar(10),
emailid varchar(20));
desc addressbooktable;

UC-3-Ability to insert new Contacts to AddresBook;
insert into addressbooktable (firstname, lastname, address, city, state, zip, phonenumber, emailid ) values 
('Arunkumar','R','AnnaNagar','Chennai','TN', 600001, 987654321,'arunkumar@gmail.com'),
('Sathishkumar','R','Hebbal','Mysore','KA', 600002, 987654322,'sathisk@gmail.com'),
('Hemnath','G', 'Katpadi', 'Vellore','RA', 600001, 9988776655,'hemnath@gmail.com'),
('Siddhu','A', 'AnnaNagar', 'Chennai','KA', 600414, 9988546214,'siddhu@gmail.com'),
('Hariharan','S','KKNagar', 'Chennai','TN', 600001, 9696969696, 'hari@gmail.com'), 
('Prashanth', 'K', 'Katpadi', 'Vellore','RA', 600048, 7859652321,'bush@gmail.com'),
('Gokul', 'B', 'katpadi', 'Vellore','RA',600001 ,9876543214 ,'chicken@gmail.com'), 
('Aravinth', 'S', 'AnnaNagar', 'Chennai','TN',600001,8795462130, 'aravinth@gmail.com');
select * from addressbooktable;
drop table addressbooktable;

UC_4-Ability to edit existing contact person using their name;
update addressbooktable set state = 'KA' where firstname ='Arunkumar';
select * from addressbooktable;

UC-5-Ability to delete a person using person name ;
delete from addressbooktable where firstname = 'Aravinth';
select * from addressbooktable;

UC-6-Ability to Retrieve Person belonging to a City or State from the Address Book;
select * from addressbooktable where state = 'TN';

UC-7-Ability to understand the size of address book by City and State;
select state, count(state) from addressbooktable where state = 'KA' group by state;
select state, count(city) from addressbooktable where city = 'Vellore' group by state;

UC-8-Ability to retrieve entries sorted alphabetically by Person’s name for a given city;
select firstname, lastname from addressbooktable order by firstname, lastname asc;

UC-9-Ability to identify each Address Book with name and Type;
alter table addressbooktable add Name varchar(20) after emailid;
alter table addressbooktable add Type varchar(20) after Name;
update addressbooktable set Name ='Monkey', type ='Family' where firstname = 'Arunkumar';
update addressbooktable set Name ='Chicken', type ='Friend' where firstname = 'Gokul';
update addressbooktable set Name ='Bush', type ='Artist' where zip = '600048';
update addressbooktable set Name ='Cool', type ='Friend' where firstname = 'Hemnath';

UC-10-Ability to get number of contact persons i.e. count by type;
select Type, count(type) from addressbooktable where phonenumber group by Type;

UC-11-Ability to add person to both Friend and Family;
insert into addressbooktable (firstname, lastname, address, city, state, zip, phonenumber, emailid,Name,type) value 
('Manigandan', 'A', 'IndiraNagar', 'Banglore','Karnataka', 547896, 8844226699, 'a@gmail.com','Kaka','Profession'),
('Kumar', 'B', 'Cochin', 'Cochin','Kerala', 485694, 7654214896, 'b@gmail.com','Psycho','Family');
select * from addressbooktable;