-- news 스키마를 생성하세요
create database news;
-- news 스키마를 사용하도록 선언하세요
use news;
-- category, source, article 테이블을 생성하세요.
-- category 테이블 : id(자동증가), name(문자열), memo(문자열), created_at, updated_at
CREATE TABLE `category` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(45) NOT NULL UNIQUE,
  `memo` VARCHAR(45),
  `created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  `updated_at` TIMESTAMP NULL DEFAULT current_timestamp on update current_timestamp
);
-- CREATE TABLE `source`;
-- CREATE TABLE `article`;

/*
id : bigint auto_increment
"sid": "abc-news",
"name": "ABC News",
"description": "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
"url": "https://abcnews.go.com",
"category": "general",
"language": "en",
"country": "us"
*/

-- 데이터가 없을경우에는 삭제후 다시 생성
drop table `source`;

CREATE TABLE `source` (
`id` bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
`sid` VARCHAR(45),
`name` VARCHAR(45) unique,
`description` VARCHAR(500),
`url` VARCHAR(500),
`category` VARCHAR(45),
`language` VARCHAR(45),
`country` VARCHAR(45),
`created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp,
`updated_at` TIMESTAMP NULL DEFAULT current_timestamp on update current_timestamp
);

-- 데이터가 있어서 테이블을 삭제할 수 없는 경우 수정하기
alter table `source`
add constraint uq_source_name unique (`name`);		-- name 컬럼에 unique 속성을 추가한다.

/*
id : bigint auto
source : bigint
category : bigint
"author": "Itzel Luna",
"title": "D4vd tour dates removed from websites after the discovery of a girl's body in Los Angeles",
"description": text, "The last two remaining dates in singer d4vd’s U.S. tour and multiple stops in his upcoming European tour have been removed from ticketing websites",
"url": varchar(1000), "https://www.wsbtv.com/entertainment/d4vd-tour-dates/TANYLVZN6FDILIXD7R2PDSJZ2A/",
"urlToImage": varchar(1000), "https://cmg-cmg-tv-10010-prod.cdn.arcpublishing.com/resizer/v2/https%3A%2F%2Fcloudfront-us-east-1.images.arcpublishing.com%2Fcmg%2FT5D47B7YJQHHSBLRJPX6WVFQFA.jpg?auth=fe1d1b22dc92420a9236929266bb9a5a9c14c3b953d710e03e82e93a8536cd5f&width=1200&height=630&smart=true",
"publishedAt": varchar(100), "2025-09-19T23:44:59Z",
"content": text, "LOS ANGELES — (AP) The last two remaining dates in singer d4vds U.S. tour and multiple stops in his upcoming European tour have been removed from ticketing websites, as authorities continue to invest… [+2616 chars]"
*/

drop table `article`;
CREATE TABLE `article` (
`id` bigint unsigned not null auto_increment primary key,
`source` bigint unsigned not null,
`category` bigint unsigned not null,
`author`varchar(50),
`title`varchar(50),
`description` text,
`url` varchar(500) unique,
`url_to_image` varchar(1000),
`published_at` varchar(100),
`content` text,
`created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp,
`updated_at` TIMESTAMP NULL DEFAULT current_timestamp on update current_timestamp
);

alter table article
add constraint foreign key(`source`) references `source`(`id`);
alter table article
add constraint foreign key(`category`) references `category`(`id`);


-- 테이블 이름 변경하기
-- alter table 지금 테이블명 rename to 변경할 테이블명;
alter table abc rename to article;
show tables;

select * from category;
select * from source;


