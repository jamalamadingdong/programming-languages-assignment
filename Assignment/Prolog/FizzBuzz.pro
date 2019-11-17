fizzbuzz(N) :- 0 is mod(N, 15), write('FizzBuzz'), nl.
fizzbuzz(N) :- 0 is mod(N, 5), write('Buzz'), nl.
fizzbuzz(N) :- 0 is mod(N, 3), write('Fizz'), nl.
fizzbuzz(N) :- write(N), nl.

recursion(0).
recursion(N) :- N1 is N - 1, recursion(N1), fizzbuzz(N).

main :- recursion(1000).
:- initialization(main).
