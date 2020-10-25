class MPNeuron(object):
    def __init__(self, threshold, inputs):
        self.threshold = threshold
        self.inputs = inputs

    def activate(self):
        excitations = 0 
        for trigger in self.inputs:
            if trigger.excitatory:
                excitations += trigger.value
            else:
                if trigger.value:
                    return 0
        if excitations >= self.threshold:
            return 1 
        return 0 

class MPInput(object):
    def __init__(self, excitatory):
        self.excitatory = excitatory
        self.value = 0 

    def trigger(self, value):
        self.value = value


def AND(x1, x2):
    inputs = [MPInput(True), MPInput(True)]
    gate = MPNeuron(2, inputs)
    inputs[0].trigger(x1)
    inputs[1].trigger(x2)
    return gate.activate()

def OR(x1, x2):
    inputs = [MPInput(True), MPInput(True)]
    gate = MPNeuron(1, inputs)
    inputs[0].trigger(x1)
    inputs[1].trigger(x2)
    return gate.activate()

def NOT(x):
    inputs = [MPInput(False)]
    gate = MPNeuron(0, inputs)
    inputs[0].trigger(x)
    return gate.activate()

