--? CREAMOS LAS TABLAS

CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "role" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level_id" uuid,
  "teacher_id" int,
  "video_id" varchar,
  "categories_id" int
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "course_videos" (
  "id" uuid,
  "title" varchar,
  "url_video" varchar PRIMARY KEY,
  "duration" int,
  "thumbnail_url" varchar,
  "course" varchar
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "level" (
  "id" uuid PRIMARY KEY,
  "level" varchar
);

CREATE TABLE "teachers" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "users_courses" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "courses_id" uuid
);

--? APLICAMOS LAS RELACIONES ENTRE TABLAS
ALTER TABLE "courses" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("video_id") REFERENCES "course_videos" ("url_video");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "level" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role") REFERENCES "roles" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");


--? DATOS DE TABLA "ROLES"
insert into "roles" ( 
	id,
	name
) values ( 
	'b32c9825-deaf-4c7c-915f-336d1a4c2b9e',
	'student'
);
insert into "roles" ( 
	id, 
	name
) values ( 
	'06ff0efd-4bba-44d0-8c89-40a4823168cc',
	'teacher'
);
insert into "roles" ( 
	id, 
	name
) values ( 
	'17c71732-4852-4eb4-adf2-6765842e1327',
	'admin'
);

--? DATOS DE TABLA "USERS"
insert into "users" (
	id,
	name, 
	email, 
	password, 
	age,
	role
) values (
	'cf22e80a-1d4e-483f-b439-482a55a71ddb',
	'Diego',
	'mail1@mail.com',
	'root1',
	27,
	'06ff0efd-4bba-44d0-8c89-40a4823168cc'
);
insert into "users" (
	id, 
	name, 
	email, 
	password, 
	age,
	role
) values (
	'922e9d57-d5a4-4de5-99d1-06e0a0ff3ec2',
	'Juan',
	'mail2@mail.com',
	'root2',
	25,
	'06ff0efd-4bba-44d0-8c89-40a4823168cc'
);
insert into "users" (
	id, 
	name, 
	email, 
	password, 
	age,
	role
) values (
	'37653a19-15d3-4145-85ea-84e9c8af6e0b',
	'Milagros',
	'mail3@mail.com',
	'root3',
	24,
	'06ff0efd-4bba-44d0-8c89-40a4823168cc'
);
insert into "users" (
	id, 
	name, 
	email, 
	password, 
	age,
	role
) values (
	'1c535b51-6eec-4728-9ffa-c51a76b6af2f',	
	'Ezequiel',
	'mail4@mail.com',
	'root4',
	30,
	'06ff0efd-4bba-44d0-8c89-40a4823168cc'
);
insert into "users" (
	id, 
	name, 
	email, 
	password, 
	age,
	role
) values (
	'8d2bdb75-d428-4b77-be26-48e5331bf08a',	
	'Maria',
	'mail5@mail.com',
	'root5',
	35,
	'06ff0efd-4bba-44d0-8c89-40a4823168cc'
);
insert into "users" (
	id, 
	name, 
	email, 
	password, 
	age,
	role
) values (
	'576e30c7-6b45-4309-8457-1d7df89287f3',
	'Laura',
	'mail6@mail.com',
	'root6',
	41,
	'17c71732-4852-4eb4-adf2-6765842e1327'
);

--? DATOS DE TABLA "CATEGORIES"
insert into "categories" ( 
	id, 
	name 
) values (
	DEFAULT,
	'front-end'
);
insert into "categories" ( 
	id, 
	name 
) values (
	DEFAULT,
	'back-end'
);
insert into "categories" ( 
	id, 
	name 
) values (
	DEFAULT,
	'cyber-security'
);

--? DATOS DE TABLA "LEVEL"
insert into "level" (
	id,
	level
) values (
	'6c779106-7e75-4933-9683-91e94cdd6a10',
	'beginner'
);
insert into "level" (
	id,
	level
) values (
	'8fd24b04-5cee-4113-b70b-40da35956061', 
	'intermediate'
);
insert into "level" (
	id,
	level
) values (
	'7429c57b-5c6f-4927-8d77-d8f764a2c9aa', 
	'advanced'
);

