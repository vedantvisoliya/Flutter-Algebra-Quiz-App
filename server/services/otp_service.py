from random import randint
from services.email_service import EmailService

email_service = EmailService()

class OtpService:

    def generate_otp(self):
        return str(randint(100000, 999999))

    def send_otp(self, email: str):
        otp = self.generate_otp()
        email_service.send_email(otp, email)
        return otp