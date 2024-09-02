#!/bin/bash

# Define the root directory for the project
ROOT_DIR="cloudresumechallenge"

# Create the main project directory
mkdir -p $ROOT_DIR

# Create infrastructure directories
mkdir -p $ROOT_DIR/infra/bicep
mkdir -p $ROOT_DIR/infra/arm
mkdir -p $ROOT_DIR/infra/scripts

# Create frontend directories
mkdir -p $ROOT_DIR/frontend/src
mkdir -p $ROOT_DIR/frontend/public/assets

# Create backend directories
mkdir -p $ROOT_DIR/backend/src
mkdir -p $ROOT_DIR/backend/tests

# Create documentation directory
mkdir -p $ROOT_DIR/docs

# Create GitHub workflows directory
mkdir -p $ROOT_DIR/.github/workflows

# Create root files
touch $ROOT_DIR/.gitignore
touch $ROOT_DIR/LICENSE
touch $ROOT_DIR/README.md

# Create sample README files for subdirectories
echo "# Infrastructure" > $ROOT_DIR/infra/README.md
echo "# Frontend" > $ROOT_DIR/frontend/README.md
echo "# Backend" > $ROOT_DIR/backend/README.md
echo "# Documentation" > $ROOT_DIR/docs/README.md

# Create example workflow files
echo "# GitHub Actions CI/CD Workflow" > $ROOT_DIR/.github/workflows/ci.yml
echo "# GitHub Actions Deployment Workflow" > $ROOT_DIR/.github/workflows/cd.yml

# Create sample Bicep and ARM files
echo "// Main Bicep file for Azure infrastructure" > $ROOT_DIR/infra/bicep/main.bicep
echo "// Compiled ARM template from Bicep" > $ROOT_DIR/infra/arm/main.json

# Create example deployment scripts
echo "#!/bin/bash" > $ROOT_DIR/infra/scripts/deploy.sh
echo "# Example deploy script" >> $ROOT_DIR/infra/scripts/deploy.sh
chmod +x $ROOT_DIR/infra/scripts/deploy.sh

echo "#!/bin/bash" > $ROOT_DIR/infra/scripts/cleanup.sh
echo "# Example cleanup script" >> $ROOT_DIR/infra/scripts/cleanup.sh
chmod +x $ROOT_DIR/infra/scripts/cleanup.sh

# Create example frontend files
echo "<!-- Index HTML file for the frontend -->" > $ROOT_DIR/frontend/src/index.html
echo "/* Main CSS file for styling */" > $ROOT_DIR/frontend/src/styles.css
echo "// Main JavaScript file for frontend logic" > $ROOT_DIR/frontend/src/script.js

# Create example backend files
echo "# Backend Python Function App" > $ROOT_DIR/backend/src/function_app.py
echo "# Test for Backend Python Function App" > $ROOT_DIR/backend/tests/test_function_app.py

# Notify the user that the structure has been created
echo "Project structure created successfully in $ROOT_DIR!"
