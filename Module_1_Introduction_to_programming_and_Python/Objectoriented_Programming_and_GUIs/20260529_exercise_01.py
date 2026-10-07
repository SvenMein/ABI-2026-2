# Classes
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


Gapdh = Gene("GAPDH", 500, 200, 552, 123)
print(Gapdh)
print(Gapdh.nucleotide)
print(Gapdh.readingframe)