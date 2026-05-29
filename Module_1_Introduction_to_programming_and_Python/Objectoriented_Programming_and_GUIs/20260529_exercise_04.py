# Creating Labels 
import tkinter as tk
import tkinter.font as font

root = tk.Tk()
myfont2 = font.Font(family="Arial", size=12)
label_gene = tk.Label(root, text="The gene was detected.", font=myfont2, width=30)
label_gene.pack()
label_nucleotides = tk.Label(root, text="The gene is 500 bp long.", font=myfont2, width=30)
label_nucleotides.pack()
label_count = tk.Label(root, text="The gene was detected 5 times.", font=myfont2, width=30)
label_count.pack()
root.mainloop()