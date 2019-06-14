import cv2
cap = cv2.VideoCapture('rtsp://admin:123456@192.168.1.181:554/live/ch1')

while True:
    ret, frame = cap.read()
    cv2.namedWindow('frame',cv2.WINDOW_NORMAL)
    cv2.imshow('frame', frame)
    if cv2.waitKey(20) & 0xFF == ord('q'):
        break
cap.release()
cv2.destroyAllWindows()


# rtsp://admin:123456@192.168.1.177:554/live/ch1
# rtsp://admin:123456@192.168.1.62:554/live/ch1
# rtsp://admin:123456@192.168.1.181:554/live/ch1

