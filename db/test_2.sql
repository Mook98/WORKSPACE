-- subquery 또는 join을 사용해서 아래에 해당하는 sql을 작성하세요
-- 가장 비싼 도서의 이름을 보이시오
USE bookstore;

SELECT bookname, price
FROM book
WHERE price = (SELECT MAX(price)
			   FROM book);

                   
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오

SELECT *
FROM customer
WHERE custid IN (SELECT custid
				FROM orders);

SELECT DISTINCT(name)
FROM customer c
INNER JOIN orders o
ON c.custid = o.custid
WHERE c.custid = o.custid;
                

-- 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오

SELECT name, bookname, publisher
FROM customer c
INNER JOIN orders o
ON c.custid = o.custid
INNER JOIN book b
ON o.bookid = b.bookid
WHERE b.publisher = '대한미디어';


SELECT name
FROM customer
WHERE custid IN (SELECT custid
				 FROM orders
                 WHERE bookid IN (SELECT bookid
								  FROM book
                                  WHERE publisher = '대한미디어'));
                                  

-- 주문이 있는 고객의 이름과 주소를 보이시오
