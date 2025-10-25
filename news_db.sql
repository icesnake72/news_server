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
drop table if exists `source`;

CREATE TABLE `source` (
`id` bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
`sid` VARCHAR(45),
`name` VARCHAR(100) unique,
`description` VARCHAR(500),
`url` VARCHAR(500),
`category` VARCHAR(45),
`language` VARCHAR(45),
`country` VARCHAR(45),
`created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp,
`updated_at` TIMESTAMP NULL DEFAULT current_timestamp on update current_timestamp
);

-- 데이터가 있어서 테이블을 삭제할 수 없는 경우 수정하기
-- alter table `source`
-- add constraint uq_source_name unique (`name`);		-- name 컬럼에 unique 속성을 추가한다.

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

drop table if exists `article`;
CREATE TABLE `article` (
`id` bigint unsigned not null auto_increment primary key,
`source_id` bigint unsigned not null,
`category_id` bigint unsigned not null,
`author`varchar(100),
`title`varchar(255),
`description` text,
`url` varchar(500) unique,
`url_to_image` varchar(500),
`published_at` varchar(100),
`content` text,
`created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp,
`updated_at` TIMESTAMP NULL DEFAULT current_timestamp on update current_timestamp,
constraint foreign key(`source_id`) references `source`(`id`),
constraint foreign key(`category_id`) references `category`(`id`)
);

-- alter table : 테이블의 속성을 수정, 보완하는 명령
alter table article
add constraint foreign key(`source_id`) references `source`(`id`);

alter table article
add constraint foreign key(`category_id`) references `category`(`id`);


-- 테이블 이름 변경하기
-- alter table 지금 테이블명 rename to 변경할 테이블명;
alter table abc rename to article;
show tables;

select * from category;
select * from source;
select * from article;

-- 입력 : insert into
-- insert into 테이블명(컬럼명1, 컬럼명2, ...) values(데이터1, 데이터2, ...)[, (데이터1, 데이터2, ...)...];
insert into `category`(`name`, `memo`) values
('business', '경제뉴스'),
('entertainment', '연예뉴스'),
('sports', '스포츠'),
('health', '생활/건강'),
('technology', '기술'),
('science', '기초과학'),
('general', '뉴스일반');

-- 조회 select
/*
select 컬럼명1, 컬럼명2, ... [*(모든 컬럼)]
from 테이블명
[where 조건절] -- filtering
[join 조인 조건] -- 다른 테이블과 조인하여 데이터를 조회
[group by 그룹 조건] -- 컬럼별 통계 조회시
[order by 컬럼명1, 컬럼명2, ... [desc]] -- 컬럼별 정렬하기
*/

select `name`, `memo`
from `category`
where `name` like '%en%';	-- name 필드에 'en'이라는 글자가 포함된 row(행, 레코드)를 필터링한다

-- 데이터 삭제 
-- delete from
delete from `category` 
where `name`='general';	

-- 수정
/* 
update `테이블명` set 컬럼명 = '변경할 값'
where 조건절;
*/ 
-- category 테이블에서 name컬럼의 값이 science인 행의 memo 컬럼의 값을 '과학'으로 수정함
update `category`
set `memo` = '과학'
where `name` = 'science';

select * from category;


select * from `source`;

-- desc 테이블명 : 해당 테이블에 대한 정보를 보여준다
desc `source`;