--? DATOS DE TABLA "TEACHERS"
insert into "teachers" ( 
	id, 
	name
) values (
	DEFAULT, 
	'Ezequiel'
);
insert into "teachers" ( 
	id, 
	name 
) values ( 
	DEFAULT, 
	'Maria'
);

--? DATOS DE TABLA "COURSE-VIDEO"
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'cbae71ae-3011-45a3-b14a-520ffdb513b5',
	'Basics of JavaScript',
	'https://www.roadtowebfrontend.com/1',
	60,
	'https://www.roadtowebfrontend.com/img/1',
	'Road To Web Front-end'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'a3e22b57-ea4e-423f-99a1-1e4b207f5095',
	'Basics of HTML',
	'https://www.roadtowebfrontend.com/2',
	60,
	'https://www.roadtowebfrontend.com/img/2',
	'Road To Web Front-end'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'd10c71aa-4794-4410-a538-968bb320b172',
	'Basics of CSS',
	'https://www.roadtowebfrontend.com/3',
	60,
	'https://www.roadtowebfrontend.com/img/3',
	'Road To Web Front-end'
);

insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'41af592e-ae75-4a5c-8c8e-75ae39a265b7',
	'Basics of NodeJS',
	'https://www.roadtowebbackend.com/1',
	60,
	'https://www.roadtowebbackend.com/img/1',
	'Road To Web Back-end'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'0273989d-f51d-44de-bf8c-277092c2f875',
	'SQL',
	'https://www.roadtowebbackend.com/2',
	60,
	'https://www.roadtowebbackend.com/img/2',
	'Road To Web Back-end'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'76305c3c-0e0c-4180-b24f-51b389072c23',
	'Basics of Testing',
	'https://www.roadtowebbackend.com/3',
	60,
	'https://www.roadtowebbackend.com/img/3',
	'Road To Web Back-end'
);

insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'54aef9c4-78b3-4362-b2fa-8c1398bb19ba',
	'Basics of Monitoring & Detection',
	'https://www.roadtocybersecurity.com/1',
	60,
	'https://www.roadtocibersecurity.com/img/1',
	'Road To Cyber-Security'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'c90a3501-0eea-469d-a412-a989ae669bc7',
	'Basics of Offensive Operations',
	'https://www.roadtocybersecurity.com/2',
	60,
	'https://www.roadtocibersecurity.com/img/2',
	'Road To Cyber-Security'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'a2f1389a-2a5a-4ce5-b9f3-3780f7b9dd41',
	'Basics of Incident Response & Threat Hunting',
	'https://www.roadtocybersecurity.com/3',
	60,
	'https://www.roadtocibersecurity.com/img/3',
	'Road To Cyber-Security'
);



insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'9e3a45a6-aa1b-459e-9374-d6cb3f7bfa9b',
	'JavaScript',
	'https://www.webfrontendssr.com/1',
	60,
	'https://www.webfrontendssr.com/img/1',
	'Web Front-end Intermediate'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'46c172f5-8c58-4b32-9726-940f022eb4a2',
	'HTML Advanced',
	'https://www.webfrontendssr.com/2',
	60,
	'https://www.webfrontendssr.com/img/2',
	'Web Front-end Intermediate'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'1a376871-7b88-4342-94c1-adb31a3a5a5c',
	'SASS',
	'https://www.webfrontendssr.com/3',
	60,
	'https://www.webfrontendssr.com/img/3',
	'Web Front-end Intermediate'
);

insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'8ff20716-873f-474b-99b1-138c20c24eb5',
	'Express',
	'https://www.webbackendssr.com/1',
	60,
	'https://www.webbackendssr.com/img/1',
	'Web Back-end Intermediate'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'50b7ddd5-c83b-4a3f-ae98-e57fba6b08d9',
	'NoSQL',
	'https://www.webbackendssr.com/2',
	60,
	'https://www.webbackendssr.com/img/2',
	'Web Back-end Intermediate'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'1adbfdba-b267-4207-9ee5-7a9c2a375caa',
	'API & Caching',
	'https://www.webbackendssr.com/3',
	60,
	'https://www.webbackendssr.com/img/3',
	'Web Back-end Intermediate'
);

insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'9d486c6b-470a-4e39-bc54-52089775a8ff',
	'Cyber Defense Operations',
	'https://www.cybersecurityssr.com/1',
	60,
	'https://www.cibersecurityssr.com/img/1',
	'Cyber-Security Intermediate'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'b378cd2a-950c-4142-8365-5a1d262fa7b6',
	'Specialized Offensive Operations',
	'https://www.cybersecurityssr.com/2',
	60,
	'https://www.cibersecurityssr.com/img/2',
	'Cyber-Security Intermediate'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'264c5c3e-b95a-4b1a-8859-1be8af2f079c',
	'Threat Intel & Forensics',
	'https://www.cybersecurityssr.com/3',
	60,
	'https://www.cibersecurityssr.com/img/3',
	'Cyber-Security Intermediate'
);



insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'b3e04d3c-d4e9-4f22-8058-a2ed3cfb9d80',
	'React JS',
	'https://www.webfrontend.com/1',
	60,
	'https://www.webfrontend.com/img/1',
	'Web Front-end Advanced'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'e0bdeb0c-43d9-45a7-8341-d8a398e47e9c',
	'Custom Hooks',
	'https://www.webfrontend.com/2',
	60,
	'https://www.webfrontend.com/img/2',
	'Web Front-end Advanced'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'947a246d-1f75-409e-8dd9-77c066bd7a8d',
	'React-Router-Dom',
	'https://www.webfrontend.com/3',
	60,
	'https://www.webfrontend.com/img/3',
	'Web Front-end Advanced'
);

insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'ae619f00-6762-455d-b831-b6bfcbda34c2',
	'Architectural Patterns',
	'https://www.webbackend.com/1',
	60,
	'https://www.webbackend.com/img/1',
	'Web Back-end Advanced'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'860ab691-d4c3-4700-bf60-4f724edf2df8',
	'GraphQL',
	'https://www.webbackend.com/2',
	60,
	'https://www.webbackend.com/img/2',
	'Web Back-end Advanced'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'022ad87b-0f9e-4dc0-b7b8-df7bc35f6487',
	'Web Sockets',
	'https://www.webbackend.com/3',
	60,
	'https://www.webbackend.com/img/3',
	'Web Back-end Advanced'
);

insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'44fba251-043d-404c-a5ff-29fc99841683',
	'Cloud Security',
	'https://www.cybersecurity.com/1',
	60,
	'https://www.cibersecurity.com/img/1',
	'Cyber-Security Advanced'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'8ce65fd7-0eca-464b-a626-14d47ee0bcf9',
	'Security Management',
	'https://www.cybersecurity.com/2',
	60,
	'https://www.cibersecurity.com/img/2',
	'Cyber-Security Advanced'
);
insert into "course_videos" (
	id,
	title,
	url_video,
	duration,
	thumbnail_url,
	course
) values (
	'f6f57ae6-db6a-43b9-96f9-70049ba24947',
	'Advanced Management',
	'https://www.cybersecurity.com/3',
	60,
	'https://www.cibersecurity.com/img/3',
	'Cyber-Security Advanced'
);

