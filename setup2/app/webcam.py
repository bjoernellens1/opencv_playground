# webcam.py

import cv2

def capture_video():
    cap = cv2.VideoCapture(2)
    while True:
        ret, frame = cap.read()
        frame = cv2.resize(frame, None, fx=3, fy=3, interpolation=cv2.INTER_LANCZOS4)
        cv2.imshow('Input', frame)

        c = cv2.waitKey(1)
        if c == 27:
            break

    cap.release()
    cv2.destroyAllWindows()

def main():
    capture_video()


if __name__ == '__main__':
    main()