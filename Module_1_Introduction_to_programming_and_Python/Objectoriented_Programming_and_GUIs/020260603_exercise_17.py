# Hide and Show

import tkinter as tk
import tkinter.font as font

def hide_label1():
    label1.place_forget()

def show_label1():
    label1.place(relx=0, rely=0, relwidth=1, relheight=0.12)

def hide_label2():
    label2.place_forget()

def show_label2():
    label2.place(relx=0, rely=0.5, relwidth=1, relheight=0.12)

root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")

label1 = tk.Label(root, text="Label1", font=myfont, bg="#9c179e")
label2 = tk.Label(root, text="Label2", font=myfont, bg="#ed7953")
button1 = tk.Button(root, text="Hide", font=myfont, command=hide_label1, bg="#35b779")
button2 = tk.Button(root, text="Hide", font=myfont, command=hide_label2, bg="#35b779")
button3 = tk.Button(root, text="Show", font=myfont, command=show_label1, bg="#fde725")
button4 = tk.Button(root, text="Show", font=myfont, command=show_label2, bg="#fde725")

label1.place(relx=0, rely=0, relwidth=1, relheight=0.12)
button3.place(relx=0, rely=0.12, relwidth=0.5, relheight=0.12)
button1.place(relx=0.5, rely=0.12, relwidth=0.5, relheight=0.12)
label2.place(relx=0, rely=0.5, relwidth=1, relheight=0.12)
button4.place(relx=0, rely=0.62, relwidth=0.5, relheight=0.12)
button2.place(relx=0.5, rely=0.62, relwidth=0.5, relheight=0.12)

root.mainloop()