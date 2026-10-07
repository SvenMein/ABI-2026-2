# Listing options

import tkinter as tk
import tkinter.font as font
from tkinter import messagebox

def func():
    if varvar.get() == "Info":
        messagebox.showinfo("Informations", "You choosed wisely.")
        label.config(text="That was an infobox")
    elif varvar.get() == "Warning":
        messagebox.showwarning("Upsi Daisy", "You choosed poorly.")
        label.config(text="That was a warningbox")
    elif varvar.get() == "Error":
        messagebox.showerror("New Error", "How the heck did you managed that?!?")
        label.config(text="That was an errorbox")

# GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")
root.geometry("500x500")

# defining VarVar for radiobutton
varvar = tk.StringVar(value="Info")

# create radiobuttons
radio1 = tk.Radiobutton(root, text="Info", font=myfont, variable=varvar, value="Info")
radio2 = tk.Radiobutton(root, text="Warning", font=myfont, variable=varvar, value="Warning")
radio3 = tk.Radiobutton(root, text="Error", font=myfont, variable=varvar, value="Error")

button = tk.Button(root, text="Submit choice", font=myfont, command=func)
label = tk.Label(root, text="Display", font=myfont)

# placement
radio1.pack(anchor="w")
radio2.pack(anchor="w")
radio3.pack(anchor="w")
button.pack()
label.pack()

root.mainloop()