# SmartCart - PythonAnywhere Deployment Guide

This guide walks you through deploying your **SmartCart** Flask + MySQL eCommerce application to **PythonAnywhere** step-by-step.

---

## Prerequisites
1. A free or paid account on [PythonAnywhere](https://www.pythonanywhere.com/).
2. Your PythonAnywhere **username** (e.g., `bharath`).
3. Your code pushed to GitHub (or uploaded via zip).

---

## Step 1: Set Up MySQL Database on PythonAnywhere

1. Log in to your [PythonAnywhere Dashboard](https://www.pythonanywhere.com/).
2. Navigate to the **Databases** tab.
3. Under **Database password**, set a new password and click **Change password**.
4. Under **Create a database**, type `smartcart` and click **Create database**.
   - Your database will be named: `<your-username>$smartcart`
   - Your database host is: `<your-username>.mysql.pythonanywhere-services.com`
   - Your database user is: `<your-username>`

---

## Step 2: Clone Code & Import Database

1. Go to the **Consoles** tab on PythonAnywhere.
2. Under **Start a new console**, click **Bash**.
3. Clone your repository into your home directory:
   ```bash
   git clone https://github.com/<your-github-username>/<your-repo-name>.git smartcart
   cd smartcart
   ```
4. Import the included `smartcart.sql` dump file into your PythonAnywhere database:
   ```bash
   mysql -u <your-username> -h <your-username>.mysql.pythonanywhere-services.com -p '<your-username>$smartcart' < smartcart.sql
   ```
   *(When prompted, enter the MySQL password you set in Step 1)*.

---

## Step 3: Create Virtual Environment & Install Dependencies

In the same Bash console, run:
```bash
mkvirtualenv --python=/usr/bin/python3.10 smartcart-env
pip install --upgrade pip
pip install -r requirements.txt
```
*(This will install only the necessary lightweight dependencies like Flask, mysql-connector-python, bcrypt, razorpay, and xhtml2pdf without exhausting free-tier disk limits)*.

---

## Step 4: Configure Web App on PythonAnywhere

1. Go to the **Web** tab in PythonAnywhere dashboard.
2. Click **Add a new web app**.
3. Click **Next**, choose **Manual configuration** *(Important: Do NOT click "Flask")*.
4. Select **Python 3.10**, then click **Next**.
5. After the web app is created, configure paths in the **Web** tab:
   - **Source code**: `/home/<your-username>/smartcart`
   - **Working directory**: `/home/<your-username>/smartcart`
   - **Virtualenv**: `/home/<your-username>/.virtualenvs/smartcart-env`

---

## Step 5: Configure the WSGI Configuration File

1. Still in the **Web** tab, under **Code**, click on the link next to **WSGI configuration file** (e.g. `/var/www/<your-username>_pythonanywhere_com_wsgi.py`).
2. Delete all existing code in the file.
3. Paste the following configuration (replace `<your-username>` and passwords with your actual values):

```python
import sys
import os

# 1. Add project directory to python path
project_home = '/home/<your-username>/smartcart'
if project_home not in sys.path:
    sys.path.insert(0, project_home)

# 2. Production Environment Variables
os.environ['SECRET_KEY'] = 'your_super_secret_key_12345'
os.environ['DB_HOST'] = '<your-username>.mysql.pythonanywhere-services.com'
os.environ['DB_USER'] = '<your-username>'
os.environ['DB_PASSWORD'] = '<your_mysql_password>'
os.environ['DB_NAME'] = '<your-username>$smartcart'

# 3. Email Settings
os.environ['MAIL_SERVER'] = 'smtp.gmail.com'
os.environ['MAIL_PORT'] = '587'
os.environ['MAIL_USE_TLS'] = 'True'
os.environ['MAIL_USERNAME'] = 'your_email@gmail.com'
os.environ['MAIL_PASSWORD'] = 'your_gmail_app_password'

# 4. Razorpay Gateway Keys
os.environ['RAZORPAY_KEY_ID'] = 'rzp_test_your_key_id'
os.environ['RAZORPAY_KEY_SECRET'] = 'your_razorpay_secret'

# 5. Import Flask app as application
from app import app as application
```

4. Click **Save** in the top right corner.

---

## Step 6: Configure Static Files (CSS, JS, Uploads)

1. Return to the **Web** tab.
2. Scroll down to the **Static files** section.
3. Add the following entry:
   - **URL**: `/static/`
   - **Directory**: `/home/<your-username>/smartcart/static`

---

## Step 7: Reload & Launch!

1. Scroll to the very top of the **Web** tab.
2. Click the big green **Reload <your-username>.pythonanywhere.com** button.
3. Visit your live site:
   `https://<your-username>.pythonanywhere.com`

---

## Troubleshooting Tips

- **Check Error Logs**: If your site displays an error, go to the **Web** tab and click on the **Error log** link under the **Log files** section.
- **PythonAnywhere Free Tier Whitelist**: On PythonAnywhere's free plan, outbound HTTP requests are restricted to an approved whitelist. `api.razorpay.com` and `smtp.gmail.com` are typically permitted. If Razorpay throws an API connection error, post on the PythonAnywhere forums to request `api.razorpay.com` be added to your whitelist or use test mode.
- **Default Admin Account**:
  - Email: `bharatkumartalagana@gmail.com`
  - Portal: `https://<your-username>.pythonanywhere.com/admin-login`
