with Ada.Text_IO;

procedure BubbleSort is
	package IO renames Ada.Text_IO;
    type Arr is array (Positive range <>) of Integer;
	temp : Integer;
    A : Arr := (1, 3, 256, 0, 3, 4, -1);
begin
    IO.Put("Unsorted Array: ");
    for II in A'Range loop
        IO.Put(Integer'Image(A(II)));
    end loop;

    IO.Put_Line("");
    for I in A'Range loop
        for J in A'First .. I loop
            if A(I) < A(J) then
                temp := A(J);
                A(J) := A(I);
                A(I) := temp;
                IO.Put_Line("Sorting: " & Integer'Image(A(I)) & " swap with " & Integer'Image(A(J)));
            end if;
        end loop;
    end loop;

    IO.Put("Sorted Array: ");
    for JJ in A'Range loop
        IO.Put(Integer'Image(A(JJ)));
    end loop;
end BubbleSort;

