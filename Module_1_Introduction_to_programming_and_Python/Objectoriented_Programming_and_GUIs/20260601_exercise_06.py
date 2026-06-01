# Entries

import tkinter as tk
import tkinter.font as font

# defining function to change label text
def ChangeText1():
    gene = input_gene.get()
    label_gene.config(text=gene)

def ChangeText2():
    nucleotide = input_nucleotides.get()
    label_nucleotides.config(text=nucleotide)

def aminoacids():
    nucleotide = input_nucleotides.get()
    amino = round(nucleotide / 3)
    label_aminoacids.config(text=f"{amino} AS")

# creating GUI
root = tk.Tk()
myfont2 = font.Font(family="Arial", size=12)

# defining VarVars
input_gene = tk.StringVar(value="Enter gene")
input_nucleotides = tk.IntVar(value="Enter number of nucleotides")

# create entry fields
entry_gene = tk.Entry(root, textvariable=input_gene, width=30, font=myfont2)
entry_nucleotide = tk.Entry(root, textvariable=input_nucleotides, width=30, font=myfont2)

# create labels
label_gene = tk.Label(root, font=myfont2, width=30, bg="#fde725")
label_nucleotides = tk.Label(root, font=myfont2, width=30, bg="#7ad151")
label_aminoacids = tk.Label(root, font=myfont2, width=30, bg="#22a884")

# adding buttons to change labels and closing GUI
button1 = tk.Button(root, text="Update gene", command=ChangeText1, font=myfont2)
button2 = tk.Button(root, text="Update nucleotides", command=ChangeText2, font=myfont2)
button3 = tk.Button(root, text="Calculate aminoacids", command=aminoacids, font=myfont2)
button_close = tk.Button(root, text="Close", command=root.destroy, font=myfont2)

# placing the widgets
entry_gene.pack()
entry_nucleotide.pack()
button1.pack()
button2.pack()
button3.pack()
label_gene.pack()
label_nucleotides.pack()
label_aminoacids.pack()
button_close.pack()

# starting the GUI
root.mainloop()