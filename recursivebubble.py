# Python Program for implementation of 
# Recursive Bubble sort 

def bubble_sort(listt): 
	for i, num in enumerate(listt): 
		try: 
			if listt[i+1] < num: 
				listt[i] = listt[i+1] 
				listt[i+1] = num 
				bubble_sort(listt) 
		except IndexError: 
			pass
	return listt 

listt = [64, 34, 25, 12, 22, 11, 90] 
bubble_sort(listt) 

print("Sorted array:"); 
for i in range(0, len(listt)): 
	print(listt[i], end=' ') 


# Code contributed by Mohit Gupta_OMG 
