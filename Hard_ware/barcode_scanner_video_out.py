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
        barcodeData = barcode.data.decode("utf-8")
        barcodeType = barcode.type
        text = "{} ({})".format(barcodeData, barcodeType)
        cv2.putText(frame, text, (x, y - 10),
                    cv2.FONT_HERSHEY_SIMPLEX,0.5, (0, 0, 255), 2)

        if barcodeData not in found:
            User_id = barcodeData
            found.add(barcodeData)
            
            print(User_id)
            #DB Com-

            db = mysql.connector.connect(host="127.0.0.1",database="park",user="parkman",passwd="manpass")
            cur = db.cursor()

            timewhen = format(datetime.datetime.now())
            tainID=(User_id,timewhen)
            commix="SELECT TIMESTAMPDIFF(SECOND,(SELECT Time_out FROM transac WHERE User_id=%s ORDER BY Tran_id DESC LIMIT 1),(%s))"
            cur.execute(commix,tainID)
            myresult = cur.fetchone()
            sqlcom ='SELECT Status FROM payment WHERE User_id=%s ORDER BY Pay_id DESC LIMIT 1'
            val = (User_id, )
            cur.execute(sqlcom,val)
            myresultst = cur.fetchone()

            db.commit()
            cur.close()

            if ((myresult[0]<=900)&&(myresultst[0]=="approve")):
                os.system("cd /home/pi/Desktop/test $")
                os.system("python3 testrelay.py") 
                print('time = '+str(myresult[0]) +' :can pass out')
            elif ((myresult[0]>900)||(myresultst[0]==null)):
                print('time = '+str(myresult[0]) +' :can\'t out')
            else :
                print('error 404')
 
            

    cv2.imshow("Barcode Scanner", frame)
    key = cv2.waitKey(1) & 0xFF
    

    if key == ord("q"):
        break
    
 

print("[INFO] cleaning up...")

cv2.destroyAllWindows()
vs.stop()
close()
