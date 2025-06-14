# PhantomQA BASE Image

## File Structure
```
phantomqa-base/
├── 📁 agent/
│   ├── 📄 perception.py      # Uses PaddleOCR + OpenCV, or TRT/YOLO + NVIDIA Triton
│   ├── 📄 action.py          # OS input simulation (with OS adapters)
│   ├── 📄 cognition.py       # Agentic logic (future: NeMo or Riva)
│   └── 📄 agent_loop.py      # Controls Perception → Cognition → Action
│
├── 📁 nvidia/
│   ├── 📄 tensorrt_runner.py    # Optional fast inference
│   └── 📄 isaac_adapter.py      # (future) bridge with Isaac Sim for robot scenarios
│
├── 📁 platform/
│   ├── 🪟 windows.py         # win32api, pywinauto
│   ├── 🐧 linux.py           # xdotool, pygetwindow
│   └── 🍎 mac.py             # pyobjc, AppleScript
│
├── 🐳 Dockerfile             # Based on NVIDIA PyTorch or L4T runtime
└── 📄 requirements.txt
```