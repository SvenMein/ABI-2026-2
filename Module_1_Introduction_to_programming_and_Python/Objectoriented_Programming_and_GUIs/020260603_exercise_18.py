# LabelFrames

import tkinter as tk
import tkinter.font as font

# Create GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("My GUI")
root.geometry("500x500")

# LabelFrames
label_frame1 = tk.LabelFrame(root, text="Frame1", font=myfont, labelanchor="n")
label_frame2 = tk.LabelFrame(root, text="Frame2", font=myfont, labelanchor="w")
label_frame3 = tk.LabelFrame(root, text="Frame3", font=myfont, labelanchor="se")


label_frame1.place(relx=0.1, rely=0, relheight=0.3, relwidth=0.8)
label_frame2.place(relx=0.1, rely=0.35, relheight=0.3, relwidth=0.8)
label_frame3.place(relx=0.1, rely=0.7, relheight=0.3, relwidth=0.8)

# Labels
label1 = tk.Label(label_frame1, text="siojf", font=myfont)
label2 = tk.Label(label_frame1, text="siojf", font=myfont)
label3 = tk.Label(label_frame1, text="siojf", font=myfont)
label4 = tk.Label(label_frame2, text="siojf", font=myfont)
label5 = tk.Label(label_frame2, text="siojf", font=myfont)
label6 = tk.Label(label_frame2, text="siojf", font=myfont)
label7 = tk.Label(label_frame3, text="siojf", font=myfont)
label8 = tk.Label(label_frame3, text="siojf", font=myfont)
label9 = tk.Label(label_frame3, text="siojf", font=myfont)
label1.pack()
label2.pack()
label3.pack()
label4.pack()
label5.pack()
label6.pack()
label7.pack()
label8.pack()
label9.pack()

# mainloop
root.mainloop()