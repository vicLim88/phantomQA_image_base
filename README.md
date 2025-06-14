# PhantomQA BASE Image
Traditional automation tools are hardcoded. With the advent of the artificial intelligence, it is time to introduce our first ever digital robot, PhantomQA. Just like our physical humans, it will be able to serve as your digital administrative assistant, performing autonomous tasks and interaction with the respective OS that you are working on.

How this will work is, it harnesses the power of Nvidia tech stack to enable the above work.

## Vision
A cross-platform agent that can:    <br>
🔹 Perceive desktop UI elements     <br>
🔹 Interact with them autonomously  <br>
🔹 Execute commands and validations <br>
🔹 Report feedback                  <br>

## Technical Capability
### OS Interaction Support
Currently, PhantomQA is able to interact with the following OS: <br>
🪟 windows  <br>
🐧 linux    <br>
🍎 mac      <br>

### Capability Description
👀 Element Detection	Visual detection of UI elements (OCR, image matching, accessibility tree)   <br>
🖱️ Interaction Control	Simulate mouse, keyboard, window focus, drag-drop                            <br>
🧠 Context Awareness	Understand current app, window title, UI flow                               <br>
🪟 Cross-Platform	Must run on Ubuntu, Windows, macOS                                              <br>
🔄 Feedback Loop	Capture state after action to re-plan next steps                                <br>
📦 Deployable as container or service	Users can run it locally or orchestrate via K8s later       <br>

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