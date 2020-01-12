import RPi.GPIO as GPIO
import time
import os

servoPIN = 17
GPIO.setmode(GPIO.BCM)
GPIO.setup(servoPIN, GPIO.OUT)

p = GPIO.PWM(servoPIN, 50) # GPIO 17 for PWM with 50Hz
p.start(2.5) # Initialization
p.ChangeDutyCycle(5)
time.sleep(5)
p.ChangeDutyCycle(10)
time.sleep(5)
    

p.stop()
GPIO.cleanup()
