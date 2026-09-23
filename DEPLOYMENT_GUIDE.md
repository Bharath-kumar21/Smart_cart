# SmartCart - 100% Free PythonAnywhere Deployment Guide (SQLite)

This guide walks you through deploying your **SmartCart** Flask eCommerce application to **PythonAnywhere** completely **FREE** with **zero database configuration** using SQLite.

---

## Why SQLite?
- **100% Free**: No need to pay PythonAnywhere for external databases.
- **Zero Server Setup**: No database host, no database passwords, and no connection errors.
- **Built Right In**: SQLite is built into Python standard library and pre-populated with your products and admin account in `smartcart.db`.

---

## Step 1: Open a Bash Console on PythonAnywhere

1. Log in to [PythonAnywhere](https://www.pythonanywhere.com/).
2. Go to the **Consoles** tab and click **Bash** under **Start a new console**.
3. Clone your GitHub repository into your home directory:
   ```bash
   git clone https://github.com/Bharath-kumar21/Smart_cart.git smartcart
   cd smartcart
   ```

---

## Step 2: Create Virtual Environment & Install Packages

In the same Bash console, run:
```bash
mkvirtualenv --python=/usr/bin/python3.10 smartcart-env
pip install --upgrade pip
pip install -r requirements.txt
```
*(This will install Flask, Flask-Mail, bcrypt, razorpay, and xhtml2pdf in under 2 minutes)*.

---

## Step 3: Configure the Web App

1. Go to the **Web** tab on the PythonAnywhere dashboard.
2. Click **Add a new web app**.
3. Click **Next**, choose **Manual configuration** *(Important: Do NOT select "Flask")*, and pick **Python 3.10**.
4. After the web app is created, configure the paths in the **Web** tab:
   - **Virtualenv**: `/home/<your-username>/.virtualenvs/smartcart-env`
   - **Source code**: `/home/<your-username>/smartcart`
   - **Working directory**: `/home/<your-username>/smartcart`
   *(Replace `<your-username>` with your actual PythonAnywhere username)*.

---

## Step 4: Configure the WSGI File

1. In the **Web** tab under **Code**, click on the link next to **WSGI configuration file** (e.g. `/var/www/<your-username>_pythonanywhere_com_wsgi.py`).
2. Delete everything currently in the file.
3. Paste the following configuration:

```python
import sys
import os

# 1. Add project directory to python path
project_home = '/home/<your-username>/smartcart'
if project_home not in sys.path:
    sys.path.insert(0, project_home)

# 2. SQLite Database Path (Automatic & Free)
os.environ['DB_TYPE'] = 'sqlite'
os.environ['SQLITE_DB_PATH'] = os.path.join(project_home, 'smartcart.db')

# 3. Email Settings
os.environ['MAIL_SERVER'] = 'smtp.gmail.com'
os.environ['MAIL_PORT'] = '587'
os.environ['MAIL_USE_TLS'] = 'True'
os.environ['MAIL_USERNAME'] = 'bharatkumartalagana@gmail.com'
os.environ['MAIL_PASSWORD'] = 'dgqq kypd zsfu elku'

# 4. Razorpay Keys
os.environ['RAZORPAY_KEY_ID'] = 'rzp_test_TcBFYBENX0MBj5'
os.environ['RAZORPAY_KEY_SECRET'] = 'gbbrSL3GfHGkEPlwwrq7W1kN'

# 5. Import Flask app as application
from app import app as application
```
*(Remember to replace `<your-username>` with your PythonAnywhere username)*.
4. Click **Save** in the top right.

---

## Step 5: Configure Static Files (CSS, JS, Uploads)

1. Return to the **Web** tab and scroll down to the **Static files** section.
2. Add the following static directory mapping:
   - **URL**: `/static/`
   - **Directory**: `/home/<your-username>/smartcart/static`

---

## Step 6: Reload & Launch!

1. Scroll to the top of the **Web** tab.
2. Click the big green **Reload <your-username>.pythonanywhere.com** button.
3. Open your browser and visit:
   `https://<your-username>.pythonanywhere.com`

---

## Default Login Credentials
- **Admin Portal**: `https://<your-username>.pythonanywhere.com/admin-login`
  - **Email**: `bharatkumartalagana@gmail.com`
  - **Password**: *(Your existing admin password)*
