# Checks

import tkinter as tk
import tkinter.font as font

def status_check():                     # Alternativly use a dictionary with 3 keys
    check1_value = input_check1.get()
    check2_value = input_check2.get()
    check3_value = input_check3.get()
    check4_value = input_check4.get()
    check5_value = input_check5.get()

    if check1_value ==True:
        label1.config(text=f"Check 1 is checked", bg="#7ad151", fg="black")
    else:
        label1.config(text=f"Check1 is not checked", bg="#440154", fg="white")

    if check2_value ==True:
        label2.config(text=f"Check 2 is checked", bg="#7ad151", fg="black")
    else:
        label2.config(text=f"Check 2 is not checked", bg="#440154", fg="white")
    
    if check3_value ==True:
        label3.config(text=f"Check 3 is checked", bg="#7ad151", fg="black")
    else:
        label3.config(text=f"Check 3 is not checked", bg="#440154", fg="white")

    if check4_value ==True:
        label4.config(text=f"Check 4 is checked", bg="#7ad151", fg="black")
    else:
        label4.config(text=f"Check 4 is not checked", bg="#440154", fg="white")

    if check5_value ==True:
        label5.config(text=f"Check 5 is checked", bg="#7ad151", fg="black")
    else:
        label5.config(text=f"Check 5 is not checked", bg="#440154", fg="white")   

# create GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)

# defining VarVars
input_check1 = tk.BooleanVar()
input_check2 = tk.BooleanVar()
input_check3 = tk.BooleanVar()
input_check4 = tk.BooleanVar()
input_check5 = tk.BooleanVar()
input_check1.set(True)
input_check2.set(True)
input_check3.set(True)
input_check4.set(True)
input_check5.set(True)

# create check boxes
check1 = tk.Checkbutton(root, text="Check Box1", variable=input_check1, font=myfont)
check2 = tk.Checkbutton(root, text="Check Box2", variable=input_check2, font=myfont)
check3 = tk.Checkbutton(root, text="Check Box3", variable=input_check3, font=myfont)
check4 = tk.Checkbutton(root, text="Check Box4", variable=input_check4, font=myfont)
check5 = tk.Checkbutton(root, text="Check Box5", variable=input_check5, font=myfont)

# create labels
label1 = tk.Label(root, font=myfont, width=30)
label2 = tk.Label(root, font=myfont, width=30)
label3 = tk.Label(root, font=myfont, width=30)
label4 = tk.Label(root, font=myfont, width=30)
label5 = tk.Label(root, font=myfont, width=30)

# create button
button = tk.Button(root, text="Check status", command=status_check, font=myfont)

# placing widgets
check1.pack()
check2.pack()
check3.pack()
check4.pack()
check5.pack()
button.pack()
label1.pack()
label2.pack()
label3.pack()
label4.pack()
label5.pack()

# starting GUI
tk.mainloop()