SELECT name AS author_name, title
FROM authors
LEFT JOIN books ON books.author_id = author_id
ORDER BY author_name ASC, title ASC;