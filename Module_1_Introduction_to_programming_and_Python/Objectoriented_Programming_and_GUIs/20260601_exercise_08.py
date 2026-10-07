# Radiobuttons

import tkinter as tk
import tkinter.font as font

def radio_func():
    label.config(bg="#7ad151", text=f"Analysis selected: {analysis.get()}")

# create GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)

# defining VarVar
analysis = tk.StringVar(value="Colocalization")

# creating radiobuttons
radio1 = tk.Radiobutton(root, text="Colocalization", variable=analysis, value="Colocalization", command=radio_func, font=myfont)
radio2 = tk.Radiobutton(root, text="Endosome Size", variable=analysis, value="Endosome Size", command=radio_func, font=myfont)
radio3 = tk.Radiobutton(root, text="Eisosome Counter", variable=analysis, value="Eisosome Counter", command=radio_func, font=myfont)
radio4 = tk.Radiobutton(root, text="Membrane Kinetic", variable=analysis, value="Membrane Kinetic", command=radio_func, font=myfont)
radio5 = tk.Radiobutton(root, text="GPCR internalization", variable=analysis, value="GPCR internalization", command=radio_func, font=myfont)
radio6 = tk.Radiobutton(root, text="Biofilm Analysis", variable=analysis, value="Biofilm Analysis", command=radio_func, font=myfont)
radio7 = tk.Radiobutton(root, text="Invasion Depth", variable=analysis, value="Invasion Depth", command=radio_func, font=myfont)
radio8 = tk.Radiobutton(root, text="Speckle Count", variable=analysis, value="Speckle Count", command=radio_func, font=myfont)

# create label
label = tk.Label(root, font=myfont, width=35)

# placment
radio1.pack(anchor="w")
radio2.pack(anchor="w")
radio3.pack(anchor="w")
radio4.pack(anchor="w")
radio5.pack(anchor="w")
radio6.pack(anchor="w")
radio7.pack(anchor="w")
radio8.pack(anchor="w")
label.pack()

# start GUI
tk.mainloop()