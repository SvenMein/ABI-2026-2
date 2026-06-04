# Professional GUI

import tkinter as tk
import tkinter.font as font

def empty_func():
    pass

# GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")
root.geometry("500x500")

# Toplevel Menu
mainmenu = tk.Menu(root)

filemenu = tk.Menu(mainmenu, tearoff=0)
filemenu.add_command(label="Save", command=empty_func)
filemenu.add_command(label="Load", command=empty_func)
filemenu.add_command(label="Export", command=empty_func)
mainmenu.add_cascade(label="File", menu=filemenu)

editmenu = tk.Menu(mainmenu, tearoff=0)
editmenu.add_command(label="Transform", command=empty_func)
editmenu.add_command(label="Invert", command=empty_func)
mainmenu.add_cascade(label="Edit", menu=editmenu)

thresholdmenu = tk.Menu(editmenu, tearoff=0)
thresholdmenu.add_command(label="Auto-Threshold", command=empty_func)
thresholdmenu.add_command(label="Otsu", command=empty_func)
thresholdmenu.add_command(label="Triangle Threshold", command=empty_func)
editmenu.add_cascade(label="Threshold", menu=thresholdmenu)

viewmenu = tk.Menu(mainmenu, tearoff=0)
viewmenu.add_command(label="Colormap", command=empty_func)
viewmenu.add_command(label="Z-Stacks", command=empty_func)
viewmenu.add_command(label="Split channels", command=empty_func)
mainmenu.add_cascade(label="View", menu=viewmenu)

helpmenu = tk.Menu(mainmenu, tearoff=0)
helpmenu.add_command(label="Google", command=empty_func)
helpmenu.add_command(label="Impressum", command=empty_func)
helpmenu.add_command(label="Settings", command=empty_func)
mainmenu.add_cascade(label="Help", menu=helpmenu)

root.config(menu=mainmenu)
root.mainloop()