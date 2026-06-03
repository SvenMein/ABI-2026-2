# Options menu

import tkinter as tk
import tkinter.font as font

def choices():
    if var1.get()!= "Pick a background color" and var2.get() != "Pick a text color" and var3.get() != "Pick a pick a protein":
        label.config(text=var3.get(), bg=var1.get(), fg=var2.get())
    else:
        label.config(text="Please pick one option each", bg="red")

root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")
root.resizable(False, False)
#root.geometry("500x500")

viridis = ["#fde725", "#b5de2b", "#6ece58", "#35b779", "#1f9e89", "#26828e", "#31688e", "#3e4989", "#482878", "#440154"]
plasma = ["#f0f921", "#fdca26", "#fb9f3a", "#ed7953", "#d8576b", "#bd3786", "#9c179e", "#7201a8", "#46039f", "#0d0887"]
proteins = ["GAPDH", "SCYL1", "SCYL2", "SCYL3", "EEA1", "EEA2", "HSP70", "LIMP2"]

var1 = tk.StringVar()
var2 = tk.StringVar()
var3 = tk.StringVar()
var1.set("Pick a background color")
var2.set("Pick a text color")
var3.set("Pick a pick a protein")

menu1 = tk.OptionMenu(root, var1, *viridis)
menu2 = tk.OptionMenu(root, var2, *plasma)
menu3 = tk.OptionMenu(root, var3, *proteins)

menu1.config(font=myfont)
menu2.config(font=myfont)
menu3.config(font=myfont)

label1 = tk.Label(root, text="Background Color", font=myfont)
label2 = tk.Label(root, text="Text Color", font=myfont)
label3 = tk.Label(root, text="Protein", font=myfont)

button = tk.Button(root, text="Display choices", font=myfont, command=choices)
label = tk.Label(root, text="Lore Ipsum", font=myfont)

label1.grid(row=0, column=0, sticky="w")
label2.grid(row=1, column=0, sticky="w")
label3.grid(row=2, column=0, sticky="w")
menu1.grid(row=0, column=1, sticky="e")
menu2.grid(row=1, column=1, sticky="e")
menu3.grid(row=2, column=1, sticky="e")
button.grid(row=3, column=0, columnspan=2)
label.grid(row=4, column=0, columnspan=2)

root.mainloop()