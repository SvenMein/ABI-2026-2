# Framing

import tkinter as tk
import tkinter.font as font

# create GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")

# create frames
frame1 = tk.Frame(root)
frame2 = tk.Frame(root)
frame3 = tk.Frame(root)
frame4 = tk.Frame(root)

# create buttons
button1 = tk.Button(frame1, font=myfont, text="Button1")
button2 = tk.Button(frame1, font=myfont, text="Button2")
button3 = tk.Button(frame1, font=myfont, text="Button3")
button4 = tk.Button(frame1, font=myfont, text="Button4")
button5 = tk.Button(frame3, font=myfont, text="Button5")
button6 = tk.Button(frame3, font=myfont, text="Button6")
button7 = tk.Button(frame3, font=myfont, text="Button7")
button8 = tk.Button(frame3, font=myfont, text="Button8")

# create labels
label1 =tk.Label(frame2, font=myfont, text="Label1", bg="#fde725")
label2 =tk.Label(frame2, font=myfont, text="Label2", bg="#35b779")
label3 =tk.Label(frame2, font=myfont, text="Label3", bg="#31688e")
label4 =tk.Label(frame2, font=myfont, text="Label4", bg="#440154", fg="white")

# create checkboxes
check1 = tk.Checkbutton(frame4, font=myfont, text="Box1")
check2 = tk.Checkbutton(frame4, font=myfont, text="Box2")
check3 = tk.Checkbutton(frame4, font=myfont, text="Box3")
check4 = tk.Checkbutton(frame4, font=myfont, text="Box4")
check5 = tk.Checkbutton(frame4, font=myfont, text="Box5")

# placement
frame1.pack()
button1.pack(side="left")
button2.pack(side="left")
button3.pack(side="left")
button4.pack(side="left")
frame2.pack()
label1.pack(side="left")
label2.pack(side="left")
label3.pack(side="left")
label4.pack(side="left")
frame3.pack()
button5.pack(side="left")
button6.pack(side="left")
button7.pack(side="left")
button8.pack(side="left")
frame4.pack()
check1.pack(side="left")
check2.pack(side="left")
check3.pack(side="left")
check4.pack(side="left")
check5.pack(side="left")

# start GUI
tk.mainloop()