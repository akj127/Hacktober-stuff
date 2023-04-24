import matplotlib.pyplot as plt

x = [x for x in range(-100,101)]
y = [x+3 for x in range(-100,101)]

plt.plot(x,y)
plt.xlabel("x-axis")
plt.ylabel("y-axis")
plt.title("y = x + 3")
plt.grid()
plt.show()
