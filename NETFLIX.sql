/************ NETFLIX TV SHOWS AND MOVIES***************/

/********EXPLORATORY DATA ANALYSIS*********/

--Dataset Using

select*from credits$;
select*from titles$;

--ALL UNIQUE TVSHOW,MOVIE ON NETFLIX

--SHOWS

SELECT title,type
FROM titles$ WHERE type='SHOW';

--MOVIES

SELECT title,type 
FROM titles$ WHERE type='MOVIE';

--ALL MOVIE WHICH RELEASE IN YEAR OF 2000

SELECT title,type,release_year 
FROM titles$ WHERE release_year=2000 AND type='MOVIE' ;

--ALL SHOWS EHICH RELEASE IN 2018

SELECT title,type,release_year 
FROM titles$ WHERE release_year=2018 AND type='SHOW' ;

--COUNTING HOW MUCH MOVIES/SHOW TITLE RELEASE EACH RELEASE YEAR

SELECT RELEASE_YEAR,
type='MOVIE',
COUNT(TITLE)AS COUNT_TITLE 
FROM titles$ WHERE type='MOVIE' 
GROUP BY release_year
ORDER BY release_year deSC;

SELECT RELEASE_YEAR,
type='SHOW',
COUNT(TITLE)AS COUNT_TITLE 
FROM titles$ WHERE type='SHOW' 
GROUP BY release_year
ORDER BY release_year deSC;

--COUNT TOP 10 ALL MOVIES/SHOWS WHICH RUN MORE WITH GENRES IN NETFLIX

SELECT TOP 10 TITLE,type,genres,
release_year,runtime
FROM titles$ ORDER BY runtime DESC;

--COUNT TOP 10 IMDB SCORE IN ALL MOVIES/SHOWS 

SELECT TOP 10 release_year,
TITLE,type,genres,imdb_score
FROM titles$  ORDER BY imdb_score DESC;

--TOP 50 SHOWS WHICH HAVE MORE SEASONS

SELECT TOP 10 title,seasons ,type 
FROM titles$ WHERE type='SHOW'
ORDER BY seasons DESC ;

--TOP 10 MOVIES/SHOWS MOST PEOPLE VOTED ON IMDB  

SELECT TOP 10 release_year,
title,type,imdb_votes 
FROM titles$ ORDER BY imdb_votes DESC;

----COUNT TOP 10 TMDB SCORE IN ALL MOVIES/SHOWS

SELECT TOP 10 release_year,
TITLE,type,genres,tmdb_score
FROM titles$  ORDER BY tmdb_score DESC

----TOP 10 MOVIES/SHOWS MOST POPULARITY ON TMDB

SELECT TOP 10 release_year,
title,type,tmdb_popularity
FROM titles$ 
ORDER BY tmdb_popularity DESC;

---ALL MOVIES/SHOWS TITTLE ACTOR NAME AND CHARACTER NAME

SELECT B.release_year,
B.title,B.TYPE,A.name,
A.character,A.role FROM 
credits$ A JOIN titles$ B
ON A.id=B.id 
ORDER BY release_year DESC

--ALL MOVIES/SHOWS TITTLE ON THE YEAR OF 2000 ACTOR NAME AND CHARACTER NAME

SELECT B.release_year,
B.title,B.TYPE,A.name,
A.character,A.role FROM 
credits$ A JOIN titles$ B
ON A.id=B.id 
WHERE release_year=2000

--TOP 5+ IMDB RATING MOVIE/SHOWS NAME WITH WORKNG ACTOR NAME AND CHARACTER NAME

SELECT  B.release_year,
B.title,
B.TYPE,
A.name,
A.character,
B.imdb_score FROM 
credits$ A JOIN titles$ B 
ON A.id=B.id 
WHERE imdb_score>5.0
ORDER BY imdb_score DESC

--TOP 5+ TMDB RATING MOVIE/SHOWS NAME WITH WORKNG ACTOR NAME AND CHARACTER NAME

SELECT  B.release_year,
B.title,
B.TYPE,
A.name,
A.character,
B.tmdb_score FROM 
credits$ A JOIN titles$ B 
ON A.id=B.id 
WHERE tmdb_score>5.0
ORDER BY tmdb_score DESC

--FIND Movies is the longest and FIND one is the shortest?

--LONGEST

SELECT TOP 1 TITLE,type,genres,
release_year,runtime
FROM titles$ WHERE type ='MOVIE' ORDER BY runtime DESC;

--SHORTEST

SELECT TOP 1 TITLE,type,genres,
release_year,runtime
FROM titles$ WHERE type ='MOVIE' ORDER BY runtime ASC;

--FINDING THE (N) NO.2 TOP MOVIE

SELECT TOP 1  TITLE,type,genres,
release_year, runtime FROM
(SELECT TOP 2 TITLE,type,genres,
release_year,runtime
FROM titles$ WHERE type ='MOVIE' ORDER BY runtime DESC)AS TOPEST ORDER BY RUNTIME ASC;

--FINDING THE (N) NO.3 SHORTEST MOVIE

SELECT TOP 1  TITLE,type,genres,
release_year, runtime FROM
(SELECT TOP 3 TITLE,type,genres,
release_year,runtime
FROM titles$ WHERE type ='MOVIE' ORDER BY runtime ASC)AS LOWEST ORDER BY RUNTIME DESC

--FIND ALL CHILDREN(TV-Y) WHO WATCH THE MOVIE/SHOW 

SELECT title,genres,production_countries,age_certification
FROM titles$ 
WHERE age_certification='TV-Y'

--FIND ALL MATURE AUDIENCE WHO WATCH MOVIES/SHOWS

SELECT title,genres,production_countries,age_certification
FROM titles$ 
WHERE age_certification='TV-MA'

--FIND ALL GENERAL AUDIENCE WHO WATCH MOVIE/SHOWS

SELECT title,genres,production_countries,age_certification
FROM titles$ 
WHERE age_certification='TV-G'

