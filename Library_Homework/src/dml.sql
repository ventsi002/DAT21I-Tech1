#1
SELECT * FROM tmember
WHERE cName = 'Jens S.'
AND dBirth <= '1970-1-1'
AND dNewMember >= '2013-1-1' AND dNewMember <= '2013-12-31';

#2
SELECT * FROM tbook
WHERE nPublishingCompanyID NOT IN ('15', '32')
OR (nPublishingCompanyID = '15' OR '32' AND nPublishingYear < '2000');

#3
SELECT cName, cSurname FROM tmember
WHERE cPhoneNo IS NOT NULL
AND cAddress IS NULL;

#4
SELECT * FROM tauthor
WHERE cSurname = 'Byatt'
AND cName LIKE 'A%' AND cName LIKE '%S%';

#5
SELECT * FROM tbook
WHERE nPublishingCompanyID = '32'
AND nPublishingYear = '2007';

#6
SELECT * FROM tloan
WHERE cCPR = '0305393207'
AND dLoan BETWEEN '2014-1-1' AND '2014-12-31';

#7
SELECT dLoan, count(cSignature) AS NumberOfBooks
FROM tloan
WHERE cCPR = '0305393207'
AND dLoan BETWEEN '2014-1-1' AND '2014-12-31'
GROUP BY dLoan HAVING count(cSignature) > 1;

#8
SELECT * FROM  tmember
ORDER BY dNewMember DESC, cName, cSurname;

#9
SELECT cTitle, cName FROM tbook, ttheme, tbooktheme
WHERE nPublishingCompanyID = '32'
AND (tbook.nBookID = tbooktheme.nBookID
         AND tbooktheme.nThemeID = ttheme.nThemeID);

#10
SELECT cName, cSurname, count(tbook.nBookID) AS NumberOfBooks
FROM tauthor, tauthorship, tbook
WHERE (tauthor.nAuthorID = tauthorship.nAuthorID
           AND tauthorship.nBookID = tbook.nBookID)
GROUP BY cName, cSurname HAVING count(tbook.nBookID);

#11
SELECT CONCAT(cName, ' ' ,cSurname) AS 'Author',
       MIN(nPublishingYear) AS 'Lowest publishing year' FROM tauthor, tbook, tauthorship
WHERE tauthor.nAuthorID = tauthorship.nAuthorID
AND tbook.nBookID = tauthorship.nBookID
AND tauthorship.nBookID IS NOT NULL
AND nPublishingYear GROUP BY Author;

#12
SELECT cTitle, cName, cSurname FROM tbook, tmember, tloan, tbookcopy
WHERE tloan.cSignature = tbookcopy.cSignature
AND tbookcopy.nBookID = tbook.nBookID
AND tloan.cCPR = tmember.cCPR;

#13.9
SELECT cTitle, CName
FROM tbook
INNER JOIN tbooktheme ON tbook.nBookID = tbook.nBookID
INNER JOIN ttheme ON ttheme.nThemeID = tbooktheme.nThemeID
WHERE nPublishingCompanyID = '32';

#22
SELECT cTitle FROM tbook
WHERE nPublishingYear BETWEEN '1926' AND '1978'
AND nPublishingCompanyID NOT IN ('32');

#23
SELECT cName, cSurname FROM tmember
WHERE dNewMember > '2016-01-01'
AND cAddress IS NULL;

#24
SELECT DISTINCT tcountry.nCountryID FROM tcountry, tpublishingcompany
WHERE tpublishingcompany.nCountryID = tcountry.nCountryID;

#25
SELECT cTitle FROM tbook
WHERE cTitle LIKE 'The Tale%'
AND nPublishingCompanyID NOT IN ('13');

#26
SELECT DISTINCT ttheme.cName FROM ttheme, tpublishingcompany, tbooktheme, tbook
WHERE tpublishingcompany.cName = 'Lynch Inc'
AND tpublishingcompany.nPublishingCompanyID = tbook.nPublishingCompanyID
AND tbook.nBookID = tbooktheme.nBookID
AND tbooktheme.nThemeID = ttheme.nThemeID;

#27
SELECT cTitle FROM tbook, tbookcopy, tloan
WHERE tbook.nBookID = tbookcopy.nBookID
AND tbookcopy.cSignature = tloan.cSignature

#28
SELECT cName, COUNT(tbook.nPublishingCompanyID) AS 'No. of Books' FROM tbook, tpublishingcompany
WHERE tbook.nPublishingCompanyID = tpublishingcompany.nPublishingCompanyID
GROUP BY cName;

#29
SELECT COUNT(cCPR) AS 'Member who took a book in 2013' FROM tloan
WHERE dLoan BETWEEN '2013-01-01' AND '2013-12-31';

#30
SELECT cTitle, COUNT(tauthor.nAuthorID) AS 'No. of Authors' FROM tbook, tauthor, tauthorship
GROUP BY cTitle HAVING 'No. of Authors' >= 2



