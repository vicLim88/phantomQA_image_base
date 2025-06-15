import cv2
import mss
import mss.tools
import os
import pyautogui
from paddleocr import PaddleOCR

class Perception:
    def __init__(self, use_gpu=False, save_dir="feedback/screenshots"):
        self.ocr = PaddleOCR(show_log=False, use_angle_cls=True,use_gpu=use_gpu)
        self.save_dir = save_dir
        os.makedirs(self.save_dir, exist_ok=True)

    def capture_screen(self, filename="screenshot.png"):
        path = os.path.join(self.save_dir, filename)
        with mss.mss() as sct:
            monitor = sct.monitors[0]
            screenshot = sct.grab(monitor)
            mss.tools.to_png(screenshot.rgb, screenshot.size, output=path)
        print(f"[Perception] Screenshot saved to {path}")
        return path
    
    def detect_text(self, image_path):
        results = self.ocr.ocr(image_path)
        if not results or not isinstance(results, list) or results[0] is None:
            print(f"[Perception] ❌ OCR returned None or invalid structure for {image_path}")
            return []
        
        ui_elements = []

        for line in results[0]:
            box, (text, score) = line
            print(f"[Perception] [{score:.2f}] {text} → at {box}")
            ui_elements.append({
                "text": text,
                "score": score,
                "box": box
            })
        return ui_elements