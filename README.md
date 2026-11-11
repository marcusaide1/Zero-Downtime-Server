
A Go backend application packaged with Docker, with GitHub Actions workflows and Terraform configuration in the repository.

This project brings together application containerization and infrastructure/deployment automation. The repository name describes the intended deployment goal; actual zero-downtime behaviour depends on the deployment workflow and infrastructure configuration.
Repository Structure
Zero-Downtime-Server/
├── .github/
│   └── workflows/   # GitHub Actions workflow definitions
├── .gitignore       # Files excluded from version control
├── dockerfile       # Docker image build instructions
├── main.go          # Go backend application
└── main.tf          # Terraform infrastructure configuration

Technologies
- Go — backend application
- Docker — containerization
- GitHub Actions — CI/CD workflow automation
- Terraform — Infrastructure as Code
- AWS — cloud infrastructure, if configured in main.tf
- Git and GitHub — source control and workflow hosting

Project Components
Go application (main.go)
Contains the backend application code. Review this file to identify the application's routes, listening port, configuration, and runtime dependencies.
Docker (dockerfile)
Defines how the Go application is packaged into a Docker image. The Dockerfile determines the build process, runtime image, exposed port, and startup command.
GitHub Actions (.github/workflows/)
Contains workflow definitions for automating repository tasks. Depending on the YAML configuration, these workflows may build, test, package, publish, or deploy the application.
Terraform (main.tf)
Contains infrastructure-as-code configuration. Review the file to confirm which cloud resources are provisioned and how the application deployment environment is configured.

Prerequisites
Install the tools required for the parts of the project you want to run:
- Go
- Docker
- Terraform (for infrastructure provisioning)
- Git
- AWS CLI and appropriately scoped AWS credentials (if main.tf provisions AWS resources)

Getting Started
1. Clone the repository
git clone https://github.com/marcusaide1/Zero-Downtime-Server.git
cd Zero-Downtime-Server
2. Run the Go application locally
go run .
If the project does not include a go.mod file, or the command above does not work with its current Go setup, follow the module/build configuration in the repository or run:
go run main.go
The port, routes, and any required environment variables are defined by the application code. Check main.go before configuring local access.
3. Build the Docker image
Run this command from the repository root:
docker build -f dockerfile -t zero-downtime-server .
4. Run the container
docker run --rm --name zero-downtime-server zero-downtime-server
If the application listens on a known port, publish it to the host. For example, if it listens on port 8080:
docker run --rm --name zero-downtime-server -p 8080:8080 zero-downtime-server
Replace 8080 with the actual port used by main.go and the Dockerfile. Add any required environment variables with Docker's -e option.
Infrastructure Provisioning with Terraform
If main.tf defines the infrastructure for this project, initialize and review it before applying:
terraform init
terraform fmt -check
terraform validate
terraform plan
Review the plan carefully. If it matches the resources you intend to create, apply it:
terraform apply
Use AWS credentials with only the permissions required by the configuration. Do not commit access keys, passwords, private keys, Terraform state files, or other secrets to the repository.



Security Notes
- Keep AWS credentials and deployment secrets out of source control.
- Use GitHub Actions secrets or an appropriate identity-based authentication method.
- Restrict inbound network access to only the ports and sources required.
- Use maintained base images and update application dependencies.
- Review Terraform plans before applying infrastructure changes.

