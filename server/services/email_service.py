import smtplib
from email.message import EmailMessage
from config import Settings

settings = Settings()

class EmailService:
    def send_email(self, otp: str, email: str):
        # Email details
        sender_email = "noreply.otp.vedant@gmail.com"
        receiver_email = email
        subject = "OTP Verification for Algebra Quiz Game"
        body = f"Your OTP for Algebra Quiz Game is {otp}\n\nThis OTP will expire in 5 minutes.\nDo not share this OTP with anyone."

        # Create email message
        msg = EmailMessage()
        msg.set_content(body)
        msg["Subject"] = subject
        msg["From"] = sender_email
        msg["To"] = receiver_email

        # Send email
        try:
            with smtplib.SMTP("smtp.gmail.com", 587) as server:
                server.starttls()
                server.login(sender_email, settings.SMTP_GMAIL_APP_KEY)
                server.send_message(msg)
        except Exception as e:
            print(f"Error sending email: {e}")