# Using Lamda in GUI
import tkinter as tk
import tkinter.font as font

def func(input_text):
    labeltext = label.cget("text")
    labeltext = labeltext + input_text
    label.config(text=labeltext)

root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")

# create label
label = tk.Label(root, text="Sequence: ", font=myfont)
label.pack()

# create buttons
button1 = tk.Button(root, text="A", font=myfont, command=lambda:func("A"))
button2 = tk.Button(root, text="C", font=myfont, command=lambda:func("C"))
button3 = tk.Button(root, text="G", font=myfont, command=lambda:func("G"))
button4 = tk.Button(root, text="T", font=myfont, command=lambda:func("T"))
button5 = tk.Button(root, text="R", font=myfont, command=lambda:func("R"))
button6 = tk.Button(root, text="Y", font=myfont, command=lambda:func("Y"))
button1.pack()
button2.pack()
button3.pack()
button4.pack()
button5.pack()
button6.pack()
    
# start GUI
root.mainloop()