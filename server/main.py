from fastapi import FastAPI, WebSocket
from services.otp_service import OtpService
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

otp_service = OtpService()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://algebraquizapp.netlify.app/"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.websocket("/ws/otp")
async def websocket_otp_endpoint(websocket: WebSocket):
    await websocket.accept()

    try:
        data = await websocket.receive_json()
        email = data.get("email")
        otp = otp_service.send_otp(email)
        await websocket.send_json({"otp": otp})
    except Exception as e:
        print(f"Error: {e}")
    finally:
        await websocket.close()