# Getter and Setter functions
class Gene:
    def __init__(self, arg_name, arg_nr_nucleotide, arg_nr_readingframe, arg_nucleotide, arg_readingframe):
        if type(arg_name) == str:
            self.__name = arg_name
        else:
            raise TypeError("name needs to be a string")
        self.__name = arg_name                          # String
        self.__nr_nucleotide = arg_nr_nucleotide        # Positive intenger
        self.__nr_readingframe = arg_nr_readingframe    # Positive intenger
        self.nucleotide = arg_nucleotide                # Positive intenger
        self.readingframe = arg_readingframe            # Positive intenger

    def get_name(self):
        return self.__name
    
    def get_nr_nucleotide(self):
        return self.__nr_nucleotide
    
    def get_nr_readingframe(self):
        return self.__nr_readingframe
    
    def set_name(self, name):
        if type(name) != str:
            raise TypeError("Name needs to be a string!")
        else:
            self.__name = name
            print("__name was changed.")
    
    def set_nr_nucleotide(self, nuc):
        if nuc < 0:
            raise IndexError("Nucleotide must be > 0!")
        else:
            self.__nr_nucleotide = nuc
            print("__nr_nucleotide was changed.")

    def set_nr_readingframe(self, read):
        if read < 0:
            raise IndexError("Readingframe must be > 0!")
        else:
            self.__nr_readingframe = read
            print("__nr_readingframe was changed")

    def print_state(self):
        return print(f"name: {self.get_name()}\nnucleotide: {self.get_nr_nucleotide()}\nreadingframe: {self.get_nr_readingframe()}")

gene1 = Gene("GAPDH", 500, 200, 100, 50)
gene2 = Gene("EEA1", 665, 789654, 13, 87465)

print(gene1)
gene1.set_name("LIMP2")
gene1.set_nr_nucleotide(10)
print(gene1.get_name())
print(gene1.get_nr_nucleotide())
print(gene1.get_nr_readingframe())
print()

gene1.print_state()
gene2.print_state()