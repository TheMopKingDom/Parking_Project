from imutils.video import VideoStream
from pyzbar import pyzbar
import RPi.GPIO as GPIO
import argparse
import datetime
from time import sleep
import time
import mysql.connector
import imutils
import cv2
import csv
import os

ap = argparse.ArgumentParser()
ap.add_argument("-o","--output", type=str, default="Scanin.csv",
                help="path to output CSV file containing barcodes")
args = vars(ap.parse_args())

print("[INFO] starting video stream...")
vs = VideoStream(usePiCamera=True).start()
time.sleep(2.0)

#csv = open(args["output"], "w")
found = set()
 
while True:
    frame = vs.read()
    frame = imutils.resize(frame, width=400)
    barcodes = pyzbar.decode(frame)

    for barcode in barcodes:
        (x,y,w,h) = barcode.rect
        cv2.rectangle(frame, (x,y), (x + w, y + h), (0,0, 255), 2)
        os.system("cd /home/pi/Desktop/test $")
        os.system("python3 testrelay.py") 
        barcodeData = barcode.data.decode("utf-8")
        barcodeType = barcode.type
        text = "{} ({})".format(barcodeData, barcodeType)
        cv2.putText(frame, text, (x, y - 10),
                    cv2.FONT_HERSHEY_SIMPLEX,0.5, (0, 0, 255), 2)

        if barcodeData not in found:
            Time_in = format(datetime.datetime.now())
            User_id = barcodeData
            found.add(barcodeData)
            
            print(Time_in)
            print(User_id)

            
            db = mysql.connector.connect(host='192.168.1.96',database='park',user='parking',password='parking')
            cur = db.cursor()
            sql = "INSERT INTO transac(Time_in,User_id) VALUES(%s,%s)"
            val = (Time_in,User_id)
            cur.execute(sql,val)
            print(cur.rowcount,"Record Inserted")

            
            db.commit()
            cur.close()
            

           
    
    cv2.imshow("Barcode Scanner", frame)
    key = cv2.waitKey(1) & 0xFF
    

    if key == ord("q"):
        break
    
 

print("[INFO] cleaning up...")

cv2.destroyAllWindows()
vs.stop()
close()
