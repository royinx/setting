import cv2
import sys
try:
	video_source = int(sys.argv[1])
except:
	video_source = str(sys.argv[1])
cap = cv2.VideoCapture(video_source)

while True:
    ret, frame = cap.read()
    cv2.imshow('frame', frame)
    if cv2.waitKey(20) & 0xFF == ord('q'):
        break
cap.release()
cv2.destroyAllWindows()