--? DATOS DE TABLA "COURSES"
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'f262e292-4034-4a36-84c3-ff0e8bcb2f79',
	'Road To Web Front End 1',
	'In this course you will have all the basics that you need to start at Web Front end Development',
	'6c779106-7e75-4933-9683-91e94cdd6a10',
	1,
	'https://www.roadtowebfrontend.com/1',
	1
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'f6894270-38b9-4747-862a-19d3b7420090',
	'Road To Web Front End 2',
	'In this course you will have all the basics that you need to start at Web Front end Development',
	'6c779106-7e75-4933-9683-91e94cdd6a10',
	1,
	'https://www.roadtowebfrontend.com/2',
	1
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'68b2482d-4bde-405f-b4d8-260c89b1c9cc',
	'Road To Web Front End 3',
	'In this course you will have all the basics that you need to start at Web Front end Development',
	'6c779106-7e75-4933-9683-91e94cdd6a10',
	1,
	'https://www.roadtowebfrontend.com/3',
	1
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'd373d69d-24cb-47ca-92c4-b9d343f9013b',
	'Road To Web Front End 4',
	'In this course you will have more advanced knowledge that you need to continue at Web Front end Development',
	'8fd24b04-5cee-4113-b70b-40da35956061',
	1,
	'https://www.webfrontendssr.com/1',
	1
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'f034e914-5055-4b47-8afb-a6ef86964e3c',
	'Road To Web Front End 5',
	'In this course you will have more advanced knowledge that you need to continue at Web Front end Development',
	'8fd24b04-5cee-4113-b70b-40da35956061',
	1,
	'https://www.webfrontendssr.com/2',
	1
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'c907ca6d-e317-4e40-ae29-5d5d48010cf5',
	'Road To Web Front End 6',
	'In this course you will have more advanced knowledge that you need to continue at Web Front end Development',
	'8fd24b04-5cee-4113-b70b-40da35956061',
	1,
	'https://www.webfrontendssr.com/3',
	1
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'48988b39-5bf1-42ba-9df2-53fdfe4680a7',
	'Road To Web Front End 7',
	'In this course you will have all the advanced secrets that senior devs use day to day in Web Front End',
	'7429c57b-5c6f-4927-8d77-d8f764a2c9aa',
	1,
	'https://www.webfrontend.com/1',
	1
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'fc0156ad-388a-4046-8830-eb459a437c77',
	'Road To Web Front End 8',
	'In this course you will have all the advanced secrets that senior devs use day to day in Web Front End',
	'7429c57b-5c6f-4927-8d77-d8f764a2c9aa',
	1,
	'https://www.webfrontend.com/2',
	1
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'6ac66d84-f923-4178-8113-8b6ee676ebd0',
	'Road To Web Front End 9',
	'In this course you will have all the advanced secrets that senior devs use day to day in Web Front End',
	'7429c57b-5c6f-4927-8d77-d8f764a2c9aa',
	1,
	'https://www.webfrontend.com/3',
	1
 ); 

insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'e17cfab0-6508-41f0-8a1f-ddb762719544',
	'Road To Web Back End 1',
	'In this course you will have all the basics that you need to start at Web Back end Development',
	'6c779106-7e75-4933-9683-91e94cdd6a10',
	2,
	'https://www.roadtowebbackend.com/1',
	2
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'86eba579-3656-4edf-85aa-193a38b72aac',
	'Road To Web Back End 2',
	'In this course you will have all the basics that you need to start at Web Back end Development',
	'6c779106-7e75-4933-9683-91e94cdd6a10',
	2,
	'https://www.roadtowebbackend.com/2',
	2
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'a3489763-2472-4454-bc2b-8fce37f87e3b',
	'Road To Web Back End 3',
	'In this course you will have all the basics that you need to start at Web Back end Development',
	'6c779106-7e75-4933-9683-91e94cdd6a10',
	2,
	'https://www.roadtowebbackend.com/3',
	2
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'5584d876-6d85-4fec-b26b-367f705ca5af',
	'Road To Web Back End 4',
	'In this course you will have some advanced knowledge that you need to continue at Web Back end Development',
	'8fd24b04-5cee-4113-b70b-40da35956061',
	2,
	'https://www.webbackendssr.com/1',
	2
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'15e61340-13a4-4b34-9932-fbad3c7124a1',
	'Road To Web Back End 5',
	'In this course you will have some advanced knowledge that you need to continue at Web Back end Development',
	'8fd24b04-5cee-4113-b70b-40da35956061',
	2,
	'https://www.webbackendssr.com/2',
	2
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'816c8488-5208-4ae2-a2d3-22de105a25f1',
	'Road To Web Back End 6',
	'In this course you will have some advanced knowledge that you need to continue at Web Back end Development',
	'8fd24b04-5cee-4113-b70b-40da35956061',
	2,
	'https://www.webbackendssr.com/3',
	2
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'1f3b65d1-64c0-4149-9730-d0bebaa19a27',
	'Road To Web Back End 7',
	'In this course you will have all the advanced secrets that senior devs use day to day in Web Back End',
	'7429c57b-5c6f-4927-8d77-d8f764a2c9aa',
	2,
	'https://www.webbackend.com/1',
	2
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'f646b452-bdb9-446a-8bf7-c19a5aefca4a',
	'Road To Web Back End 8',
	'In this course you will have all the advanced secrets that senior devs use day to day in Web Back End',
	'7429c57b-5c6f-4927-8d77-d8f764a2c9aa',
	2,
	'https://www.webbackend.com/2',
	2
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'8c2263a1-9d80-46a6-a8bc-43336f19ef3a',
	'Road To Web Back End 9',
	'In this course you will have all the advanced secrets that senior devs use day to day in Web Back End',
	'7429c57b-5c6f-4927-8d77-d8f764a2c9aa',
	2,
	'https://www.webbackend.com/3',
	2
 ); 

insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'22b082ec-5e22-4dc0-8685-4cba8660a995',
	'Road To Cyber Security 1',
	'In this course you will have all the basics that you need to start at Cyber Security',
	'6c779106-7e75-4933-9683-91e94cdd6a10',
	1,
	'https://www.roadtocybersecurity.com/1',
	3
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'925020f3-f7ad-4438-80ee-d9445b9dcb67',
	'Road To Cyber Security 2',
	'In this course you will have all the basics that you need to start at Cyber Security',
	'6c779106-7e75-4933-9683-91e94cdd6a10',
	1,
	'https://www.roadtocybersecurity.com/2',
	3
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'4ec3312a-10f4-4e44-b795-fd0633edb94a',
	'Road To Cyber Security 3',
	'In this course you will have all the basics that you need to start at Cyber Security',
	'6c779106-7e75-4933-9683-91e94cdd6a10',
	1,
	'https://www.roadtocybersecurity.com/3',
	3
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'f096307f-981a-4c1f-8c19-9e8dad83b32f',
	'Road To Web Cyber Security 4',
	'In this course you will have some advanced knowledge that you need to continue at Cyber Security',
	'8fd24b04-5cee-4113-b70b-40da35956061',
	2,
	'https://www.cybersecurityssr.com/1',
	3
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'2c7466ae-3194-4a64-a15a-d2f1f47b3911',
	'Road To Web Cyber Security 5',
	'In this course you will have some advanced knowledge that you need to continue at Cyber Security',
	'8fd24b04-5cee-4113-b70b-40da35956061',
	2,
	'https://www.cybersecurityssr.com/2',
	3
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'bad2f470-972d-4156-94b3-4313fe354bce',
	'Road To Web Cyber Security 6',
	'In this course you will have some advanced knowledge that you need to continue at Cyber Security',
	'8fd24b04-5cee-4113-b70b-40da35956061',
	2,
	'https://www.cybersecurityssr.com/3',
	3
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'259fa6ee-7c46-4fb1-b91b-ab031881b19f',
	'Road To Cyber Security 7',
	'In this course you will have all the advanced secrets that senior DevSecOps use day to day in Cyber Security',
	'7429c57b-5c6f-4927-8d77-d8f764a2c9aa',
	2,
	'https://www.cybersecurity.com/1',
	3
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'898ed10c-10ca-40e7-b3c5-d7ef27e35982',
	'Road To Cyber Security 8',
	'In this course you will have all the advanced secrets that senior DevSecOps use day to day in Cyber Security',
	'7429c57b-5c6f-4927-8d77-d8f764a2c9aa',
	2,
	'https://www.cybersecurity.com/2',
	3
 ); 
