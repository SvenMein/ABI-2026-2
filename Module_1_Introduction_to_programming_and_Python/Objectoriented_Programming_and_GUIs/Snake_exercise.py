"""
Create a GUI for a simplified Snake game.
The GUI should include four Buttons and one Label/Frame that represents the snake.
The Buttons should be placed on the sides of your GUI and should allow your snake
(the Label/Frame) to move accordingly (see image below for an example).
"""
import tkinter as tk
import tkinter.font as font

# Function for the buttons
def movement_up():
    curr_y = label_snake.winfo_y()/350
    curr_x = label_snake.winfo_x()/350
    print(curr_x, curr_y)
    label_snake.place(anchor="center", relx=curr_x, rely=curr_y-0.1)
    curr_y = label_snake.winfo_y()/350
    curr_x = label_snake.winfo_x()/350
    print(curr_x, curr_y)

def movement_right():
    curr_y = label_snake.winfo_y()
    curr_x = label_snake.winfo_x()
    label_snake.place(relx=curr_x+0.1, rely=curr_y)

def movement_down():
    curr_y = label_snake.winfo_y()
    curr_x = label_snake.winfo_x()
    label_snake.place(x=curr_x-5, y=curr_y+38.5)

def movement_left():
    curr_y = label_snake.winfo_y()
    curr_x = label_snake.winfo_x() 
    if curr_x-0.1 <= 0:
        pass
    else:
        label_snake.place(relx=curr_x-0.1, rely=curr_y)    

# Setup GUI
root = tk.Tk()
myfont = font.Font(family="Arial", size=12)
root.title("Snake")
root.geometry("500x500")

# Creating base frame for placment of buttons and game area frame
frame_base = tk.Frame(root, width=500, height=500)

# Create buttons for movement
button_up = tk.Button(frame_base, text="Up", font=myfont, command=movement_up,)
button_right = tk.Button(frame_base, text="Right", font=myfont, command=movement_right)
button_down = tk.Button(frame_base, text="Down", font=myfont, command=movement_down)
button_left = tk.Button(frame_base, text="Left", font=myfont, command=movement_left)

# Placement of base frame and buttons
frame_base.pack()
button_up.place(relx=0.45, rely=0, relheight=0.1, relwidth=0.1)
button_right.place(relx=0.9, rely=0.45, relheight=0.1, relwidth=0.1)
button_down.place(relx=0.45, rely=0.9, relheight=0.1, relwidth=0.1)
button_left.place(relx=0, rely=0.45, relheight=0.1, relwidth=0.1)

# Create game area as second frame with 350x350 pixel
frame_game = tk.Frame(frame_base, bd=5, relief="groove")
frame_game.place(relx=0.15, rely=0.15, relwidth=0.7, relheight=0.7)

# Create game figure "Snake" as black label
label_snake = tk.Label(frame_game, bg="black")
label_snake.place(anchor="center", relx=0.5, rely=0.5, relheight=0.1, relwidth=0.1)

# helping labels
label1 = tk.Label(frame_game,bg="green")
label2 = tk.Label(frame_game,bg="blue")
label3 = tk.Label(frame_game,bg="red")
label4 = tk.Label(frame_game,bg="yellow")
label1.place(anchor="center", relx=0.4, rely= 0.1, relwidth=0.1, relheight=0.1)
label2.place(anchor="center", relx=0.4, rely= 0.2, relwidth=0.1, relheight=0.1)
label3.place(anchor="center", relx=0.4, rely= 0.3, relwidth=0.1, relheight=0.1)
label4.place(anchor="center", relx=0.4, rely= 0.4, relwidth=0.1, relheight=0.1)

root.mainloop()