-- Winners from 1950
-- 1. Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

-- 1962 Literature
-- 2. Show who won the 1962 prize for Literature.
SELECT winner
FROM nobel
WHERE yr = 1962 
AND subject = 'Literature'

-- #Albert Einstein 
-- 3. Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject 
FROM nobel
WHERE winner = 'Albert Einstein'

-- #Recent Peace Prizes
-- 4. Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner 
FROM nobel
WHERE yr>= 2000 AND subject = 'Peace'

-- #Literature in the 1980's
-- 5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT * 
FROM nobel
WHERE subject = 'Literature' 
AND yr BETWEEN 1980 AND 1989

-- #Only Presidents
-- 6. Show all details of the presidential winners: Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama
SELECT * FROM nobel
WHERE winner IN ('heodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

-- #John
-- 7. Show the winners with first name John
SELECT winner FROM nobel
WHERE winner LIKE 'John%'

-- #Chemistry and Physics from different years
-- 8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT yr, subject, winner FROM nobel
WHERE (subject = 'physics' AND yr =1980) OR (subject = 'chemistry' AND yr = 1984)

-- #Exclude Chemists and Medics
-- 9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT yr, subject, winner FROM nobel
WHERE yr = 1980 AND NOT (subject = 'Chemistry' OR subject = 'Medicine')
-- 或者
SELECT yr, subject, winner
from nobel
where yr = 1980 
and subject not in ('Chemistry', 'Medicine')

-- # Early Medicine, Late Literature
-- 10. Show year, subject, and name of people who won a 'Medicine' prize 
-- in an early year (before 1910, not including 1910) together with winners
-- of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT yr, subject, winner FROM nobel
WHERE (subject='Medicine' AND yr < 1910) 
OR (subject='Literature' AND  yr >= 2004)

-- HARDER QUESTIONS

-- #Umlaut
-- 11. Find all details of the prize won by PETER GRÜNBERG
-- 方法： In macOS with an English keyboard layout (Australian, British, or U.S.): 
-- type ⌥ Option+U followed by ⇧ Shift+U for ⟨Ü⟩ 
-- or ⌥ Option+U and then U for ⟨ü⟩ or by keeping the U key pressed 
-- and then typing 2
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'

-- #Apostrophe
-- 12. Find all details of the prize won by EUGENE O'NEILL
-- 注意这道题，不能用python中斜线转义符的方法，否则会影响后续的输出， 用两个单引号即可
SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL'

-- #Knights of the realm
-- 13. Knights in order. 
--     List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%' 
ORDER BY yr DESC, winner

-- #Chemistry and Physics last
-- 14. The expression subject IN ('Chemistry','Physics')
--  can be used as a value - it will be 0 or 1.

-- Show the 1984 winners and subject ordered by subject and winner name; 
-- but list Chemistry and Physics last.
-- 这题重点，学习怎样用CASE
SELECT winner, subject FROM nobel
WHERE yr = 1984 
ORDER BY 
CASE WHEN subject IN ('Chemistry', 'Physics') THEN 1 ELSE 0 END, 
subject, winner