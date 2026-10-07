"""
Aim of this exercise is to create a class called Plants that uses the
attributes Name, Height, Mass, Water reservoir, Sunlight reserve,
Nutrients and status.
Height and Mass start at 0. All values, excluding name, should stay in
definition range indicated as in plants_data.csv. The lower border is 0.
Name shall be a string and Height and Mass be numerical.
Water reservoir, Sunlight reserve and Nutrients shall be private
attributes. If any of these values reches zero, the status of thew plant should change.
If all three attributes reach 0 the plant dies and can not be 
resurected.

The class should have the methods mentioned in plants_methods.csv.
If the plant does not have enough reserves for a task, decrease the 
values of the attributes by 10% and print a warning
"""

class Plants:
    # Build constructor with all needed attributes. Name is a str, all else are int or float.
    def __init__(self, name, height, mass, water_reservoir, sunlight_reserve, nutrients, status):
        if type(name) != str:
            raise TypeError("Name must be a string!")
        else:
            self.name = name

        if type(height) != str and height == 0:
            self.height = height
        else:
            raise ValueError("Height must be 0!")
        
        if type(mass) == str:
            raise TypeError("Mass must be int or float")
        if mass == 0:
            self.mass = mass
        else:
            raise ValueError("Mass must be 0!")

        if type(water_reservoir) == str:
            raise TypeError("Water reservoir must be int or float")
        elif 0 <= water_reservoir and water_reservoir <= 25:
            self.__water_reservoir = water_reservoir
        else:
            raise ValueError("Water reservoir is out of range!")

        if type(sunlight_reserve) == str:
            raise TypeError("Sunlight reserve must be int or float")
        elif 0 <= sunlight_reserve <= 250:
            self.__sunlight_reserve = sunlight_reserve
        else:
            raise ValueError("Sunlight reserve is out of range!")
        
        if type(nutrients) == str:
            raise TypeError("Nutrients reserve must be int or float")
        elif 0 <= nutrients <= 1000:
            self.__nutrients = nutrients
        else:
            raise ValueError("Nutrients is out of range!")
        
        if type(status) != str:
            raise TypeError("Status must be a string!")
        elif status != "OK":
            raise ValueError("Status must be OK")
        else:
            self.status = status

        if (water_reservoir == 0 and sunlight_reserve == 0 and nutrients == 0) or (water_reservoir > 25 and sunlight_reserve > 250 and nutrients > 1000):
            status = "dead"
            print(f"Your plant is {status}")
     
    # Defining getter functions for attributes.

    # Defining setter functions for private attributes.
    def shading(self):
        self.__sunlight_reserve -= 3.3
        if self.__sunlight_reserve <= 0:
            print("The plant is withered")
    
    def sunbathing(self):
        self.__sunlight_reserve += 4.6
        if self.__sunlight_reserve > 250:
            print("The plant is burnt")

    def watering(self):
        self.__water_reservoir += 0.8
        if self.__water_reservoir > 25:
            print("The plant is overhydrated.")

    def drinking(self):
        self.__water_reservoir -= 1.3
        if self.__water_reservoir <= 0:
            print("The plant is dehydrated.")

    def feeding(self):
        self.__nutrients += 12.7
        if self.__nutrients > 1000:
            print("The plant is overfed")

    def eating(self):
        self.__nutrients -= 14.6
        # if self.__nutrients <= 0:
        #     print("The plant is malnourished")
    
    def growing(self):
        self.mass += 5
        self.height += 13
        self.__nutrients -= 17.9
        self.__water_reservoir -= 1.7
        self.__sunlight_reserve -= 5.7

    # Defining magic methods.
    def __str__(self):
        return f"Plant: {self.name}\nHeight: {self.height}\nMass: {self.mass}\nStatus: {self.status}"
    