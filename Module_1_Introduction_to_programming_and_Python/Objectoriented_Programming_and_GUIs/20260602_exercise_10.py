# Spinboxes

import tkinter as tk
import tkinter.font as font

def update_label():
    label1.config(text=f"Spinbox1: {spinbox1.get()}")
    label2.config(text=f"Spinbox2: {spinbox2.get()}")
    label3.config(text=f"Spinbox3: {spinbox3.get()}")

# create GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)

# create spinboxes
text_values = ["A", "B", "C", "D"]
spinbox1 = tk.Spinbox(root, from_=0, to=10, command=update_label, font=myfont)
spinbox2 = tk.Spinbox(root, values=text_values, command=update_label, font=myfont, wrap=True)
spinbox3 = tk.Spinbox(root, from_=0, to=10, increment=0.5, command=update_label, font=myfont, state="readonly")

# create labels
label1 = tk.Label(root, text=f"Spinbox1: {spinbox1.get()}",font=myfont, width=30, bg="#7ad151")
label2 = tk.Label(root, text=f"Spinbox2: {spinbox2.get()}",font=myfont, width=30, bg="#7ad151")
label3 = tk.Label(root, text=f"Spinbox3: {spinbox3.get()}",font=myfont, width=30, bg="#7ad151")

# placement
spinbox1.pack()
spinbox2.pack()
spinbox3.pack()
label1.pack()
label2.pack()
label3.pack()

# start GUI
tk.mainloop()