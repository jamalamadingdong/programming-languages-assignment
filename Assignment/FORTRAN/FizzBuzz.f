      program FizzBuzz

      integer i

      do 10 i = 1, 100, 1

      if(mod(i, 3) .EQ. 0 .AND. mod(i, 5) .EQ.  0) then

            write(*,'(A)',advance="no") 'Fizz Buzz, '

      elseif(mod(i, 5) .EQ. 0) then

            write(*,'(A)',advance="no") 'Buzz, '

      elseif(mod(i, 3) .EQ. 0) then

            write(*,'(A)',advance="no") 'Fizz, '

      else

            write(*,'(I3)',advance="no") i
            write(*,'(A)',advance="no") ', '

      endif


10    continue

      stop
      end program FizzBuzz
