# MedExpiry Tracker API

This is a backend API for tracking medications nearing expiration.
Built with Django Rest Framework, it allows users to manage medication records, view upcoming expirations, and send alerts for drugs expiring within a specified period.

## Features
 
•	Add, update, and delete medications

•	View medications expiring within the next n days

•	Automatic alerts for near-expiry medications

•	RESTful API built using Django REST Framework

•	Supports filtering by expiry date

•	Deployed on AWS EC2

## Tech Stack
 
•	Backend: Django / Django REST Framework

•	Database: MySQL (hosted on AWS RDS or EC2)

•	Hosting: AWS EC2

•	Monitoring: CloudWatch / Prometheus

•	Version Control: Git & GitHub
________________________________________
## Installation and Setup

### 1. Clone the repository

   git clone https://github.com/doseman01/medexpiry-tracker-api.git

   cd medexpiry-tracker-api

### 2. Create and activate a virtual environment

   python3 -m venv venv

   source venv/bin/activate   

   On Windows: venv\Scripts\activate

### 3. Install dependencies

   pip install -r requirements.txt

### 4. Apply migrations

   python manage.py migrate

### 5. Run the development server
   python manage.py runserver
________________________________________

## API Endpoints

  Method	Endpoint	Description

  GET	/api/medications/	List all medications

  POST	/api/medications/	Add a new medication

  GET	/api/medications/expiring/?days=30	List medications expiring in the next 30 days

  PUT	/api/medications/{id}/	Update medication details

  DELETE	/api/medications/{id}/	Delete a medication
________________________________________
## Deployment

Deployed on AWS EC2 with environment variables stored securely.

The public subnet can act as a bastion host to allow ssh connection to the database securely

The database hosted on a private subnet can connect to the internet via a NAT Gateway for updates and security but not vice-versa.
________________________________________
## Author

Dosunmu Qudus

Cloud & DevOps Enthusiast | Pharmacist | Backend Developer

•	LinkedIn

•	GitHub
________________________________________
## License

This project is open-source and available under the MIT License.



