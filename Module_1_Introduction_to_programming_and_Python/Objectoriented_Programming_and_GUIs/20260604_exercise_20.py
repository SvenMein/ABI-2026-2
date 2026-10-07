# Listing options

import tkinter as tk
import tkinter.font as font

def selected_items():
    selected_plasma = listbox_plasma.curselection()
    selected_proteins = listbox_proteins.curselection()
    text_proteins = []
    for i in selected_proteins:
        text_proteins.append(listbox_proteins.get(i))
    for i in selected_plasma:
        index_plasma = listbox_plasma.get(i)
    label1.config(text=text_proteins, bg=index_plasma)
    label2.config(text=f"Used backgroundcolor: {index_plasma}", bg=index_plasma)


root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")
root.geometry("500x500")

plasma = ["#f0f921", "#fdca26", "#fb9f3a", "#ed7953", "#d8576b", "#bd3786", "#9c179e", "#7201a8", "#46039f", "#0d0887"]
proteins = ["GAPDH", "SCYL1", "SCYL2", "SCYL3", "EEA1", "EEA2", "HSP70", "LIMP2"]

listbox_plasma = tk.Listbox(root, exportselection=False, font=myfont)
listbox_proteins = tk.Listbox(root, selectmode="multiple", exportselection=False, font=myfont, height=4)
listbox_plasma.insert(0, *plasma)
listbox_proteins.insert(0, *proteins)

button = tk.Button(root, text="Update label", font=myfont, command=selected_items)
label1 = tk.Label(root, text="Display choices", font=myfont, width=500)
label2 = tk.Label(root, text="Used backgroundcolor", font=myfont, width=500)

listbox_plasma.pack()
listbox_proteins.pack()
button.pack()
label1.pack()
label2.pack()

root.mainloop()