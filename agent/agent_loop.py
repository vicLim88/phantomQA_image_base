# agent/agent_loop.py
from agent.perception import Perception

def main():
    print("[PhantomQA] Agent loop initialized.")

    vision = Perception(use_gpu=True)
    image_path = vision.capture_screen()
    elements = vision.detect_text(image_path)

    print(f"[PhantomQA] Detected {len(elements)} elements.")


if __name__ == "__main__":
    main()
