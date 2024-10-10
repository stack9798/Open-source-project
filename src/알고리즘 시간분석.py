import time
import random
from copy import deepcopy

# Sorting algorithms from provided files
# Selection Sort
def selectionSort(lst):
    for i in range(len(lst)):
        min_idx = i
        for j in range(i + 1, len(lst)):
            if lst[min_idx] >= lst[j]:
                min_idx = j
        lst[i], lst[min_idx] = lst[min_idx], lst[i]

# Bubble Sort
def bubbleSort(lst):
    n = len(lst)
    for i in range(n):
        for j in range(n - i - 1):
            if lst[j] > lst[j + 1]:
                lst[j], lst[j + 1] = lst[j + 1], lst[j]

# Insertion Sort
def insertionSort(lst):
    for i in range(1, len(lst)):
        key = lst[i]
        j = i - 1
        while j >= 0 and key < lst[j]:
            lst[j + 1] = lst[j]
            j -= 1
        lst[j + 1] = key

# Merge Sort
def mergeSort(lst):
    if len(lst) > 1:
        mid = len(lst) // 2
        L = lst[:mid]
        R = lst[mid:]

        mergeSort(L)
        mergeSort(R)

        lst.clear()
        while len(L) > 0 and len(R) > 0:
            if L[0] <= R[0]:
                lst.append(L.pop(0))
            else:
                lst.append(R.pop(0))
        lst.extend(L or R)

# Quick Sort
def partition(lst, low, high):
    i = low - 1
    pivot = lst[high]
    for j in range(low, high):
        if lst[j] < pivot:
            i += 1
            lst[i], lst[j] = lst[j], lst[i]
    lst[i + 1], lst[high] = lst[high], lst[i + 1]
    return i + 1

def quickSort(lst, low, high):
    if low < high:
        pi = partition(lst, low, high)
        quickSort(lst, low, pi - 1)
        quickSort(lst, pi + 1, high)

# Heap Sort
def heapify(lst, n, i):
    largest = i
    l = 2 * i + 1
    r = 2 * i + 2
    if l < n and lst[i] < lst[l]:
        largest = l
    if r < n and lst[largest] < lst[r]:
        largest = r
    if largest != i:
        lst[i], lst[largest] = lst[largest], lst[i]
        heapify(lst, n, largest)

def heapSort(lst):
    n = len(lst)
    for i in range(n // 2 - 1, -1, -1):
        heapify(lst, n, i)
    for i in range(n - 1, 0, -1):
        lst[i], lst[0] = lst[0], lst[i]
        heapify(lst, i, 0)

# Python built-in sort function
def python_sort(lst):
    lst.sort()

# Function to measure execution time of sorting algorithms
def measure_time(sort_func, lst):
    start_time = time.time()
    sort_func(lst)
    end_time = time.time()
    return end_time - start_time

# Main function to test and compare sorting algorithms
def main():
    n = 10000
    list1 = [i for i in range(n)]
    random.shuffle(list1)

    # Create deep copies of the original list for each algorithm
    data_sets = [deepcopy(list1) for _ in range(7)]

    # List of sorting functions to test
    sort_functions = [selectionSort, bubbleSort, insertionSort, mergeSort, lambda lst: quickSort(lst, 0, len(lst)-1), heapSort, python_sort]
    sort_names = ["Selection Sort", "Bubble Sort", "Insertion Sort", "Merge Sort", "Quick Sort", "Heap Sort", "Python Sort"]

    # Execute and measure the time of each sorting algorithm
    for i, sort_func in enumerate(sort_functions):
        lst_copy = deepcopy(data_sets[i])
        exec_time = measure_time(sort_func, lst_copy)
        print(f"{sort_names[i]}: {exec_time:.6f} seconds")

if __name__ == "__main__":
    main()

