from fastapi import FastAPI, WebSocket
from services.otp_service import OtpService

app = FastAPI()

otp_service = OtpService()

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