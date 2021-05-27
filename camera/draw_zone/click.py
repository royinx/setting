import cv2
import sys
import numpy as np

coor = []

def capture(event,x,y,flags,param):
    global mouseX, mouseY
    if event == cv2.EVENT_LBUTTONDOWN:
        coor.append((x,y))
        font = cv2.FONT_HERSHEY_SIMPLEX
        im = cv2.putText(frame, str(x) + ',' +
                            str(y), (x,y), font,
                            1, (255, 255, 255), 2)

        im_cp = cv2.fillPoly(im.copy(), np.array([coor], dtype=np.int32), (0, 0, 255))
        im=cv2.addWeighted(im,0.7,im_cp,0.3,0)
        # cv2.imshow(self.window_name, canvas)
        # im = cv2.polylines(im,coor,True,(0,255,255))
        cv2.imshow('image', im)
        
if __name__=="__main__":
    cv2.namedWindow('image',cv2.WINDOW_NORMAL)
    cv2.setMouseCallback('image',capture)

    cam = False
    if cam:
        try:
            video_source = int(sys.argv[1])
        except:
            video_source = str(sys.argv[1])
        cap = cv2.VideoCapture(video_source)
        while not ret: #while no frame , keep capture
            try:
                ret, frame = cap.read()
            except:
                pass
        cap.release()
    else:
        frame = cv2.imread("4k.jpg")
    cv2.imshow('image', frame)


    cv2.waitKey(0)

    print(coor)
    np.save("utils/coor.npy",np.array(coor,dtype=np.int32))
    x = np.load("utils/coor.npy")
    # print(x.shape)
    cv2.destroyAllWindows()