insert into "courses" (
  id,
  title,
  description,
  level_id,
  teacher_id,
  video_id,
  categories_id
 ) values ( 
	'95432c3a-201a-4639-b50f-5c9b422c2d8f',
	'Road To Cyber Security 9',
	'In this course you will have all the advanced secrets that senior DevSecOps use day to day in Cyber Security',
	'7429c57b-5c6f-4927-8d77-d8f764a2c9aa',
	2,
	'https://www.cybersecurity.com/3',
	3
 ); 

 --? DATOS DE TABLA "USER_COURSES"
 insert into "users_courses" ( 
	id,
	user_id,
	courses_id 
) values ( 
	'62dd8413-5627-4e1a-914e-0c89350f5188',
	'cf22e80a-1d4e-483f-b439-482a55a71ddb',
	'f262e292-4034-4a36-84c3-ff0e8bcb2f79'
);
insert into "users_courses" ( 
	id,
	user_id,
	courses_id 
) values ( 
	'2f04bfee-2b6b-49c1-9040-4dd3472bbbbf',
	'cf22e80a-1d4e-483f-b439-482a55a71ddb',
	'd373d69d-24cb-47ca-92c4-b9d343f9013b'
);
insert into "users_courses" ( 
	id,
	user_id,
	courses_id 
) values ( 
	'0559d1bc-8bf1-48f2-be6c-6dce410dba0d',
	'cf22e80a-1d4e-483f-b439-482a55a71ddb',	
	'48988b39-5bf1-42ba-9df2-53fdfe4680a7'
);

insert into "users_courses" ( 
	id,
	user_id,
	courses_id 
) values ( 
	'f2a6fe80-404c-4efd-969f-ce546e4ded7d',
	'922e9d57-d5a4-4de5-99d1-06e0a0ff3ec2',
	'e17cfab0-6508-41f0-8a1f-ddb762719544'
);
insert into "users_courses" ( 
	id,
	user_id,
	courses_id 
) values ( 
	'a7e5dc20-4f40-4a96-8e49-0d14814ce729',
	'922e9d57-d5a4-4de5-99d1-06e0a0ff3ec2',
	'5584d876-6d85-4fec-b26b-367f705ca5af'
);
insert into "users_courses" ( 
	id,
	user_id,
	courses_id 
) values ( 
	'b8c66cbb-88f2-49d9-9953-132338398f21',
	'922e9d57-d5a4-4de5-99d1-06e0a0ff3ec2',
	'1f3b65d1-64c0-4149-9730-d0bebaa19a27'
);

insert into "users_courses" ( 
	id,
	user_id,
	courses_id 
) values ( 
	'a579c751-869e-4185-a19a-b8fee8e300cc',
	'37653a19-15d3-4145-85ea-84e9c8af6e0b',
	'22b082ec-5e22-4dc0-8685-4cba8660a995'
);
insert into "users_courses" ( 
	id,
	user_id,
	courses_id 
) values ( 
	'2d36d2c8-d805-429d-a85a-787dce198312',
	'37653a19-15d3-4145-85ea-84e9c8af6e0b',
	'925020f3-f7ad-4438-80ee-d9445b9dcb67'
);
insert into "users_courses" ( 
	id,
	user_id,
	courses_id 
) values ( 
	'3677398f-ad4e-46ef-b1e2-bf79e3ade03e',
	'37653a19-15d3-4145-85ea-84e9c8af6e0b',
	'4ec3312a-10f4-4e44-b795-fd0633edb94a'
);