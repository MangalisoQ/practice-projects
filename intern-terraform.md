 🛠️ Terraform Exercises

Welcome! These hands-on exercises are designed to help you learn Terraform by working with local and accessible providers — no cloud accounts required. You’ll get to create GitHub repositories, build a pet shop, and interact with public APIs, all from your local machine.

> 💻 Prerequisites:  
> - macOS machine  
> - [Terraform installed](https://developer.hashicorp.com/terraform/downloads)  
> - A GitHub personal access token (for Exercise 1)  
> - Basic command line knowledge  

---

## 📦 Exercise 1: Create a GitHub Repository

### 🎯 Objective
Use the [GitHub provider](https://registry.terraform.io/providers/integrations/github/latest/docs) to create a new repository. This will help you understand provider configuration, authentication, and resource creation.

### 🧭 Steps

1. Install Terraform and set up your terminal/editor.
2. Configure the GitHub provider using your **Personal Access Token (PAT)**.
3. Write Terraform configuration to:
   - Create a GitHub repository
   - Add basic settings

4. Run `terraform init` and `terraform apply`.
5. Verify the repository is live on your GitHub account.

### ✅ Requirements

- The repository must include a `README.md`.
- Add **at least one topic tag** (e.g., `terraform`, `intern-project`).
- Use variables for sensitive/configurable values like the PAT and repo name.

---

## 🐾 Exercise 2: The Terraform Pet Shop (Random Provider)

### 🎯 Objective
Create a fun virtual pet shop using the [random provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs) to generate pet characteristics. Learn how to manage multiple resources with `count` or `for_each`.

### 🧭 Steps

1. Create a new folder for the pet shop project.
2. Use random providers to generate:
   - Pet names
   - Ages
   - Characteristics (e.g., species, traits)

3. Store each pet's details in a separate `.json` file.
4. Create a summary inventory file listing all pets.

### ✅ Requirements

- Generate at least **5 pets**.
- Each pet must have:
  - A random name
  - A random age
  - A random characteristic
- Use `count` or `for_each` to manage resources.
- Create an inventory file that lists all pet details.

---

## 🔬 Exercise 3: Infrastructure Testing Playground (HTTP Provider)

### 🎯 Objective
Use the [HTTP provider](https://registry.terraform.io/providers/hashicorp/http/latest/docs) to call public APIs, process their responses, and build a simple dashboard.

### 🧭 Steps

1. Create a new project directory.
2. Configure the HTTP provider to send requests to:
   - `https://api.ipify.org`
   - `https://api.github.com/zen`
   - `https://icanhazdadjoke.com/`

3. Capture the API responses and store them in output files.
4. Generate a dashboard (e.g., Markdown or `.txt`) that summarizes the responses.

### ✅ Requirements

- Make **3 distinct HTTP requests**.
- Save each API response to a file.
- Display results in a formatted dashboard file.
- Implement error handling to manage failed or invalid responses.

---

## 📝 Notes

- Use `terraform init`, `terraform plan`, and `terraform apply` for each exercise.
- Follow best practices for using variables, outputs, and file structure.
- Keep your code in version control (Git) and make meaningful commits.

---

## 📁 Suggested Folder Structure

```
terraform-exercises/
├── exercise-1-github-repo/
├── exercise-2-pet-shop/
├── exercise-3-http-testing/
└── README.md
```
