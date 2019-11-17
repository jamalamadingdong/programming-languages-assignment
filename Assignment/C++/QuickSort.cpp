#include "Book.hpp"
#include <iostream>
#include <string>
#include <time.h>
#include <stdlib.h>
#include <stdio.h>

//Swaps object Book
void swap(Book* a, Book* b)
{
    Book temp = *a;
    *a = *b;
    *b = temp;
}

int doPartitioning(Book arr[], int leftIdx, int rightIdx, int pivotIdx)
{
    int ii, newPivotIdx;
    Book pivotVal = arr[pivotIdx];
    arr[pivotIdx] = arr[rightIdx];
    arr[rightIdx] = pivotVal;

    int currIdx = leftIdx;

    for(ii = leftIdx; ii <= rightIdx - 1; ii++)
    {
        if(arr[ii].GetBookID() < pivotVal.GetBookID())
        {
            swap(&arr[ii], &arr[currIdx]);
            currIdx++;
        }
    }

    newPivotIdx = currIdx;
    arr[rightIdx] = arr[newPivotIdx];
    arr[newPivotIdx] = pivotVal;

    return newPivotIdx;
}

void quickSortRecurse(Book arr[], int leftIdx, int rightIdx)
{
    int pivotIdx, newPivotIdx;
    if(rightIdx > leftIdx)
    {
        pivotIdx = (leftIdx + rightIdx) / 2;
        newPivotIdx = doPartitioning(arr, leftIdx, rightIdx, pivotIdx);

        quickSortRecurse(arr, leftIdx, newPivotIdx -1);
        quickSortRecurse(arr, newPivotIdx + 1, rightIdx);
    }
}

void quickSortByID(Book arr[], const int cap)
{
    quickSortRecurse(arr, 0, cap-1);
}

int main()
{
    const int cap = 4;
    Book books[cap];

    int ids[] = { 19287368, 18932546, 12796543, 23549567 };
    std::string names[] = { "JavaScript: How to Die", "C: Ways to Seg Fault", 
                            "Python: Data Types", 
                            "Perl: Why it is a good language"};
    std::string isbns[] = {"0-1668-6670-9", "0-4662-7244-8", "0-5990-9572-5",
                           "0-7014-2336-6"};

    for(int i = 0; i < cap; i++)
    {
        books[i].SetBookID(ids[i]);
        books[i].SetBookName(names[i]);
        books[i].SetBookISBN(isbns[i]);
    }

    std::cout << "-------------Unsorted-------------" << std::endl;
    for(int i = 0; i < cap; i++)
    {
        std::cout << "Book ID: " << books[i].GetBookID() << std::endl;
        std::cout << "| Book Name: " << books[i].GetBookName() << std::endl;
        std::cout << "| ISBN: " << books[i].GetISBN() << std::endl;
        std::cout << "--------------------------" << std::endl;
    }

    quickSortByID(books, cap);
    std::cout << 
        "===============================================\n\t\tSorting by ID...\n===============================================" 
    << std::endl;

    std::cout << "-------------Sorted-------------" << std::endl;
    for(int i = 0; i < cap; i++)
    {
        std::cout << "Book ID: " << books[i].GetBookID() << std::endl;
        std::cout << "| Book Name: " << books[i].GetBookName() << std::endl;
        std::cout << "| ISBN: " << books[i].GetISBN() << std::endl;
        std::cout << "--------------------------" << std::endl;
    }

    return 0;
}

