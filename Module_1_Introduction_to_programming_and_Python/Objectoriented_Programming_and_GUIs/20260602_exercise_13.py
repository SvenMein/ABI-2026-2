# Using place

import tkinter as tk
import tkinter.font as font
import matplotlib.pyplot as plt
import numpy as np

# create GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")
root.geometry("500x500")
dict1 = {}
colors = ["#fde725", "#b5de2b", "#6ece58", "#35b779", "#1f9e89", "#26828e", "#31688e", "#3e4989", "#482878", "#440154"]

# frames
frame1 = tk.Frame(root, width=250,height=470, bd=5, relief="groove")
frame2 = tk.Frame(root, width=250, height=470, bd=5, relief="groove")

# create labels
label1 = tk.Label(root, font=myfont, text="Label1", bg="#fde725")
label2 = tk.Label(frame1, font=myfont, text="Label2", bg="#addc30")
label3 = tk.Label(frame1, font=myfont, text="Label3", bg="#5ec962")
label9 = tk.Label(root, font=myfont, text="Label9")

for i in range(10):
    dict1["Color"+str(i)] = colors[i]
    dict1['Label'+str(i)] = tk.Label(frame2, text="Label"+str(i+1), font=myfont, bg=dict1["Color"+str(i)])
    dict1['Label'+str(i)].place(relx=0, rely=(i/10), relwidth=1, relheight=0.1)


# placement
label1.place(relx=0, rely=0, relwidth=1)
label9.place(x=0, y=478, width=500)
frame1.place(x=0, y=25)
frame2.place(relx=0.5, y=25)
label2.place(relx=0, rely=0, relwidth=1, relheight=0.3)
label3.place(relx=0, rely=0.3, relwidth=1, relheight=0.7)

# start GUI
root.mainloop()