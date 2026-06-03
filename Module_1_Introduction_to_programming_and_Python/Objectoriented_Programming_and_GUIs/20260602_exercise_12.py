# Using Grid

import tkinter as tk
import tkinter.font as font
import numpy as np

colors = ["#fde725", "#addc30", "#5ec962", "#28ae80", "#2c728e", "#3b528b", "#472d7b", "#440154"]
labels = ["label1", "label2", "label3", "label4", "label5", "label6", "label7", "label8", "label9"]

# create GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")

def func():
    label4.destroy()
    label5.destroy()
    label6.destroy()
    label = tk.Label(root, font=myfont, text="New Label", bg="black", fg="white")
    label.grid(row=1, column=0, columnspan=3, padx=10, pady=10)

# create labels
label1 = tk.Label(root, font=myfont, text="Label1", bg="#fde725")
label2 = tk.Label(root, font=myfont, text="Label2", bg="#addc30")
label3 = tk.Label(root, font=myfont, text="Label3", bg="#5ec962")
label4 = tk.Label(root, font=myfont, text="Label4", bg="#28ae80")
label5 = tk.Label(root, font=myfont, text="Label5", bg="#21918c")
label6 = tk.Label(root, font=myfont, text="Label6", bg="#2c728e")
label7 = tk.Label(root, font=myfont, text="Label7", bg="#3b528b")
label8 = tk.Label(root, font=myfont, text="Label8", bg="#472d7b")
label9 = tk.Label(root, font=myfont, text="Label9", bg="#440154")

# create buttons
button1 = tk.Button(root, font=myfont, text="Button1", command=func)

# placement
label1.grid(column=0, row=0, pady=3)
label2.grid(column=1, row=0, pady=3)
label3.grid(column=2, row=0, pady=3)
label4.grid(column=0, row=1, pady=3)
label5.grid(column=1, row=1, pady=3)
label6.grid(column=2, row=1, pady=3)
label7.grid(column=0, row=2, pady=3)
label8.grid(column=1, row=2, pady=3)
label9.grid(column=2, row=2, pady=3)
button1.grid(column=1, row=3, pady=5)

# start GUI
tk.mainloop()