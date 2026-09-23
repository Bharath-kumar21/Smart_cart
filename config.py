import os

try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass

# Application Security
SECRET_KEY = os.environ.get("SECRET_KEY", "Bharath123")

# Database Configuration (MySQL)
DB_HOST = os.environ.get("DB_HOST", "localhost")
DB_USER = os.environ.get("DB_USER", "root")
DB_PASSWORD = os.environ.get("DB_PASSWORD", "abcd")
DB_NAME = os.environ.get("DB_NAME", "smartcart")

# Email SMTP Settings
MAIL_SERVER = os.environ.get("MAIL_SERVER", "smtp.gmail.com")
MAIL_PORT = int(os.environ.get("MAIL_PORT", 587))
MAIL_USE_TLS = str(os.environ.get("MAIL_USE_TLS", "True")).lower() in ("true", "1", "yes")
MAIL_USERNAME = os.environ.get("MAIL_USERNAME", "bharatkumartalagana@gmail.com")
MAIL_PASSWORD = os.environ.get("MAIL_PASSWORD", "dgqq kypd zsfu elku")   # Gmail App Password

# Razorpay Payment Gateway
RAZORPAY_KEY_ID = os.environ.get("RAZORPAY_KEY_ID", "rzp_test_TcBFYBENX0MBj5")
RAZORPAY_KEY_SECRET = os.environ.get("RAZORPAY_KEY_SECRET", "gbbrSL3GfHGkEPlwwrq7W1kN")
