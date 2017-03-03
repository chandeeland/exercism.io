class Clock:

    def __init__(self, hours, minutes):
        self.minuteTime = hours * 60 + minutes

    def add(self, addMinutes):
        self.minuteTime += addMinutes
        return self

    def __str__(self):
        hours = str(self.minuteTime / 60 % 24).zfill(2)
        minutes = str(self.minuteTime % 60).zfill(2)
        return hours + ':' + minutes

    def __eq__(self, other):
        return str(self) == str(other)
