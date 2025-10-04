# Module-14-Assighnment
## Database Name
`task_manager`

## Tables
1. **users**
   - id (Primary Key)
   - name
   - email
   - created_at

2. **tasks**
   - id (Primary Key)
   - user_id (Foreign Key → users.id)
   - title
   - description
   - status (ENUM: pending, in-progress, completed)
   - created_at

## Relationship
- One-to-Many: One user can have multiple tasks.
- Implemented via `user_id` foreign key in `tasks`.

## Sample Data
- Inserted 3 users and multiple tasks for each.

## Queries
- **Select all tasks:** `SELECT * FROM tasks;`
- **Update status:** `UPDATE tasks SET status='completed' WHERE id=2;`
- **Delete a task:** `DELETE FROM tasks WHERE id=3;`
- **Sorting & Pagination:** `SELECT * FROM tasks ORDER BY created_at DESC LIMIT 5 OFFSET 0;`
- **Aggregator functions:**
- ---Count how many tasks each user has
- SELECT u.name, COUNT(t.id) AS total_tasks
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id
GROUP BY u.id;

-- Find user with max tasks
SELECT u.name, COUNT(t.id) AS total_tasks
FROM users u
JOIN tasks t ON u.id = t.user_id
GROUP BY u.id
ORDER BY total_tasks DESC
LIMIT 1;
##Inner Join
SELECT u.name, t.title, t.status
FROM users u
INNER JOIN tasks t ON u.id = t.user_id;
##Left Join
SELECT u.name, t.title, t.status
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id;
##Right Join
SELECT u.name, t.title, t.status
FROM users u
RIGHT JOIN tasks t ON u.id = t.user_id;
  - Count tasks per user  
  - Find user with maximum tasks
