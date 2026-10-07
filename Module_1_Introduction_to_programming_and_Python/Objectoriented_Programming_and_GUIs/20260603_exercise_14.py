# Multiple windows

import tkinter as tk
import tkinter.font as font

# function for pop up
def create_window1():
    sub = tk.Toplevel()
    sub.title("Cell Analyzer 3000")
    sub.geometry("300x300")
    label_sub = tk.Label(sub, text="Analyze", font=myfont)
    label_sub.pack()
    button_sub = tk.Button(sub, text="Close", command=sub.destroy, font=myfont)
    button_sub.pack(side="bottom")
    sub.mainloop()

def create_window2():
    sub = tk.Toplevel()
    sub.title("Result Viewer")
    sub.geometry("300x300")
    label_sub = tk.Label(sub, text="Results", font=myfont)
    label_sub.pack()
    button_sub = tk.Button(sub, text="Close", command=sub.destroy, font=myfont)
    button_sub.pack(side="bottom")
    sub.mainloop()

def create_window3():
    sub = tk.Toplevel()
    sub.title("Settings and advanced options")
    sub.geometry("300x300")
    label_sub = tk.Label(sub, text="Settings", font=myfont)
    label_sub.pack()
    button_sub = tk.Button(sub, text="Close", command=sub.destroy, font=myfont)
    button_sub.pack(side="bottom")
    sub.mainloop()

# create GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")
root.geometry("500x500")
dict1 = {}
colors = ["#fde725", "#b5de2b", "#6ece58", "#35b779", "#1f9e89", "#26828e", "#31688e", "#3e4989", "#482878", "#440154"]
buttons_names = ["Analyze", "Open last results", "Settings"]
buttons_commands = [create_window1, create_window2, create_window3]

for i in range(3):
    dict1["Color"+str(i)] = colors[i]
    dict1["Button_names"+str(i)] = buttons_names[i]
    dict1["Commands"+str(i)] = buttons_commands[i]
    dict1['Label'+str(i)] = tk.Label(root, text="Label"+str(i+1), font=myfont, bg=dict1["Color"+str(i)])
    dict1["Button"+str(i)] = tk.Button(root, text=dict1["Button_names"+str(i)], font=myfont, bg=dict1["Color"+str(i)], command=dict1["Commands"+str(i)])
    dict1['Label'+str(i)].place(relx=0, rely=(0+(i/10)), relwidth=0.5, relheight=0.06)
    dict1["Button"+str(i)].place(relx=0.51, rely=(0+i/10), relwidth=0.49, relheight=0.06)

# start GUI
root.mainloop()