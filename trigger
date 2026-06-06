CREATE TABLE faculty_log (
    Message VARCHAR(100)
);
DELIMITER //

CREATE TRIGGER faculty_trigger
AFTER INSERT ON faculty
FOR EACH ROW
BEGIN
    INSERT INTO faculty_log
    VALUES ('New Faculty Record Inserted');
END //

DELIMITER ;
INSERT INTO faculty
VALUES (1238, 'Sneha', 'Nagpur', 'Java');

ALTER TABLE student
ADD pointer FLOAT;
DROP TRIGGER IF EXISTS student_result_trigger;

DELIMITER //

CREATE TRIGGER student_result_trigger
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
    IF NEW.pointer > 8.0 THEN
        SET NEW.Result = 'Pass';
    ELSE
        SET NEW.Result = 'Fail';
    END IF;
END //

DELIMITER ;

INSERT INTO student
(PRN, NAME, Address, UID, pointer)
VALUES
(29, 'Snehal', 'Nagpur', 1, 8.5);
