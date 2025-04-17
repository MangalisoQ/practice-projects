## Docker Practice
- Multi-container Docker application with Nginx reverse proxy, frontend, and backend services.

### Prerequisites
- Docker
- Docker Compose

### Services
**frontend**: Frontend service serving the web application.
**backend**: Backend service handling API requests.
**nginx**: A reverse proxy for routing requests to the frontend and backend services.

## How to run the application

```bash
sh
git clone url
cd rep
```
### Build Docker Images

```bash
sh
docker-compose build
```

### Run

```bash
sh
docker-compose up
```

- Application running on: [http://localhost](http://localhost)
