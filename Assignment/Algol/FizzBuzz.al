main:(
BEGIN
    FOR i FROM 1 TO 100
    DO
        IF i MOD 3 = 0 AND i MOD 5 = 0 THEN
            print(("FizzBuzz", new line))
        ELIF i MOD 5 = 0 THEN
            print(("Buzz", new line))
        ELIF i MOD 3 = 0 THEN
            print(("Fizz", new line))
        ELSE 
            print((i, new line))
        FI
    OD
END
)

