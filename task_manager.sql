-- Create Database
CREATE DATABASE task_manager;
USE task_manager;

-- Create Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Tasks Table
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    status ENUM('pending', 'in-progress', 'completed') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert Users
INSERT INTO users (name, email) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');

-- Insert Tasks
INSERT INTO tasks (user_id, title, description, status) VALUES
(1, 'Buy groceries', 'Milk, Bread, Eggs', 'pending'),
(1, 'Finish report', 'Prepare sales report for Q3', 'in-progress'),
(1, 'Call mom', 'Weekly check-in call', 'completed'),

(2, 'Workout', 'Go to gym for 1 hour', 'pending'),
(2, 'Pay bills', 'Electricity and Internet bills', 'completed'),

(3, 'Read book', 'Read 30 pages of a novel', 'in-progress'),
(3, 'Plan trip', 'Plan for upcoming vacation', 'pending');

-- Select all tasks
SELECT * FROM tasks;

-- Update a task’s status
UPDATE tasks SET status = 'completed' WHERE id = 2;

-- Delete a task
DELETE FROM tasks WHERE id = 3;

-- Show tasks with Sorting and Limit/Pagination
SELECT * FROM tasks ORDER BY created_at DESC LIMIT 5 OFFSET 0;

-- Aggregator Functions (COUNT, MAX)
SELECT u.name, COUNT(t.id) AS total_tasks
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id
GROUP BY u.id;

SELECT u.name, COUNT(t.id) AS total_tasks
FROM users u
JOIN tasks t ON u.id = t.user_id
GROUP BY u.id
ORDER BY total_tasks DESC
LIMIT 1;

-- Inner Join
SELECT u.name, t.title, t.status
FROM users u
INNER JOIN tasks t ON u.id = t.user_id;

-- Left Join
SELECT u.name, t.title, t.status
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id;

-- Right Join
SELECT u.name, t.title, t.status
FROM users u
RIGHT JOIN tasks t ON u.id = t.user_id;
