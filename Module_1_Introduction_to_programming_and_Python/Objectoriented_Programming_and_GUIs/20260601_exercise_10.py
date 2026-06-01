# Two Scale

import tkinter as tk
import tkinter.font as font

def values():
    label.config(text=f"Value of scale1: {var1.get()}\nValue of scale2: {var2.get()}")

# create GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)

# defining VarVar
var1 = tk.DoubleVar()
var2 = tk.DoubleVar()

# creating scales
scale1 = tk.Scale(root, variable=var1, from_=0, to=10, resolution=0.5, orient="horizontal")
scale2 = tk.Scale(root, variable=var2, from_=10, to=0, resolution=0.5, orient="vertical")

# create button
button = tk.Button(root, text="Check scale values", font=myfont, command=values, bg="#fde725")

# create label
label = tk.Label(root, text="Value of scale1: 0\nValue of scale2: 0",font=myfont, width=30, bg="#7ad151")

# placment
scale1.pack()
scale2.pack()
button.pack()
label.pack()

# start GUI
tk.mainloop()