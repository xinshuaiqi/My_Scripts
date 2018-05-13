# -*- coding: utf-8 -*-
"""
Created on Sun Mar 11 09:18:07 2018

@author: qxs
"""

# 算法 https://zh.wikipedia.org/wiki/Template:%E7%AE%97%E6%B3%95


# Bubble Sort 一次比较两个相邻的
def bubble_sorted(iterable):
    new_list = list(iterable)
    list_len = len(new_list)
    for i in range(list_len - 1):
        for j in range(list_len - 1, i, -1):
            if new_list[j] < new_list[j - 1]:
                new_list[j], new_list[j - 1] = new_list[j - 1], new_list[j]
                print(new_list[j])
                print(new_list[j-1])
                print(new_list)
    return new_list


testlist = [27, 33, 28, 4, 2, 26, 13, 35, 8, 14]
print('sorted:', bubble_sorted(testlist))


sorted: [2, 4, 8, 13, 14, 26, 27, 28, 33, 35]






# Insertion Sort
# 从序列后依次比较，插入合适的位置
def insert_sort(lst):
    n=len(lst)
    if n==1: return lst
    for i in range(1,n):
        for j in range(i,0,-1):
            if lst[j]<lst[j-1]: 
                lst[j],lst[j-1]=lst[j-1],lst[j]
                print (lst[j], lst[j-1])
                print (lst)
            else:break
    return lst

# or
def insertion_sort(lst):
    if len(lst) == 1:
        return lst

    for i in range(1, len(lst)):
        temp = lst[i]
        j = i - 1
        while j >= 0 and temp < lst[j]:
            lst[j + 1] = lst[j]
            j -= 1
        lst[j + 1] = temp
    return lst

testlist = [27, 33, 28, 4, 2, 26, 13, 35, 8, 14]
print('sorted:', insert_sort(testlist))



#  Selection sort
# 找最小值
def selection_sort(L):
    N = len(L)
    exchanges_count = 0
    for i in range(N-1):
        min_index = i
        for j in range(i+1, N):
            if L[min_index] > L[j]:
                min_index = j
        if min_index != i:
            L[min_index], L[i] = L[i], L[min_index]
            exchanges_count += 1
        print('iteration #{}: {}'.format(i, L))
    print('Total {} swappings'.format(exchanges_count))
    return L

testlist = [17, 23, 20, 14, 12, 25, 1, 20, 81, 14, 11, 12]
print('Before selection sort: {}'.format(testlist))
print('After selection sort:  {}'.format(selection_sort(testlist)))





# shell sort 按步长分成小组， 
def shell_sort(list):
    n = len(list)
    # 初始步长
    gap = n // 2
    while gap > 0:
        for i in range(gap, n):
            # 每个步长进行插入排序
            temp = list[i]
            j = i
            # 插入排序
            while j >= gap and list[j - gap] > temp:
                list[j] = list[j - gap]
                j -= gap
            list[j] = temp
        # 得到新的步长
        gap = gap // 2
    return list

print(shell_sort(testlist))




# quick sort
def quicksort(lst, lo, hi):
    if lo < hi:
        p = partition(lst, lo, hi)
        quicksort(lst, lo, p)
        quicksort(lst, p+1, hi)
    return

def partition(lst, lo, hi):
    pivot = lst[hi-1]
    i = lo - 1
    for j in range(lo, hi):
        if lst[j] < pivot:
            i += 1
            lst[i], lst[j] = lst[j], lst[i]
    if lst[hi-1] < lst[i+1]:
        lst[i+1], lst[hi-1] = lst[hi-1], lst[i+1]
    return i+1    





# Heap sort 堆排序
def heap_sort(lst):
    def sift_down(start, end):
        """最大堆调整"""
        root = start
        while True:
            child = 2 * root + 1
            if child > end:
                break
            if child + 1 <= end and lst[child] < lst[child + 1]:
                child += 1
            if lst[root] < lst[child]:
                lst[root], lst[child] = lst[child], lst[root]
                root = child
            else:
                break

    # 创建最大堆
    for start in xrange((len(lst) - 2) // 2, -1, -1):
        sift_down(start, len(lst) - 1)

    # 堆排序
    for end in xrange(len(lst) - 1, 0, -1):
        lst[0], lst[end] = lst[end], lst[0]
        sift_down(0, end - 1)
    return lst
            
def main():
    l = [9,2,1,7,6,8,5,3,4]
    heap_sort(l)

if __name__ == "__main__":
    main()


#  归并排序 Merge Sort 
from collections import deque

def merge_sort(lst):
    if len(lst) <= 1:
        return lst
    
    middle = int(len(lst) // 2)
    left = merge_sort(lst[:middle])
    right = merge_sort(lst[middle:])
    
    def merge(left, right):
        merged,left,right = deque(),deque(left),deque(right)
        while left and right:
            print("before: ", merged,left,right)
            if left[0] <= right[0]:
                merged.append(left.popleft()) 
            else: 
                merged.append(right.popleft()) # deque popleft is also O(1)
            print(merged,left,right)
        merged.extend(right if right else left)
        return list(merged)

    return merge(left, right)

l=[6,5,3,1,8,7,2,4]
print(merge_sort(l))





















    