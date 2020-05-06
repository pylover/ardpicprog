
PLATFORM = arduino:avr
FQBN = $(PLATFORM):uno
SKETCH = ProgramPIC 
FLAGS = -v
PORT = /dev/ttyACM0

.PHONY: sketch
sketch:
	arduino-cli $(FLAGS) compile --fqbn $(FQBN) $(SKETCH)

.PHONY: program
program:
	arduino-cli $(FLAGS) upload -p $(PORT) --fqbn $(FQBN) $(SKETCH)

.PHONY: env
env:
	arduino-cli core update-index
	arduino-cli core core install arduino:avr

.PHONY: clean
clean:
	arduino-cli cache clean
