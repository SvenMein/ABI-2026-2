# Using Buttons

import tkinter as tk
import tkinter.font as font

# defining function to change label text
def ChangeText1():
    if label_gene.cget("text") == "GAPDH":
        label_gene.config(text="HSP70", fg="red")
    else:
        label_gene.config(text="GAPDH", fg="black")

def ChangeText2():
    if label_nucleotides.cget("text") == "The gene is 500 bp long.":
        label_nucleotides.config(text="The gene is 700 bp long.", fg="red")
    else:
        label_nucleotides.config(text="The gene is 500 bp long.", fg="black")

root = tk.Tk()
myfont2 = font.Font(family="Arial", size=12)

# create labels
label_gene = tk.Label(root, text="GAPDH", font=myfont2, width=30, bg="#fde725")
label_nucleotides = tk.Label(root, text="The gene is 500 bp long.", font=myfont2, width=30, bg="#7ad151")
label_count = tk.Label(root, text="The gene was detected 5 times.", font=myfont2, width=30, bg="#22a884")
# placing labels
label_gene.pack()
label_nucleotides.pack()
label_count.pack()

# adding buttons to change labels and closing GUI
button1 = tk.Button(root, text="Change gene", command=ChangeText1, font=myfont2, bg="#2a788e")
button2 = tk.Button(root, text="Change nucleotides", command=ChangeText2, font=myfont2, bg="#414487")
button_close = tk.Button(root, text="Close", command=root.destroy, font=myfont2, bg="#440154")
# placing the buttons
button1.pack()
button2.pack()
button_close.pack()
# starting the GUI
root.mainloop()