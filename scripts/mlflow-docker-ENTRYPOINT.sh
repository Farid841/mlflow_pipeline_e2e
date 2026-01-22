#!/bin/bash
set -e

# Install any additional requirements
if [ -f "/app/requirements.txt" ]; then
    pip install --no-cache-dir -r /app/requirements.txt
fi


# Configure MLflow with OIDC support
export MLFLOW_BACKEND_STORE_URI="${MLFLOW_BACKEND_STORE_URI:-sqlite:///mlflow/mlflow.db}"
export MLFLOW_ARTIFACTS_DESTINATION="${MLFLOW_ARTIFACTS_DESTINATION:-}"
export MLFLOW_HOST="${MLFLOW_HOST:-0.0.0.0}"
export MLFLOW_PORT="${MLFLOW_PORT:-5000}"
# export AUTOMATIC_LOGIN_REDIRECT="${AUTOMATIC_LOGIN_REDIRECT:-true}"
# export DEFAULT_LANDING_PAGE_IS_PERMISSIONS="${DEFAULT_LANDING_PAGE_IS_PERMISSIONS:-false}"
export DEFAULT_MLFLOW_PERMISSION="${DEFAULT_MLFLOW_PERMISSIONS:-READ}"

# Log environment for debugging
echo "Starting MLflow with configuration:"
echo "  Backend Store URI: $MLFLOW_BACKEND_STORE_URI"
echo "  Artifacts Destination: $MLFLOW_ARTIFACTS_DESTINATION"
echo "  OIDC Discovery URL: $OIDC_DISCOVERY_URL"
echo "  OIDC Client ID: $OIDC_CLIENT_ID"


# Start MLflow server
# mlflow server --app-name oidc-auth --host "$MLFLOW_HOST" --port "$MLFLOW_PORT"

mlflow server --app-name oidc-auth --backend-store-uri "$MLFLOW_BACKEND_STORE_URI" --default-artifact-root "$MLFLOW_ARTIFACTS_DESTINATION" --host "$MLFLOW_HOST" --port "$MLFLOW_PORT"
