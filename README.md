# Logo Identification

## Setup Instructions

Follow these steps to set up and run the application.

### 1. Clone the Repository (Including Submodules)
```sh
git clone --recurse-submodules https://github.com/Logo-Recognition/logo-system.git
cd logo-system
```

If you have already cloned the repository without submodules, you can initialize and update them manually:
```sh
git submodule update --init --recursive
```

### 2. Create the `.env` File
Copy the example environment file and modify it as needed:
```sh
cp .env.example .env
```
Ensure that all required environment variables are correctly set in `.env`. The important variables include:
```env
API_PORT=5000
DB_PORT=5432
MINIO_API_PORT=9000
MINIO_CONSOLE_PORT=9001
FRONTEND_PORT=8080
MODEL_PATH=/path/to/your/model/directory
DB_USER=your_db_username
DB_PASSWORD=your_db_password
MINIO_ACCESS_KEY=your_minio_access_key
MINIO_SECRET_KEY=your_minio_secret_key
TWEEPY_BEARER_TOKEN_MAIN=my_tweepy_bearer_token
TWEEPY_API_KEY_MAIN=my_tweepy_api_key
TWEEPY_API_SECRET_MAIN=my_tweepy_api_secret
TWEEPY_ACCESS_TOKEN_MAIN=my_tweepy_access_token
TWEEPY_ACCESS_TOKEN_SECRET_MAIN=my_tweepy_access_token_secret
```
- Set `MODEL_PATH` to the directory where you place your model files.
- Change other ports if needed to avoid conflicts.

#### **Environment Variables Explanation**
Below are the environment variables used in this project:

##### **Database Variables**
- `DB_USER` → The username for connecting to the PostgreSQL database.
- `DB_PASSWORD` → The password for the database user.

##### **MinIO (Object Storage) Variables**
- `MINIO_ACCESS_KEY` → The access key (like a username) for MinIO. Used for authentication.
- `MINIO_SECRET_KEY` → The secret key (like a password) for MinIO. Used for authentication.

##### **Twitter API (Tweepy) Variables**
These variables are used to authenticate and interact with the Twitter API using **Tweepy**.
- `TWEEPY_BEARER_TOKEN_MAIN` → Bearer token for Twitter API authentication (used for OAuth 2.0).
- `TWEEPY_API_KEY_MAIN` → API key for accessing Twitter API.
- `TWEEPY_API_SECRET_MAIN` → API secret key, used with the API key for authentication.
- `TWEEPY_ACCESS_TOKEN_MAIN` → OAuth access token, used for making authenticated requests on behalf of a user.
- `TWEEPY_ACCESS_TOKEN_SECRET_MAIN` → The secret key for the access token, required for secure API authentication.

### 3. Download the Required Model
Download the necessary model and class name files (on release) and place them in the directory of your choice. Then, set the `MODEL_PATH` variable in the `.env` file to point to this directory.
```sh
# Edit .env and set MODEL_PATH=/path/to/your/model/directory
```
When running the application, this directory will be mapped as a volume inside the container.

### 4. Start the Application with Docker Compose
Run the following command to start the application:
```sh
docker-compose up -d
```
This will build and start all required services in detached mode.

### 5. Verify the Setup
Check if the containers are running:
```sh
docker ps
```

If you encounter any issues, check the logs:
```sh
docker-compose logs -f
```

### Additional Notes
- Make sure Docker and Docker Compose are installed on your system.
- If any configuration changes are made, restart the containers with:
  ```sh
  docker-compose down && docker-compose up -d --build
  ```
- The `frontend`, `backend`, `database`, and `MinIO` services all use ports defined in `.env`. Modify them as needed to fit your setup.

