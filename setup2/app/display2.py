# webcam.py

import cv2
import numpy as np

def capture_video():
    cap_rgb = cv2.VideoCapture(0)
    cap_ir = cv2.VideoCapture(2)
    while True:
        ret, frame_rgb = cap_rgb.read()
        ret, frame_ir = cap_ir.read()
        #frame = cv2.resize(frame, None, fx=3, fy=3, interpolation=cv2.INTER_LANCZOS4)
        # cv2.imshow('Input', frame_rgb)
        # cv2.imshow('Input', frame_ir)

        # Resize frames to have the same height (adjust width accordingly)
        frame_rgb = cv2.resize(frame_rgb, (640, 480))
        frame_ir = cv2.resize(frame_ir, (640, 480))
        
        # Concatenate frames horizontally
        side_by_side = np.concatenate((frame_rgb, frame_ir), axis=1)

        # Display the side-by-side frames
        cv2.imshow('Side-by-Side Streams', side_by_side)

        c = cv2.waitKey(1)
        if c == 27:
            break

    cap_rgb.release()
    cap_ir.release()
    cv2.destroyAllWindows()

def main():
    capture_video()


if __name__ == '__main__':
    main()