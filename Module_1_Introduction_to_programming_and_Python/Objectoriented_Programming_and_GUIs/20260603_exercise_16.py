# Lamda with mulitple functions

import tkinter as tk
import tkinter.font as font

def change_text():
    label.config(text=spinbox1.get()) # If used like this, the labda func takes no arg, otherwise func("") is needed.

def change_bg(bg_color):
    bg_color = spinbox2.get()
    label.config(bg=bg_color)

def change_fg(fg_color):
    fg_color = spinbox3.get()
    label.config(fg=fg_color)

root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")
viridis =["#fde725", "#b5de2b", "#6ece58", "#35b779"]
plasma = ["#0d0887", "#9c179e", "#ed7953", "#f0f921"]

# create label
label = tk.Label(root, text="Sample text", font=myfont)
label.pack()

# create spinboxes
text_values = ["Sample Text", "Asiudh piuh", "AIUsghd aiosdjho", " iuashzd asodjaohdhfu a"]
spinbox1 = tk.Spinbox(root, values=text_values, font=myfont, state="readonly")
spinbox2 = tk.Spinbox(root, values=viridis, font=myfont, state="readonly")
spinbox3 = tk.Spinbox(root, values=plasma, font=myfont, state="readonly")
spinbox1.pack()
spinbox2.pack()
spinbox3.pack()

# create buttons
button = tk.Button(root, text="Update label", font=myfont, command=lambda:[change_text(), change_bg(""), change_fg("")])
button.pack()
    
# start GUI
root.mainloop()