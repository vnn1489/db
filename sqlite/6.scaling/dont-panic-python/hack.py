from cs50 import SQL

db = SQL("sqlite:///dont-panic.db")

db.execute(
    """
    UPDATE "users"
    SET "password" = 'Clock’s ticking!'
    WHERE "username" = 'admin';
    """
)

password = input("Enter a password: ")
db.execute(
    """
    UPDATE "users"
    SET "password" = 'CS50'
    WHERE "username" = 'admin';       
    """
)