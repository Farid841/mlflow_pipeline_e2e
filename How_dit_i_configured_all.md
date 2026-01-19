https://github.com/mlflow-oidc/mlflow-oidc-auth

command

"bash
python3 -m venv venv
source venv/bin/activate
python3 -m pip install mlflow-oidc-auth[full]


mlflow server --app-name oidc-auth --host 0.0.0.0 --port 8080

"

--- 
creation du codker compose avec mino et postgres.
as recommanded to do in ![dd](<Screenshot from 2026-01-19 14-51-21.png>)

et le docker compose est inspiser depuis cette origine : https://github.com/mlflow/mlflow/tree/master/docker-compose

